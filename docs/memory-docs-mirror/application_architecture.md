# Project Buried Memory application architecture

This document describes the runtime architecture of the FFXIV 1.23b server emulator, including the launcher and web-login boundary, the three .NET server processes, shared persistence, authored Lua content, and supporting operational tools.

## System architecture

```mermaid
flowchart TB
    player["Player"]
    admin["Operator / administrator"]

    subgraph ClientSide["Client side"]
        launcher["Meteor Launcher<br/>Authenticates and starts ffxivgame.exe"]
        game["FFXIV 1.23b Client<br/>Legacy binary protocol"]
    end

    subgraph WebTier["PHP web tier"]
        login["Login endpoint<br/>Credential verification and session creation"]
        panel["Control panel<br/>Account management"]
        auction["Auction house<br/>Listings, purchases, retainers"]
        version["Version-check endpoint"]
    end

    subgraph Net10Solution["Meteor.sln — .NET 10 server processes"]
        lobby["Lobby Server<br/>TCP 54994<br/><br/>• Blowfish handshake<br/>• Session and client-version validation<br/>• World and character lists<br/>• Character creation and selection<br/>• World-server handoff"]

        world["World Server<br/>TCP 54992<br/><br/>• Zone and chat channels<br/>• Global player sessions<br/>• World/Map routing<br/>• Chat and tells<br/>• Parties and invitations<br/>• Linkshells and retainers<br/>• Cross-zone transitions"]

        subgraph MapProcess["Map Server — TCP 1989 by default"]
            mapnet["Network and session layer<br/>World-server connection<br/>Ordered packet dispatch"]
            simulation["WorldManager<br/>50 ms fixed-step coordinator<br/>Frame-exclusive control and global systems"]
            mailboxes["Serial per-zone mailboxes<br/>Host-sized fixed worker pool<br/>One zone lane includes all of its instances"]
            actors["Actor model<br/>Players, NPCs, monsters,<br/>items, groups and directors"]
            gameplay["Gameplay systems<br/>Combat, AI, quests, crafting,<br/>gathering, fishing and progression"]
            content["Content managers<br/>Dungeons, primals, skirmishes,<br/>behests, hamlets and guildleves"]
            lua["MoonSharp Lua engine<br/>NPCs, quests, commands,<br/>effects, actions and directors"]
            navigation["Navigation<br/>SharpNav, navmeshes,<br/>escort and quick-nav routes"]

            mapnet -->|"Gameplay packet → owning zone<br/>Control/zoning → exclusive lane"| simulation
            simulation --> mailboxes
            mailboxes --> actors
            simulation --> gameplay
            simulation --> content
            gameplay <--> lua
            actors <--> lua
            content <--> lua
            actors <--> navigation
        end

        common["Meteor.Common<br/>Shared class library<br/><br/>• BasePacket / SubPacket framing<br/>• Compression and encryption<br/>• Binary serialization helpers<br/>• INI configuration<br/>• Logging and utilities"]

        lobby -. "references" .-> common
        world -. "references" .-> common
        mapnet -. "references" .-> common
    end

    subgraph PersistentData["Persistent and authored data"]
        mysql[("MySQL<br/>ffxiv_server")]
        configs["INI configuration<br/>lobby_config.ini<br/>world_config.ini<br/>map_config.ini"]
        scripts["Data/scripts<br/>Lua gameplay content"]
        sql["Data/sql<br/>Schema, game data,<br/>runtime migrations"]
        assets["Runtime files<br/>staticactors.bin<br/>navmeshes and routes"]
        logs["NLog output and<br/>Map crash diagnostics"]
    end

    subgraph Development["Development and operations"]
        tests["Standalone test harnesses<br/>Fishing, spawning, parties,<br/>quests, materia, level sync, etc."]
        tools["Reverse-engineering and<br/>content-generation tools"]
        console["Server consoles<br/>Commands, reloads and shutdown"]
    end

    player --> launcher
    launcher -->|"HTTPS credentials"| login
    login -->|"Create or refresh session"| mysql
    launcher -->|"Starts and patches endpoint"| game
    launcher --> version

    game -->|"Encrypted lobby protocol"| lobby
    lobby -->|"Validate session;<br/>characters and world list"| mysql
    lobby -->|"World address + session handoff"| game

    game -->|"Zone and chat channels"| world
    world -->|"Accounts, characters,<br/>social state and routing data"| mysql
    world <-->|"Session begin/end,<br/>game packets, zone changes,<br/>party and presence synchronization"| mapnet
    world -->|"Routes gameplay packets"| game

    simulation <-->|"Load game data;<br/>save character state"| mysql
    lua -->|"Loads authored behavior"| scripts
    navigation --> assets

    lobby --> configs
    world --> configs
    mapnet --> configs
    sql -->|"Imports and migrations"| mysql

    panel <-->|"Account data"| mysql
    auction <-->|"Items, listings,<br/>characters and retainers"| mysql
    admin --> panel
    admin --> auction
    admin --> console
    console --> lobby
    console --> world
    console --> mapnet

    lobby --> logs
    world --> logs
    mapnet --> logs

    tests -.-> gameplay
    tests -.-> world
    tools -.-> scripts
    tools -.-> sql
    tools -.-> assets
```

## Login and gameplay flow

```mermaid
sequenceDiagram
    actor Player
    participant Launcher
    participant PHP as PHP Login
    participant DB as MySQL
    participant Client as FFXIV Client
    participant Lobby
    participant World
    participant Map

    Player->>Launcher: Enter credentials
    Launcher->>PHP: Authenticate
    PHP->>DB: Verify user and create/refresh session
    DB-->>PHP: Session token
    PHP-->>Launcher: sessionId
    Launcher->>Client: Start with session token and patched lobby host

    Client->>Lobby: Secure handshake
    Lobby->>DB: Validate session and client version
    Lobby-->>Client: Accounts, worlds, characters
    Client->>Lobby: Select character
    Lobby->>DB: Resolve character and world address
    Lobby-->>Client: World endpoint and handoff token

    Client->>World: Open zone/chat channels
    World->>DB: Load character and current zone
    World->>Map: Begin Map session
    Map->>DB: Load gameplay and character state
    Map-->>World: Session-begin confirmation
    World-->>Client: Login, social state and routed game packets

    loop Active gameplay
        Client->>World: Game packet
        World->>Map: Route to owning Map Server
        Map->>Map: Simulation, AI, Lua and content processing
        Map->>DB: Persist relevant state
        Map-->>World: Result packets
        World-->>Client: Deliver results
    end

    opt Zone moves to another Map Server
        Map->>World: Zone-change request
        World->>Map: End current Map session
        World->>Map: Begin destination Map session
        World-->>Client: Complete zone transition
    end
```

## Responsibility boundaries

- **Lobby Server** owns authentication handoff, client-version validation, world discovery, and character selection and management.
- **World Server** owns global sessions, social systems, chat, and routing between clients and Map Servers.
- **Map Server** owns authoritative gameplay simulation, zones, actors, combat, scripted content, and most character-state persistence.
- **MySQL** is the shared persistent store for every server process and the PHP web tier.
- **Lua scripts** provide authored gameplay behavior inside the Map Server through MoonSharp.
- **Meteor.Common** defines shared packet framing, compression, encryption, serialization, configuration, logging, and utility behavior.

## Configuration and scaling notes

- Lobby Server listens on TCP port `54994` by default.
- World Server listens on TCP port `54992` by default.
- Map Server listens on TCP port `1989` by default.
- `servers` rows determine the World endpoint returned to the client by Lobby Server.
- `server_zones.serverIp` and `server_zones.serverPort` assign zones to Map Server processes. World Server groups rows by endpoint and connects to each configured Map Server.
- Multiple Map Server processes can therefore own different sets of zones while one World Server maintains global session and social state.
- Lobby and World packet dispatchers use every logical processor available to their processes. Per-connection drains preserve packet order; World session/name registries and Lobby connection cleanup have explicit cross-connection synchronization.
- Inside each Map Server, `zone_worker_count=0` uses every available logical processor up to the owned-zone count. Values `2-256` set an explicit per-zone worker count, while `1` selects the guarded legacy timer as an operational fallback.
- The 50 ms coordinator schedules different zones concurrently, but each zone and all of its private/content instances own one serial mailbox. A frame barrier completes all zone work before global managers run, and missed deadlines are skipped rather than overlapped or replayed.
- Gameplay packets are synchronously routed through the player's current zone mailbox, preserving World-connection packet order. Login/logout, hard zoning, content entry, disconnected-session recovery, and other cross-zone mutations use the frame-exclusive lane.
- Delayed instance, director, mob-event, Lua `Wait()`/signal, and zoning sequences release their worker while awaiting time or client settlement. Their next state-changing phase is posted back to the same owner mailbox (or reacquires the exclusive lane for a cross-zone transition), so an `await`, timer, or signal callback never silently abandons simulation ownership. Lua timed waits are polled by the 50 ms fixed-step coordinator rather than a separate `System.Threading.Timer`, and retain the public/private/content area where the coroutine suspended.
- Database persistence that does not need an immediate result uses the bounded deferred database writer. Simulation-critical reads and transactional transitions remain synchronous so gameplay cannot observe a save or load that has not completed.
- All ports and bind addresses are configuration-driven and can be overridden by launch arguments.

## Primary implementation references

- `Lobby Server/PacketProcessor.cs` — lobby authentication, world listing, character management, and handoff.
- `World Server/Server.cs` — client connections, session routing, and Map Server packet forwarding.
- `World Server/WorldMaster.cs` — zone ownership, Map Server connections, and cross-zone transitions.
- `Map Server/Server.cs` — Map process startup, data loading, World connection, and session lifecycle.
- `Map Server/WorldManager.cs` — zones, actors, content systems, simulation, and persistence coordination.
- `Map Server/Utils/FixedStepMailboxScheduler.cs` — per-zone serial ownership, fixed workers, frame barrier, awaited-continuation affinity, and exclusive cross-zone work.
- `tools/zone-mailbox-tests` — deterministic concurrency checks for same-zone exclusion, different-zone parallelism, the exclusive frame gate, async continuation affinity, and a real public-zone/content-instance entry, ticking, re-entry lookup, return, and teardown lifecycle.
- `Map Server/Lua/LuaEngine.cs` — MoonSharp registration, authored-script execution, thread-safe wait registries, and area-affined timed/signal coroutine resumption.
- `Common Class Lib/BasePacket.cs` and `Common Class Lib/SubPacket.cs` — shared binary protocol framing.
- `Data/www/login` — PHP login, control panel, and auction-house surfaces.
- `Data/sql` — database schema, game data, and migrations.
- `Data/scripts` — Lua gameplay content.
