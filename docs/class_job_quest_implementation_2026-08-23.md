# Class and job quest implementation notes

This is the implementation/decomp handoff for the first playable slice of the
1.0 class/job quest backlog.  It deliberately records what is authoritative,
what is only a client/decomp hint, and what is still missing so a future route
does not accidentally become a reward-only quest.

## Source order

The dated walkthrough index pages are the route authority:

- [eLeMeN Job Quest archive](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/JobQuest/index.html)
- [eLeMeN Class Quest archive](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/ClassQuest/index.html)

The checked-in reconciliation documents are easier to audit than the old live
HTML and should be read alongside the scripts:

- `docs/quest_availability_archive_audit_2026-08-13.md` — catalog and current
  implementation status.
- `docs/job_quest_prebattle_route_contract_2026-08-21.md` — the 42 job rows,
  pre-battle NPC routes, marker families, and AF/coffer backlog.
- `docs/quest_fight_implementation_backlog_2026-06-30.md` — fight surfaces,
  actor/mob gaps, and private-content ownership requirements.

The old pages name monsters and scenes, but usually do not publish this
server's numeric actor-class and mob-type identities.  Numeric bindings below
are therefore taken from the local SQL/dat-mining material and kept beside the
code that consumes them.

## Shared private-fight lifecycle

The promoted battle rows use one guarded adapter rather than wiring a normal
open-world `onKillBNpc` callback directly into quest completion:

1. The offer NPC accepts the quest and the template moves the owner to battle
   sequence `5` before creating content. That ordering prevents a kill during
   the asynchronous zone-in window from being credited to the wrong state.
2. The launcher validates the party leader, same-area combat-ready members,
   and the route's explicit total-party cap. It creates a private content area
   at the caller's current position, disables re-entry, and adds the owner,
   helpers, director, and target actors to one content group.
3. Each target is spawned by its exact actor-class ID, mob-type ID, and private
   unique ID. The director accepts only the active wave's actor-class callback
   while a quest owner is still at sequence `5`; unrelated ambient kills and
   helper-only quest state cannot advance the owner. Duplicate actor classes
   are counted independently, and later waves do not spawn until the current
   wave is complete.
4. On the final exact kill the director changes only the quest owner's state
   to sequence `10`, returns the group to the public area, despawns private
   targets, and tears down the content shell. The public reward NPC then runs
   the decompiled completion widgets and server-authoritative item/action/EXP
   grant.
5. Death, timeout, owner exit/disconnect, failed target spawn, or failed shell
   setup follows the same cleanup path and returns the owner to the retry
   boundary. No reward is granted on failure. Retail phase thresholds and
   field positions are intentionally not guessed when the local client/server
   evidence does not expose them; the documented mob profile remains the
   source of combat AI and skill cadence.

## What is playable now

### War0j1 — Pride and Duty (Will Take You from the Mountain) (enabled private adapter)

The Warrior 30 journal is unusually clear about the objective: Neale sends the
player to Curious Gorge's cave in Western Thanalan, and Curious Gorge asks the
player to defeat a group of Antling Workers north of the cave before returning
to him. The local event surface keeps that order:

```text
SEQ_ACCEPT
    Neale / processEventStart
        |
        v
SEQ_ROUTE = 0
    Curious Gorge / processEventCurious
        |
        v
SEQ_BATTLE = 5
    private content copy
      Antling Worker x4
      actor class 2203001 / display 3203001
      migration mob profile 32730 / skill list 3
      all four exact kills -> director marks success
        |
        v
SEQ_REWARD = 10
    Curious Gorge / processEventClear
    job item widget for Soul of the Warrior (`3020410`)
    Warrior ability widget for `27186`
    CompleteQuest / server-authoritative reward grant
```

Actor class `2203001` is the TermiteStandard model and display `3203001` is
the Antling Worker name in the local DAT data. Guildleve data and skill-list
data tie the family to ant-crawler actions: Trap Jaws (`23226`), Stridulation
(`23227`), and Formic Pheromones (`23229`/`23560`). The old client director is
an empty `SimpleQuestBattleBaseClass`, so it provides no reliable target count,
wave transition, enrage, or special phase callback.

There is no public Western Thanalan spawn/profile for this actor class in the
server SQL. The adapter therefore creates a private content copy with four
level-30 migration-owned Antling Worker profiles (`32730`) and requires every
copy to die. Four copies are an explicit tuning choice for the journal's
“group”, not a claim about the retail count. The private boundary also means
ambient Antling kills cannot complete the quest; death, timeout, partial kills,
failed setup, and leaving the area return the owner to the retry route.

### War0j2 — Embracing the Beast (enabled private adapter)

Curious Gorge's Warrior 35 journal names Sirocco west of Humblehearth in the
Central Shroud. The local public profile resolves the exact target, while the
source position remains unavailable to the server:

```text
SEQ_ACCEPT
    Curious Gorge / processEventCURIOUS_GORGEStart
        |
        v
SEQ_BATTLE = 5
    private content copy
      Sirocco: actor class 2100309 / display 3100311
      public mob type 3097 / skill list 4
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Curious Gorge return gate
    Warrior ability widget for `27187`
    linkshell event 1600318/75 / CompleteQuest
```

Sirocco's mob profile retains Stampede (`23078`), Hoofkick (`23079`), a
second Stampede entry (`23166`), and Swift Gale (`23196`). The private director
owns one exact actor-class/mob pair while quest `111202` is at sequence `5`,
caps the adapter at three party members, and returns the owner to Curious Gorge
on ambient mismatch, death, timeout, failed setup, or boundary exit. The
archive's “highly agile” description is documented, but no invented phase or
special dodge callback is wired. Marker `11220101` remains the Humblehearth
destination hint.

### Gla200 — All Bark and No Bite

The route is now:

```text
SEQ_ACCEPT
    Lulutsu / processEventLulutsuStart
        |
        v
SEQ_BATTLE = 10
    processEvent010 / gla20010 entry scene
    private content copy
      spawn: actor class 2289006 / mob type 3034
      unique id: gla200_ala_mhigan_challenger
      exact kill -> director marks success
        |
        v
SEQ_POST = 20
    Lulutsu / processEvent020 / gla20020 post-fight scene
        |
        v
SEQ_RETURN = 30
    Lulutsu / processEvent030 / CompleteQuest
```

The archive describes the short Coliseum-style challenger fight.  The server
does not place this BNPC into the public map: the content area spawns exactly
one `ala_mhigan_challenger`, and `gc_sqb_runtime.lua` accepts only actor class
`2289006` while the owner's quest is at sequence `10`.  A helper party member
can help with the fight, but cannot advance a different quest or grant the
owner's reward.

The DAT journal points at the Coliseum destination (`11008001`, the same X/Z
as Man0u1's Coliseum trigger) during the fight; Lulutsu (`11008002`) stays
the inviter.  The recovered pre-fight (`gla20010`) and post-fight
(`gla20020`) cutscenes both play now; neither returns a result value, so no
result gate applies.  Marker rows `11008003`–`11008020` are filler.

Central SQL supplies the 20,000 gil and 2,000 gladiator guild marks.  The
script supplies the Iron Shortsword (`4030203`) and the local source-backed
1,760 EXP because the current central reward row has no EXP entry for `110080`.

### Gla300 — Unalienable Rights (enabled)

The recovered journal and client event surface are now represented as separate
route states instead of a direct reward scaffold:

```text
SEQ_ACCEPT
    Lulutsu / processEventLulutsuStart
        |
        v
SEQ_ROUTE 1
    Miounne marker at Carline Canopy / processEvent020
        |
        v
SEQ_ROUTE 2
    Willelda / processEvent025 (ask 164, decline does not advance)
    processEvent030 pre-fight scene
        |
        v
SEQ_BATTLE = 10
    private content copy
      spawn: actor class 2289009 / mob type 3062
      unique id: gla300_j_moldva
      exact kill -> director marks success
        |
        v
SEQ_POST = 20..25
    J'moldva Echo -> linkpearl handoff -> Lulutsu report
    Yoyobina Echo scenes -> Lulutsu
        |
        v
SEQ_RETURN = 30
    Lulutsu / processEvent090 / CompleteQuest
```

The recovered actor/mob binding is explicit: actor class `2289009` is the kill
callback identity and mob type `3062` is the level-30 combat profile.  The
shared director rejects unrelated kills, requires the exact owner sequence,
supports the existing small party shell, and returns on clear/death/timeout/
zone exit through the configured retry path.  The post-fight route keeps the
Echo and linkpearl cutscene handoff visible in quest state, while central SQL
supplies the 30,000 gil and 3,000 gladiator guild marks and the script presents
the recovered 3,420 EXP.

The client marker rows provide Yoyobina's actor model and X/Z position but not
public height/facing.  `gla300_yoyobina` is therefore installed as an explicit
SQL placement scaffold; adjust only its Y/rotation after a live map check.

### Gla306 — Thrill of the Fight (enabled safe slice)

The decomp shows two different Coliseum matches. The player fights the Ala
Mhigan challenger, then watches a following match in which the bladedancer
reveals his strength. Treating both SQL rows as simultaneous kills would
complete the wrong story, so the private duty owns only the player's exact
challenger kill:

```text
SEQ_ACCEPT
    Lulutsu / processEventLulutsuStart
        |
        v
SEQ_ROUTE 1..2
    Yoyobina / processEvent003
    Yoyobina / processEvent005 (ready ask; decline stays here)
        |
        v
SEQ_BATTLE = 10
    processEvent010 (gla30610 lead-in)
    private content copy
      spawn: actor class 2289007 / mob type 3035
      unique id: gla306_ala_mhigan_challenger
      exact kill -> director marks success
        |
        v
SEQ_POST = 20
    Lulutsu / processEvent055 report and reward dialogue
        |
        v
SEQ_RETURN = 30
    Lulutsu / CompleteQuest
```

The second local breadcrumb pair, actor class `2289010` / mob type `3033`
(`ala_mhigan_bladedancer`), remains documented but is not spawned as a kill
target. The later Coliseum observation, refugee dialogue, and associated
scene-owner handoffs still need a dedicated content director. This gives the
quest a real retryable player fight without silently turning an observed match
into a second kill objective.

The unbound remainder is inventoried in the template (`documentedUnboundChain`)
for that owner: cutscenes `020`/`020_999`/`030`/`040`/`050`, talks `023`/`025`,
and the two Echo gates `024`/`045` (ask `51030`, entering the past area
client-side), across markers `11008203`–`11008207` (Yoyobina's second spot,
two challenger-family `4000191` displays whose public shell `1000601` has no
talk conditions or spawn, and the guild waypoint `11008206`, which matches
the pre-existing guild trigger row exactly). The recovered
`QuestObjectGla306` only disables ground snapping and exposes no server
callback. Marker rows `11008210`–`11008220` are filler.

### Pgl300 — Here There Be Pirates (enabled)

The recovered journal describes an investigation rather than a simple arena
clear. The implemented server boundary is:

```text
SEQ_ACCEPT
    Gagaruna / processEventGagarunaStart
        |
        v
SEQ_ROUTE 1
    Waekbyrt at the Astalicia marker / processEvent020
        |
        v
SEQ_ROUTE 2
    Mytesyn/Mizzenmast handoff / processEvent025
    marker 11006103 retains the recovered ship-object destination
    processEvent030 pre-fight scene
        |
        v
SEQ_BATTLE = 10
    private content copy
      spawn: actor class 2280217 / mob type 3066
      unique id: pgl300_kraken_deckhand
      exact kill -> director marks success
        |
        v
SEQ_POST = 20..24
    Titinin report -> Hurrey/Melisie/Halstein Echo checks
        |
        v
SEQ_RETURN = 30
    Gagaruna / processEvent090 / CompleteQuest
```

The client director class is an empty shell, so the route uses the local
fight inventory's exact level-25 Kraken Deckhand binding and keeps the battle
content-owned. The director rejects unrelated kills, enforces the owner at
sequence `10`, supports the normal small helper party, and returns on clear,
death, timeout, or boundary exit. The journal's counterfeit-chip/mold drop is
represented by the private target kill; no ambient pirate can advance the
quest.

The marker model for Hurrey (`2200172`) resolves to event actor class
`1000603`, but the local public spawn table had no row. `pgl300_hurrey` and
the matching migration therefore preserve the marker X/Z while flagging Y and
rotation for a live-map correction. The decompiled `QuestObjectPgl300` has no
server callback, so the ship-object marker is retained beside the guarded
Mytesyn handoff rather than being silently discarded.

### Pgl306 — Two Sides to Every Chip (enabled)

The recovered journal makes this a second counterfeit-debt investigation, but
the fight itself is a distinct Silver Bazaar encounter. The implemented
boundary is:

```text
SEQ_ACCEPT
    Gagaruna / processEventGagarunaStart
        |
        v
SEQ_ROUTE 1
    Hurrey + Lewena's handmaiden / processEvent020
        |
        v
SEQ_ROUTE 2
    Lewena's handmaiden / processEvent030
      worldMaster:ask(51030, 2); result 0 keeps the step active
        |
        v
SEQ_ROUTE 3
    Silver Bazaar plateau / processEvent040
      generic 4000257 push trigger; result 0 keeps the step active
        |
        v
SEQ_BATTLE = 10
    private content copy
      spawn: actor class 2289014 / mob type 3079
      unique id: pgl306_ossuary_almstaker
      exact kill -> director marks success
        |
        v
SEQ_POST = 20..23
    Titinin / processEvent050 + processEvent060
    Gagaruna / processEvent070 + processEvent080
        |
        v
SEQ_RETURN = 30
    Gagaruna / processEvent090 / CompleteQuest
```

The route follows the archive's named beats: Hurrey and the handmaiden are
concerned at the Platinum Mirage; the Echo points to a plateau near the Silver
Bazaar; Lady Lewena is found there with pugilists fighting an Arrzaneth
Ossuary thaumaturge; after the victory, she pays the defeated thaumaturge and
asks for a loan extension before the player reports to Titinin and Gagaruna.
The client event surface is preserved in order: `processEvent020`, the two
`worldMaster:ask(51030, 2)` gates (`030` and `040`), then `050` through `080`
and the final `090` client-talk reward scene. The decomp also contains
after-warp twins `030_2`/`040_2` (identical asks and scenes, AfterWarp
fades); the retail rule for choosing base vs `_2` is unrecovered, and a
`_2` variant without the matching server-side warp would desync the
client, so only the default-fade base events are bound.

The exact server fight binding is actor class `2289014`, mob type `3079`,
level 36, `Ossuary Almstaker`. It is content-owned for the same reason as the
other class fights: an ambient Almstaker kill cannot complete the quest, and
the director only credits the exact actor class while the owner's quest is at
sequence `10`. The handmaiden marker resolves exactly to actor class
`1001013`. The Silver Bazaar marker is the generic display `4000257` and
does not publish a unique retail actor class, so candidate actor `1000174`
and its Y/rotation are intentionally called out as a live-placement scaffold
in the SQL migration rather than presented as decomp certainty.

### Pld0j1 — Paladin's Pledge (enabled private adapter)

The Paladin 30 journal provides a complete public story boundary: Lulutsu
offers the quest, Jenlyns sends the player south of the Coffer & Coffin in
Western Thanalan to clear undead, and Jenlyns receives the player after the
fight. The DAT contains four quest-specific resource shells. The client
quest-battle director is empty, so the server makes the recovered resource
roster and its conservative completion rule explicit:

```text
SEQ_ACCEPT
    Lulutsu / processEventLULUTSUStart
        |
        v
SEQ_ROUTE = 0
    Jenlyns / processEvent082
        |
        v
SEQ_BATTLE = 5
    processEvent010 lead-in
    private content copy
      Wandering Soldier: actor 2201807 / mob 32731
      Wandering Mage:    actor 2201808 / mob 32732
      Wandering Bogy:    actor 2204318 / mob 32733
      Specter fallback:  actor 2206901 / mob 32734
      all four exact kills -> director marks success
        |
        v
SEQ_REWARD = 10
    Jenlyns / processEvent020 + processEventKokuti
    Soul of the Paladin widget (`3020410`)
    CompleteQuest / server-authoritative key item, action, item, and EXP
```

The combat behavior comes from inherited local family profiles rather than a
new guessed rotation. The Wandering Soldier uses Lancer skill list `88`
(True Thrust `27269`, Heavy Thrust `27273`, Impulse Drive `27275`, and Feint
`27278`). The Wandering Mage uses Wight skill list `5061` (Magicked Skull
`23245`, Shadow Sickle `23246`, Minions of the Pit `23247`, and Soul Eater
`23346`). The Wandering Bogy and generic SpecterStandard fallback use ghost
skill list `32` (Forbidden Magicks `23125`, Dark Cloud `23127`, Curse
`23128`, Grave Reel `23129`, and Gate to Oblivion `23130`). These are the
server's recovered AI families; the empty client director does not expose a
retail phase threshold, wave callback, or special victory condition.

Three actor classes are exact client-specific resources. The fourth client
file, `SpecterNormalPld0j1`, is only an empty `SpecterBaseClass` subclass and
has no matching actor-class SQL row, so actor class `2206901` (`SpecterStandard`)
is used as a labeled adapter fallback. One copy of each resource, the private
mob IDs `32731`–`32734`, and the square formation are adapter policy, not a
claim about a recovered retail count or placement. The director requires all
four exact private targets, rejects ambient undead kills, permits the journal's
three helpers (four total), and returns the owner to Jenlyns on death, timeout,
failed setup, or content-boundary exit.

### Pld0j2 — Honor Lost (enabled private adapter)

Jenlyns' Paladin 35 objective names Alux in the Mun-Tuy Cellars. The local
actor/display/mob rows resolve the target exactly, but the public profile only
has a source-location note, so the implementation uses a private copy after
the recovered Jenlyns offer scene:

```text
SEQ_ACCEPT
    Jenlyns / processEventJENLYNSStart
        |
        v
SEQ_BATTLE = 5
    private content copy
      Alux: actor class 2102609 / display 3102611
      public mob type 3000 / skill list 42
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Jenlyns return gate
    job ability widget for `27147`
    linkshell event 1000146/95 / CompleteQuest
```

The Imp-family profile supplies Impish Incantations (`23116`, `23117`, and
`23118`); the eLeMeN NM list also records Stardust (`23119`), but no phase or
capture callback is asserted because the empty/public content owner does not
provide one. The private director owns one exact Alux while quest `111282` is
at sequence `5`, caps the adapter at three party members, and returns the
owner to Jenlyns on an ambient-kill mismatch, death, timeout, setup failure,
or boundary exit. Marker `11224101` remains the Mun-Tuy destination hint.

### Pld0j3 — Power Struggles (enabled private adapter)

The Paladin 40 follow-up repeats Jenlyns' offer boundary and names Old
Six-arms, the crab king of Lower La Noscea. Local SQL resolves actor class
`2107614`, display `3107616`, public mob type `3078`, and skill list `21`:

```text
SEQ_ACCEPT
    Jenlyns / processEventJENLYNSStart
        |
        v
SEQ_BATTLE = 5
    private content copy
      Old Six-arms: actor class 2107614 / display 3107616
      public mob type 3078 / skill list 21
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Jenlyns return gate
    job ability widget for `27149`
    linkshell event 1000146/96 / CompleteQuest
```

Skill list 21 retains Brine Blast (`23060`), Rage of the Deep (`23061`),
Feeding Frenzy (`23062`), Deep Scratch (`23075`), Claw Guard (`23133`),
Bubble Shower (`23134`), and Backclip (`23135`). The private director owns
one exact target while quest `111283` is at sequence `5`; it uses the shared
three-member adapter cap and guarded cleanup, not a guessed crab phase or
public Lower La Noscea trigger. Marker `11224201` is retained as the journal
destination hint.

### Pld0j5 — Parley on High Ground (enabled)

This is the first job-quest slice promoted from the preparation inventory. The
client scenario is unusually clear about the boundary: Jenlyns explains that
the secret parley will happen on high ground northeast of Ul'dah, the player
travels separately, and the fight is the event monster recorded locally as
Jenlyns Straightblade. The server keeps the public marker and the private
combat owner separate:

```text
SEQ_ACCEPT
    Jenlyns / processEventJENLYNSStart
        |
        v
SEQ_BATTLE = 5
    processEvent_005NQ_1 (pld0j510 pre-scene)
    private content copy
      spawn: actor class 2289035 / mob type 3064
      unique id: pld0j5_jenlyns_straightblade
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    processEvent_015NQ_2 (pld0j520 aftermath)
    Jenlyns / processEventClear / CompleteQuest
```

The scene hooks are not cosmetic: `processEvent_005NQ_1` owns the pre-battle
fade and `pld0j510` cutscene, while `processEvent_015NQ_2` owns the returned
`pld0j520` aftermath. The private director accepts only actor class `2289035`
while quest `111285` is at sequence `5`; a stray public kill cannot grant the
quest. Death, timeout, failed entry, or leaving the private boundary returns
the owner to Jenlyns for retry. The DAT marker `11224401` remains the journal's
Central Thanalan high-ground destination, even though the current generic
content shell safely materializes the private copy from the caller's public
position until a live high-ground content transform is captured.

### Blm0j2 — A Time to Kill (enabled private adapter)

The Black Mage 35 objective is an open-world NM hunt in the archive: Lalai
names Daddy Longlegs west of Nophica's Wells. The local client/SQL surface is
strong enough to bind the exact monster, but it does not expose a server-owned
field transform or an ordered pre-battle NPC route. The implementation therefore
keeps Lalai's recovered offer hook and starts the guarded private fight directly
after acceptance:

```text
SEQ_ACCEPT
    Lalai / processEventLALAIStart
        |
        v
SEQ_BATTLE = 5
    private content copy at the adapter's safe start position
      Daddy Longlegs: actor class 2105513 / display 3105515
      public mob type 3013 / skill list 71
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Lalai return gate
    legacy linkshell presentation (actor 1400197 / event 78)
    action widget for `27319` / CompleteQuest
```

Daddy Longlegs uses the exact local `HarvestmanNM` actor binding and public
mob profile: Corrosive Spit (`23139`), Brain Spike (`23140`), and the second
Corrosive Spit entry (`23348`). The profile is level 42 and belongs to the
Yarzon family; the private director spawns one exact copy, caps the adapter at
three party members, and credits only that copy while quest `111262` is at
battle sequence `5`. A stray public harvestman kill, partial/failed setup,
death, timeout, or boundary exit cannot award the quest. No phase threshold or
ordered `processEvent000_*` route is invented: those decompiled methods are
reminder variants for Lalai, Kazagg Chah, Dozol Meloc, and Da Za.

The journal marker `11223101` remains the Western Thanalan destination hint.
The adapter deliberately preserves the source-backed monster identity and
completion widgets while leaving the retail field trigger, placement, and NM
balance as live-verification follow-ups.

### Blm0j3 — International Relations (enabled)

The Black Mage scenario separates Lalai's prophecy from Kazagg's trial.  The
recovered route and fight wave are:

```text
SEQ_ACCEPT
    Lalai / processEventLALAIStart
        |
        v
SEQ_ROUTE = 0
    Kazagg Chah / processEvent000
        |
        v
SEQ_BATTLE = 5
    processEvent005 fade/scene handoff
    private content copy
      spawn: actor class 2200406 / mob type 3089 (Ragged Hippocerf) x2
      spawn: actor class 2200407 / mob type 3114 (Whitetalon)
      all three exact kills -> director marks success
        |
        v
SEQ_REWARD = 10
    Kazagg / processEvent010 aftermath
    processEventClear / Flare presentation / CompleteQuest
```

The two Ragged Hippocerfs intentionally share actor class `2200406` and mob
type `3089`, but use separate private IDs.  The local mob source note records
Whitetalon (`2200407/3114`) as appearing after the two Ragged Hippocerfs, so
`gc_sqb_runtime.lua` counts repeated actor-class callbacks up to the number of
configured private copies.  An ambient Griffin/monster kill, a partial wave,
death, timeout, failed entry, or leaving the private boundary cannot complete
quest `111263`.

The DAT markers remain journal evidence for the Western Thanalan Kazagg route
(`11223201`) and Western La Noscea trial (`11223202`).  As with Pld0j5, the
generic private shell currently starts from the caller's safe public position;
the source-backed marker and event order are preserved while a live transform
to the retail trial location remains a placement follow-up.

### Mnk0j2 — Insulted Intelligence (enabled private adapter + item objective)

The Monk 35 scenario is not a kill-only quest. Erik supplies the Brand-new
Aetheriometer (`11000552`), the journal sends the player south of Cedarwood in
Lower La Noscea, and the player must defeat Gluttonous Gertrude before using
the instrument. The local actor/mob/skill data is exact:

```text
SEQ_ACCEPT
    Erik / processEventERIKStart
      grant Brand-new Aetheriometer (item 11000552)
        |
        v
SEQ_BATTLE = 5
    private content copy
      Gluttonous Gertrude: actor class 2102010 / display 3102012
      public mob type 3043 / skill list 6014
      exact kill -> director returns owner to sequence 6
        |
        v
SEQ_MEASURE = 6
    use the exact Brand-new Aetheriometer item
      item registry consumes it and advances to sequence 10
        |
        v
SEQ_REWARD = 10
    Erik completion boundary
    item/ability/linkshell widgets: 11000552, 27107, actor 1000101/event 92
    CompleteQuest / server-authoritative rewards
```

Skill list 6014 retains Regurgitate (`23013`, `23020`), Rancid Belch
(`23014`–`23016`), and Fowl Stench (`23017`–`23019`). The private director
credits only actor class `2102010` while quest `111222` is at sequence `5`;
the shared four-person total cap (player plus up to three party members),
death/timeout/owner-exit cleanup, and exact
target gate apply. The item-use registry accepts item `11000552` only at
sequence `6`, consumes the exact inventory slot, and exposes Erik for the
recovered completion hooks. A stale instrument or an ambient Gertrude kill
cannot complete the quest. The Cedarwood marker (`11221101`) remains the
source-backed destination hint; retail field placement and any hidden timing
phase remain verification follow-ups.

### Mnk0j6 — Return of the King...of Ruin (enabled private adapter)

The Monk 50 scenario gives us both the narrative handoff and the aftermath
sequence, but not a server-owned Silvertear Falls placement. The recovered
event surface is:

```text
SEQ_ACCEPT
    Erik / processEventERIKStart
      journal text: hasten to Silvertear Falls and stop Widargelt
        |
        v
SEQ_BATTLE = 5
    processEvent005 -> mnk0j610 lead-in (default-fade branch)
    private content copy at the adapter's safe start position
      Widargelt the Watcher: actor 2289039 / mob 3115 / level 55
      Ala Mhigan pikeman:    actor 2289040 / mob 3036 / level 53
      Ala Mhigan axeman:     actor 2289041 / mob 3032 / level 53
      Ala Mhigan shaman:     actor 2289043 / mob 3037 / level 53
      all four exact kills -> director marks success
        |
        v
SEQ_REWARD = 10
    processEvent015 -> mnk0j620 aftermath scene
    processEvent020 -> fifth-piece/item widget (`8032702`)
    processEventClear -> Hundred Fists (`27106`) presentation
    CompleteQuest / server-authoritative item and action grant
```

The decompiled follow-up methods are retained in the contract even though the
current adapter does not pretend to own their retail NPC route:
`processEvent000_ERIK_Follow` tells the player to hurry to Silvertear Falls,
and `processEvent000_WIDARGELT_Follow` has Widargelt agree to meet there.
`processEvent005` starts `mnk0j610` and has separate default/after-warp fade
branches; `processEvent015` starts `mnk0j620` after the warp. `processEvent020`
explains that Widargelt is pursuing revenge and power for Ala Mhigo, then
calls the item widget with its fourth argument. The template passes item
`8032702` only for that client presentation; the server's normal reward grant
remains authoritative and is not delegated to the cutscene.

The dated 1.0 quest account describes Widargelt opening the seventh chakra,
losing control of the power, and being surrounded by Ala Mhigan soldiers. The
local SQL is unusually useful here: it gives the exact four target bindings,
their quest provenance, levels, and action families. Widargelt, the pikeman,
and the axeman use skill list `15` (`animal_instinct`, `godsbane`, `jump`, and
`wyvern_dive`); the shaman uses skill list `14` (`sonorous_blast`,
`terrene_blast`, `remembrance`, `chthonic_call`, and the local aerial-blast
family). These are the server's recovered AI profiles, not a claim that every
listed action is a unique Widargelt phase. No callback in the empty client
director supplies a reliable chakra threshold, add-wave transition, or status
duration, so the adapter requires all four exact targets and does not invent
one.

The public marker pair `11221501`/`11221502` is in Mor Dhona and the second
marker carries Widargelt's display model, but the only active public Widargelt
spawn in the local server data is his earlier Eastern Thanalan placement. It
would be incorrect to bind that actor to this quest and send the player to the
wrong zone. The promoted slice therefore starts from Erik, plays the recovered
lead-in, creates a private copy, and returns the owner to Erik for the
recovered aftermath/reward hooks. Its three-person cap is adapter policy; the
historical quest notes describe a much larger helper group. Death, timeout,
failed setup, boundary exit, partial kills, and ambient kills cannot grant the
quest.

### Whm0j2 — When Sheep Attack (enabled private open-world adapter)

Raya-O-Senna sends the White Mage 35 player southwest of Camp Glory to
subdue the lone feral sheep Downy Dunstan. The journal recommends three
companions, and the local enrichment data resolves the exact actor/profile:

```text
SEQ_ACCEPT
    Raya-O-Senna 1001570 / processEventRAYAOSENNAStart
      whm0j210 offer scene
        |
        v
SEQ_BATTLE = 5
    private content copy (party cap 4)
      Downy Dunstan: actor 2106017 / display 3106019
      mob profile 3019 / effective NM skill list 6010
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Raya-O-Senna / processEvent005
      public-information widget 52
      Regen action widget 27358
      CompleteQuest / server-authoritative reward grant
```

Skill list `6010` contains Lullaby (`23239`). The director leaves that action
to Dunstan's mob AI and does not invent a sleep threshold or sheep adds. Marker
`11222101` supplies the Camp Glory destination (`X=1201.08`, `Z=1124.74`),
while the source profile does not include a public unique spawn. The private
shell requires actor `2106017` in this owner's content group at sequence `5`,
so ordinary sheep cannot advance quest `111242`. Failure returns to sequence
`0`; marker `11222102` is the recovered Raya-O-Senna reward destination. Her
actor is present in the client route but lacks a normal public server spawn,
so acceptance/return reachability remains a live smoke-test requirement.

### Whm0j3 — Lost in Rage (enabled private open-world adapter)

White Mage 40 repeats the four-person contract for Cactuar Jack east of Camp
Horizon. Unlike Dunstan, the server already has both the exact combat profile
and an ambient NM spawn; the quest deliberately uses a different private
unique ID:

```text
SEQ_ACCEPT
    Raya-O-Senna 1001570 / processEventRAYAOSENNAStart
        |
        v
SEQ_BATTLE = 5
    private content copy (party cap 4)
      Cactuar Jack: actor 2100910 / display 3100913
      mob profile 3009 / effective NM skill list 6006
      exact private kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Raya-O-Senna / processEvent005
      public-information widget 31
      Esuna action widget 27357
      CompleteQuest / server-authoritative reward grant
```

Cactuar Jack retains 1000 Needles (`23147`), Tender Thrust (`23148`), Sun
Spines (`23149`), and 100 Needles (`23413`). Marker `11222201` points to
western Thanalan (`X=-881.29`, `Z=2.4`); the public evidence spawn is
`nm_cactuar_jack_172_1` in zone `172`. That public NM is never accepted as a
quest callback: only private unique `whm0j3_cactuar_jack` inside the guarded
content area advances `111243`. Death, timeout, failed setup, partial cleanup,
or leaving the boundary grants no reward and restores the retry state.

### Brd0j2 — The Archer's Anthem (enabled private open-world adapter)

Jehantel's Bard 35 journal sends the player to Nanawa Mines to face Bardi, a
single old jackal, and recommends three companions (four total participants).
The local actor, public-NM, and skill tables resolve this as an exact profile,
not a level-scaled wolf substitute:

```text
SEQ_ACCEPT
    Jehantel / processEventJEHANTELStart
        |
        v
SEQ_BATTLE = 5
    private content copy (party cap 4)
      Bardi: actor class 2101413 / display 3101415
      public mob type 3003 / skill list 6002
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Jehantel completion hooks
      public-information widget 51122 / display 3101415
      Bard action widget 27239
      linkshell actor 1200133 / event 82
      CompleteQuest / server-authoritative reward grant
```

Skill list `6002` gives Bardi Midnight Howl (`23142`), Threatening Growl
(`23143`), Foul Bite (`23144`), and Sanguine Bite (`23145`). Those actions are
left to mob-profile AI; the quest script does not invent an HP phase or special
howl threshold absent from the recovered director. Marker `11225101` points to
Nanawa Mines (`X=-160.92`, `Z=-1315.21`), and the server also contains a public
Bardi NM spawn in zone `176` (`nm_bardi_176_1`). The guarded private copy is
intentional: only Bardi actor `2101413` killed inside this owner's active
content group at sequence `5` advances quest `111302`; an ambient NM kill does
not. Death, timeout, setup failure, or leaving the boundary returns to
Jehantel's retry state without reward.

### Brd0j3 — Bard's-Eye View (enabled private open-world adapter)

The Bard 40 journal repeats the same clean contract for Phaia in the Central
Shroud and again recommends four total participants. Phaia is a distinct boar
NM with its own exact actor/profile pair:

```text
SEQ_ACCEPT
    Jehantel / processEventJEHANTELStart
        |
        v
SEQ_BATTLE = 5
    private content copy (party cap 4)
      Phaia: actor class 2101509 / display 3101511
      public mob type 3080 / skill list 6025
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Jehantel completion hooks
      public-information widget 51138 / display 3101511
      Bard action widget 27238
      linkshell actor 1200133 / event 83
      CompleteQuest / server-authoritative reward grant
```

Phaia's recovered combat list contains Reckless Charge (`23155`), Bristle
(`23156`), and Bellowing Grunt (`23157`). Marker `11225201` supplies the
Central Shroud destination (`X=-186.18`, `Z=-337.32`), but the current SQL does
not materialize the original public spawn/content owner. The adapter therefore
uses mob type `3080` inside the same exact owner/sequence/content checks as
Bardi. It requires the one configured Phaia kill, rejects ordinary boars and
ambient callbacks, and preserves the same death/timeout/exit retry lifecycle.

### Drg0j2 — Lance of Fury (enabled private open-world adapter)

The Dragoon 35 scenario gives a clean public objective and a complete reward
handoff. `processEventALBERICStart` presents the Azure Dragoon history and
calls `showQuestInfomation`; the post-accept `processEvent000_ALBERICS` tells
the player to go to Cassiopeia Hollow near Camp Bloodshore in eastern La
Noscea and subdue Bomb Baron. On success, the decomp methods present the Soul
of the Dragoon context (`51126`, `2000204`), action `27272` at tier 3, and
linkshell actor `1000275`, event `85`.

```text
SEQ_ACCEPT
    Alberic / processEventALBERICStart
        |
        v
SEQ_ROUTE = 0
    Alberic / processEvent000_ALBERICS
      instruction: Cassiopeia Hollow, east of Camp Bloodshore
        |
        v
SEQ_BATTLE = 5
    private content copy
      Bomb Baron: actor class 2101610 / mob type 3007
      DAT display/name: 3101612 / bomb baron
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Alberic / completion presentation hooks
      Soul context -> action 27272 -> linkshell actor 1000275/event 85
      CompleteQuest / 3,360 EXP
```

The actor archive identifies the model as
`/Chara/Npc/Monster/Bomb/BombLesserNM`, and the public mob table identifies
profile `3007` at level 42 with fire element and skill list `12`. That list is
the recovered fight behavior: Fireball (`23032`), Self-destruct (`23033`),
Combustion (`23034`), Fast Burn (`23036`), Burning Cyclone (`23274`),
Firecracker Shower (`23315`), Hellfire (`23368`, `23408`, `23409`), Firedamp
(`23396`), Fire II (`23508`), Burn II (`23509`), and the additional
Self-destruct entry (`23628`). The server preserves this profile's AI cadence;
the client director does not expose a reliable threshold callback, so the
adapter does not invent a timer for Self-destruct or a guessed phase change.

This is a guarded private adapter for the retail open-world objective. The
public profile records only a source location, so the director creates one
private `drg0j2_bomb_baron` copy from the caller's safe position, accepts only
its actor-class kill while quest `111322` is at sequence `5`, and returns up to
three same-area helpers with the owner. A public Bomb Baron kill, partial
fight, death, timeout, failed setup, or area exit cannot grant the quest. The
DAT marker `11226101` remains the Cassiopeia Hollow location evidence; exact
retail placement, trigger ownership, and encounter balance remain live
verification work.

### Drg0j3 — Unfading Scars (enabled private open-world adapter)

The Dragoon 40 scenario is a compact but complete source contract. Alberic's
`processEventALBERICStart` method presents the quest and calls
`showQuestInfomation`; after acceptance, `processEvent000_ALBERICS` is the
second Alberic handoff that tells the player about the young dragoon slain
near Millers' Glade and names Spitfire. The three completion methods are
explicit: `onJobQuestCompleteFirst` presents the recovered Soul of the
Dragoon/key-item context (`51126`, `2000204`), `onJobQuestCompleteSecond`
shows action `27267`, and `onJobQuestCompleteThird` runs the linkshell event
for actor `1000275`, event `86`.

```text
SEQ_ACCEPT
    Alberic / processEventALBERICStart
        |
        v
SEQ_ROUTE = 0
    Alberic / processEvent000_ALBERICS
      instruction: go to Millers' Glade in eastern Coerthas
        |
        v
SEQ_BATTLE = 5
    private content copy
      Spitfire: actor class 2106207 / mob type 3101
      DAT display/name: 3106209 / Spitfire
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Alberic / completion presentation hooks
      Soul context -> action 27267 -> linkshell actor 1000275/event 86
      CompleteQuest / 4,260 EXP
```

This is a private adapter for an open-world objective, not a claim that the
retail field trigger has been recreated. The local actor archive binds
`2106207` to `/Chara/Npc/Monster/Sprite/SpriteBrownLesserNM` and display
`3106209`; the public mob table binds that actor to mob type `3101`, level
47, and skill list `1`. Skill list `1` supplies the Spriggan family rotation:
Frenetic Flurry (`23122`), Romp (`23123`), and Triple Tumble (`23124`). The
local eLeMeN-derived skill data also records list `6035` as Spitfire-specific
evidence for Frenetic Flurry. The adapter intentionally uses the existing
public profile rather than inventing a duplicate stat block, HP phase, or
damage rotation.

The journal recommends four total participants, so the director permits the
quest owner plus up to three same-area helpers. The private target uses the
unique ID `drg0j3_spitfire`; only its actor-class callback counts, and only
while quest `111323` is at battle sequence `5`. A public/ambient Spitfire,
partial kill, death, timeout, failed content setup, or private-area exit
cannot grant the quest. The DAT marker `11226201` remains the source-backed
Eastern Coerthas location hint; the shared shell currently starts from the
caller's safe position because the public source position/content owner is
not present in the local server data.

### Drg0j5 — Fatal Seduction (enabled private adapter)

The Dragoon 45 decomp gives us a complete Alberic briefing and a much clearer
objective than the generated quest row. `processEventALBERICStart` presents
the Azure Dragoon challenge and calls `showQuestInfomation`; the repeated
`processEvent000_ALBERICS` scene tells the player to travel south from Camp
Riversmeet and slay Stollenwurm. The completion callbacks are also explicit:
the first presents the recovered Soul of the Dragoon context, the second
presents battle command `27277` (Ring of Talons) at tier 3, and the third runs
the final linkshell presentation for actor `1000275`, event `88`.

```text
SEQ_ACCEPT
    Alberic / processEventALBERICStart
        |
        v
SEQ_ROUTE = 0
    Alberic / processEvent000_ALBERICS
      instruction: Camp Riversmeet -> south to the two-river confluence
        |
        v
SEQ_BATTLE = 5
    private content copy
      spawn: actor class 2102219 / mob type 32729
      display/name: Stollenwurm (DAT display 3102224)
      unique id: drg0j5_stollenwurm
      exact kill -> director marks success
        |
        v
SEQ_REWARD = 10
    Alberic / decomp completion hooks
      Soul context -> Ring of Talons presentation -> linkshell scene
      CompleteQuest / 5,340 EXP
```

Actor class `2102219`, display ID `3102224`, the Stollenwurm name, and its
quest-specific model path are local source-backed identities. The model path
has a `ScalelizardThunderQuestDrg0j6` suffix even though the recovered text
clearly belongs to Drg0j5; that naming mismatch is recorded rather than
silently renaming the actor resource. No server mob-type row or authoritative
public spawn owner was found, so migration-owned mob type `32729` is an
explicit private adapter profile: Drake skill family `5020`, inferred Lancer
job `8`, and a level-45 tuning band. It is not claimed to be the retail BNPC
number or exact retail stat block.

The retail route is classified as an open-world fight and old guide material
recommends an eight-person party. The current server slice intentionally
materializes one exact Stollenwurm in the shared private quest shell, caps
the adapter at three party members like the other promoted slices, and returns
the owner to Alberic on death, timeout, failed setup, or boundary exit. This
keeps ambient kills from granting the reward while the original western-
Coerthas field trigger and balance are still being recovered. The journal
marker `11226401` remains the DAT location hint; the server uses the guarded
second Alberic interaction as the temporary handoff because the retail field
push actor is not known.

### Drg0j6 — Into the Dragon's Maw (enabled private adapter)

The final Dragoon quest has a richer combat description than its empty client
director suggests. The recovered scenario calls `processEventALBERICStart`
for the offer, `processEvent000` for Alberic's Griffin Bridge instruction,
`processEvent010` for the `Drg0j610` lead-in, and `processEvent020`/`025` for
the two `Drg0j620` after-battle fade branches. `processEvent030` is the reward
presentation: it shows Dragonfire Dive (`27268`), Drachen Mail (`8032704`),
and the final Alberic dialogue. The local client director
`QuestDirectorDrg0j601` is only an empty `SimpleQuestBattleBaseClass` shell,
so its absence is not evidence that the encounter has no targets.

The local mob source supplies the two opponent bindings used by the adapter:

```text
SEQ_ACCEPT
    Alberic / processEventALBERICStart
        |
        v
SEQ_ROUTE = 0
    Alberic / processEvent000
    instruction: Griffin Bridge, southeast of Alberic
        |
        v
SEQ_BATTLE = 5
    private content copy
      Estinien Wyrmblood: actor 2289038 / mob 3028 / skill list 15
      Greywine:           actor 2202208 / mob 3049 / skill list 26
      exact kill of both targets -> director marks success
        |
        v
SEQ_REWARD = 10
    processEvent025 normal fade -> processEvent030 reward widgets
    CompleteQuest / Dragonfire Dive + Drachen Mail
```

The fight behavior is preserved as a source-backed contract rather than
invented phase logic. Period 1.0 documentation describes Greywine periodically
glowing purple; players must stop attacking and move away to avoid the
counterattack. Estinien counts down into a dragoon maneuver, uses the jump /
Wyvern Dive family, and his attacks can bind or stun. Mob skill list `15`
contains the recovered boss-physical jump and Wyvern Dive actions; list `26`
contains Greywine's drake actions including Ring of Thorns. The adapter lets
those profiles drive their normal AI cadence. The original status-effect timing
and purple presentation callback are not recoverable from the empty director
surface, so the server does not claim a fabricated HP threshold or a guessed
bind/stun duration.

The private director counts both exact actor-class kills, rejects ambient
kills, and returns the party to Alberic on death, timeout, failed setup, or
content-area exit. The historical encounter recommended seven accompanying
party members; the current shared quest shell caps the adapter at three total
entrants until the original content capacity and after-warp owner are live-
verified. The normal-fade `processEvent025` branch is used for this safe return;
the client `processEvent020` after-warp branch remains a follow-up for a future
public/retail placement owner.

### Pgl200 — The House Always Wins (enabled)

The existing NPC/counter route is retained:

```text
Titinin -> Esperaunce (three conversations) -> [existing duty placeholder]
    -> Naida Zamaida -> Lady Lewena trigger -> Singleton
        |
        v
SEQ_030
    private content copy
      spawn: actor class 2289013 / mob type 3108
      unique id: pgl200_toothless_gladiator
      exact kill -> sequence 35
        |
        v
SEQ_035
    Titinin / processEvent070 / CompleteQuest
```

The earlier Eshtaime step is now materialized as a real private-area
objective instead of a reward-only placeholder:

```text
SEQ_010
    GSM door -> PrivateAreaMasterPast, level 5
      five identity-keyed actor-class 1090199 pickup triggers
      pgl200_coin_1 ... pgl200_coin_5
      each successful push sets one quest flag and updates Shiny Chip 11000100
        |
        +-- all five flags -> Esperaunce becomes talkable
        +-- exit/re-entry -> flags are retained; spent pickups do not count twice
        v
    Esperaunce / processEvent020_2 + processEvent030
      King of Plots gil presentation -> SEQ_015 / public return
```

The five-count and Shiny Chip identity are recovered from the client journal
and item data. The exact retail object transforms are not present in the
current actor archive, so the five SQL rows are explicitly labeled layout
scaffolds and kept in one idempotent migration for later position correction.
The quest logic is not position-dependent: it parses the unique id, stores an
individual flag, despawns the consumed actor, exposes the count through
`getJournalInformation`, and refuses unknown or duplicate pushes.

The former implementation advanced to sequence `35` and performed a public
map warp as a temporary substitute for the final fight.  That shortcut is
removed.  The Singleton entry event now starts the private content group and
leaves the quest at sequence `30` until `QuestDirectorClassPgl200.lua` sees the
Toothless Gladiator actor-class kill.  Death, timeout, failed entry, or leaving
the boundary returns the owner to sequence `30` for retry.  With the earlier
Eshtaime objective now backed by five static private-area rows, `110060` is the
second class quest exposed by the availability table.

The final reward itself is central: 20,000 gil, 2,000
pugilist guild marks, Spiked Knuckles (`4020208`), and 1,760 EXP.  The script
only sends the legacy `sqrwa` presentation; it does not add a second EXP/item
grant.

The Wise Miser scene (`processEvent040`) returns the ask-65 pay/decline
result: paying plays `pgl20040` and advances, while declining only plays
the mockery line and leaves the player on the step to talk again.  The
decomp's `processEvent013`/`017`/`035` are empty functions with no scene
and stay unbound.  Marker rows `11006009`–`11006020` are filler.

## Shared fight mechanics

`Data/scripts/private_quest_battle.lua` is a thin class/job adapter over
the existing Grand Company squad-battle lifecycle.  The common implementation
now supports a caller-selected content script and namespace, while existing
Grand Company routes retain their old defaults.

The lifecycle is intentionally explicit:

1. The quest script plays the client decomp event and moves to a battle-only
   sequence.
2. The launcher validates the owner, party size, same-area helpers, and public
   source area.
3. `CreateContentArea` creates a private shell and binds the quest-specific
   director.
4. The content shell applies a circular boundary and disables re-entry.
5. The launcher spawns one exact `(actorClassId, mobTypeId, uniqueId)` target,
   or a small recovered target list. A multi-target fight completes only after
   every configured target copy has produced a private kill callback; repeated
   actor classes are counted independently up to their configured copy count.
6. The director waits for asynchronous zone-in, then accepts only the matching
   actor-class kill callback and exact owner sequence.
7. If the recovered quest has a second objective, success advances to its
   explicit post-fight sequence rather than directly to reward. For Mnk0j2,
   only item `11000552` at sequence `6` consumes the instrument and advances
   to Erik's reward boundary.
8. Otherwise, success advances the owner to the public return sequence. Death,
   timeout, zone exit, or failed setup returns to the configured retry sequence.
9. The target is despawned, every landed participant is returned through the
   content return point, and the area/director are torn down.
10. The public quest NPC owns the cutscene and reward transaction.

The distinction between IDs is critical:

| Identity | Example | Used for |
| --- | ---: | --- |
| Actor class | `2289006` | Lua kill callback and NPC/BNPC identity |
| Mob type | `3034` | combat level, stats, skills, and spawn profile |
| Unique ID | `gla200_ala_mhigan_challenger` | private-area lookup/despawn |
| Display/model ID | `1500022` | marker/dat presentation; not safe for `onTalk` |

## Recovered fight inventory

These rows are present in local fight/materialization data; the status column
distinguishes the newly enabled slices from the remaining gated candidates:

| Quest | Fight binding | Why it remains gated |
| --- | --- | --- |
| Alc200 | Craft Potent Medication from Mummified Mole and Eye Drops, preserve it through Nogeloix's inspection, hand it to S'lyhhia, then enter the ward and report | Hidden crafting/transaction hard stop; five states, six markers, Patch-1.21 recipe, initial-town scene branch, and final `processEvent030` are recovered, but prerequisite conflict, work-slot/synthesis/handoff mutation, private lifetime, Linkpearl, and reward era remain unresolved |
| Alc300 | Buy optional information with Frondale's Funds, win one of three Penelope Parley variants, receive Starfall Grass, deliver it, then complete the ward scene | Hidden Parley/transaction hard stop; seven states, ten markers, four items, titles `1302`–`1304`, scenes, and final `processEvent020` are recovered, but Damielliot/info/final actors, payment/memo policy, title/result mapping, item transactions, and private lifetime are unresolved |
| Alc306 | Enter Damielliot's past through the Echo, obtain Frondale's Poultice, synthesize Faustigeant's Salve on site, administer it, and report | Hidden Echo/crafting hard stop; six states, four markers, proven poultice-to-salve contract, two-scene rescue and final `processEvent030` are recovered, but Damielliot variant, complete recipe, synthesis/delivery transactions, and private-past owner are unresolved |
| Bsm200 | Shared Blacksmith/Armorer route with four class-specific instrument outputs per branch | Hidden dual-class crafting hard stop; both exact recipe branches, states `0/5/7/8/9`, nine markers, and final `processEvent020` are recovered, but class gate, synthesis/result transactions, scene owners, and class/era reward selection are unresolved |
| Bsm300 | Six miners, each with a three-stage Parley, produce Seastone or Reverberating Steel and finally a Whistling Windwheel | Hidden multi-Parley hard stop; six-by-three structure, items, state bands, twelve markers, scenes, and final `processEvent040` are recovered, but opponent/title/result bindings, counters, item choice/transactions, and private lifecycle are unresolved |
| Bsm306 | Craft class-specific earplug components and wear Brass Earplugs while solving an eight-victim, three-clue island puzzle | Hidden equipment/interaction hard stop; dual recipes, mandatory equipment gate, one-clue-at-a-time rule, states, scenes, and final `processEvent040` are recovered, but island actors, clue/victim mapping, item mutation, private lifecycle, and reward policy are unresolved |
| Cnj300 | Plural enraged elementals at Amberscale Rock; exact actors/count unknown; each nature/aspect must be identified and answered with appropriate magic | Hidden mechanic hard stop; Soileine/Morys/Yuhelmeric/rescued-knight route, seven markers, sequence-15 substate, fallen-knight aftermath, Echo, and rewards are recovered, but the elemental roster/profiles/skills/aspect behavior and content lifecycle are absent |
| Cnj306 | Duty 1 escorts Morys through Yarzon Stalkers and a simultaneous Furline Mosstrooper group; duty 2 defends him/young Morys against exactly three Hungry Dreadwolves | Hidden two-director hard stop; Morys HP-zero/distance failure rules, all eight markers, nine journal states/scenes, Mysterious Leather Bag, three pre-Echo elementals, and rewards are recovered, but exact Morys/wolf/Mosstrooper variants, profiles/skills, escort copies/path/endpoint, and dual-duty lifecycle are incomplete |
| Cul200 | Cook Piping Hot Pie Crust and Aromatic Pate through two independent customer branches | Hidden crafting hard stop; both exact five-material recipes, work counters, eight markers, final `processEvent030`, and reward conflict are recovered, but final interaction owner, result mutation, inventory transactions, and after-warp lifetime are unresolved |
| Cul300 | Investigate the missing gastronome and win one mandatory Parley with the thickset sailor/tailor | Hidden Parley hard stop; nine states, seven markers, opponent candidates, event spine, and final `processEvent035` are recovered, but exact variant/title/result, intermediate actors/private transitions, and reward transaction are unresolved |
| Cul306 | Gather specialist ingredients, cook Foulbelly then Devilbelly Meatballs, and pass two separate Echo gates | Hidden crafting/Echo hard stop; two recipes, five work counters, eleven markers, two `51030` gates, scenes, and final `processEvent070` are recovered, but Devilshroom source, actor variants, ingredient/recipe grants, synthesis transactions, and private lifetime are unresolved |
| Exc300 | Five unique stolen valuables at the Krakens' den; no combat target | Enabled as a bespoke script; Rostnsthal is actor `1001652`, marker `11010103` is the pre-existing `push_mrd` guild-door waypoint, and the five flag-keyed pickups plus Rorojaru sale are live. Per-spot `trialObject` variant mapping and exact valuable transforms remain documented scaffolds |
| Exc306 | Forced first loss followed by a rematch with Moenskaet the Honorbound (`2289004` or `2289005`) and right/left-hand candidates `2280219`/`2280220`; no exact mob profiles | Hidden combat hard stop; all eleven real markers, ten scene/dialogue boundaries, Kraken Register, first-loss/rematch story, final `processEvent080`, and rewards are recovered, but boss variant, add copies/profiles/skills/waves/cap, register ownership, and two-stage lifecycle are incomplete |
| Fsh300 | Non-combat Barrel trial: feed the fish, travel by boat, deliver Wawalago's message, equip the Star-Spangled Subligar, pass four emote rounds, catch exactly one unrestricted fish, and use the Echo | Hidden fishing/interaction hard stop; actors, thirteen markers, eleven states, items, boat asks, emote sets, scenes, and final `processEvent075` are recovered, but item transactions, equipment validation, emote counters, catch credit, public triggers, and travel lifecycle are absent |
| Fsh306 | Timed sale of one randomly selected fish from five exact choices, followed by three separate Echo interactions | Hidden timed-fishing hard stop; states `0/5/20/25/28` plus `10..19`, selector roster, timeout/reminder/sale hooks, eight markers, scenes, and final `processEvent070` are recovered, but selection/deadline persistence, clock policy, fish consumption/payout, timeout/retry flow, and Echo substates are absent |
| Gld200 | Three mandatory miner Parleys grant three sketches and the Ideal Miner Sketch, followed by synthesis of Z'ssapa's Brooch and an Echo | Hidden Parley/crafting hard stop; Elecotte/Colbernoux, nine markers, eight states, seven exact quest items, scenes, and final `processEvent060` are recovered, but actor variants, title/result flags, synthesis registration, item transactions, private-area lifecycle, and reward-era selection are absent |
| Gld300 | Protect and follow a spriggan through three hostile encounters; it fights back, fails the route if killed, cannot be healed with magic, and is healed/buffed by crafted Violet Augite; then win one Moogle Parley | Hidden escort hard stop; ten markers, complete journal ranges, five items, negotiation title `3801`, exact three-encounter/follower failure behavior, scenes, and final `processEvent090` are recovered, but the spriggan binding, enemies/copies/waves, node callbacks, follower AI/damage/failure owner, and private lifecycle are absent |
| Gld306 | Win a Sence Parley, collect exactly one each of three storehouse materials, synthesize the Heartstrike Replica for no synthesis SP, then complete an Ossuary Echo | Hidden interaction/crafting hard stop; six markers, seven state bands, four items, scenes, empty director, and final `processEvent040` are recovered, but storehouse object actors, Parley title/result, recipe callback, item transactions, Echo owner, and reward variant are absent |
| Hrv200 | Non-combat clearing/harvesting of every troublesome weed near Quarrymill; gather dynamic-count Spiny Turnip Leaves and return to Opyltyl | Hidden gathering hard stop; Opyltyl/Cicely, four markers, states `0/5/10`, item cleanup, scenes, and final `processEvent030` are recovered, but weed count/nodes, callbacks, trigger ownership, prerequisite conflict, and atomic cleanup/rewards are absent |
| Hrv300 | Gather one Bowing Pine Branch and one Foul-smelling Nut, conduct a Penelope Parley, then perform a seven-item exchange chain across Gridania and Ul'dah | Hidden gathering/Parley hard stop; actors, ten markers, states through `30`, exact items/visibility, Parley title `1301`, scenes, and final `processEvent040` are recovered, but node-to-item binding, negotiation result persistence, seven atomic exchanges, Nenekko variant, and final trigger ownership are absent |
| Hrv306 | Two non-combat gathering instances: dynamically harvest Pearl Clover Seeds, then correlated Yarzon Faeces while avoiding sleep/wake Yarzon hazards; finish an Echo and seedling delivery | Hidden stealth/gathering hard stop; twelve markers/states, items, over-harvest branch, hazard-not-kill rule, scenes, Echo, and final `processEvent070` are recovered, but count formula, node/hazard actors, stealth/aggro lifecycle, dynamic payloads, delivery actors, and reward owner are absent |
| Lnc300 | Dreues physical test followed by an escort defense against an unidentified pack of raging beasts | Hidden combat hard stop; Willelda/J'moldva/Gagaruna/Dreues, all seven real markers, nine journal states, eight cutscenes, caravan protection, injured-moogle aftermath, and rewards are recovered, but no enemy family/actor/count/profile/wave or protected-caravan failure contract is identified |
| Lnc306 | Protect an Ul'dahn merchant caravan from an enraged elemental force; three merchant and three Wailer aftermath dialogue slots are recovered | Hidden combat hard stop; Willelda/J'moldva ownership, five markers, six journal states, five scenes, Echo gate, and rewards are exact, but the elemental actor/copies/profiles/skills/waves, protected actors/failure rule, destination trigger, and content lifecycle are absent |
| Min200 | Mine one Sheep's-eye, one Petrified Wood, and one Ewer Fragment from normal nodes in eastern, western, and central Thanalan, then complete Z'ssapa's appraisal and Nenekko's story handoff | Hidden gathering hard stop; Linette ownership, eight markers, six journal states, all three exact items/regions, appraisal branches, and final `processEvent050` are recovered, but quest-item catch flags, node bindings, appraisal/consumption mutation, and private-instance ownership are absent |
| Min300 | Non-combat chain: parley with the carriage driver, inspect the buried box near Longroot, meet Nenekko, then use the Echo separately on both twins | Hidden interaction hard stop; fourteen markers, ten states, `min30010`–`70`, and both Echo boundaries are recovered, but parley mutation, the box actor, Linkpearl/private handoffs, and per-twin Echo flags are absent |
| Min306 | Escort Nenekko to Vesper Bay; at each of three stops mine both newly appearing points once, for six interactions total, to lose the pursuer rather than kill it | Hidden gathering/escort hard stop; seven markers/states, exact three-stop/two-node rule, non-kill outcome, scenes, rewards, and Master of Rock are recovered, but escort/pursuer/node actors, paths/transforms, mining callbacks, and failure/retry lifecycle are absent |
| Tan200 | Repair Damaged Wailer Armor, make and equip a replacement Wood Wailer's Jacket, pass its stable inspection, and deliver it to Quarrymill | Hidden crafting/equipment hard stop; Hereward/Lalatta ownership, seven states, eleven markers, armor items/repair ingredients, equip gate, scenes, and final `processEvent050` are recovered, but actor variants, replacement recipe/result mutation, inventory cleanup, equipment callback, and after-warp ownership are absent |
| Tan300 | Deliver a Leather Chocobo Saddle, survive a cinematic ambush resolved by Lalatta, craft a Fen-Yll Birkin Bag, and win Vielle's Parley | Hidden crafting/Parley hard stop; eight markers, exact bag materials, title `1101`, hostage scenes, zero player kill targets, and final `processEvent050` are recovered, but delivery/hostage actors, item transactions, Parley mutation, and private transitions are absent |
| Tan306 | Win the novice's Parley, complete one of eight five-item evaluation recipes, repair Vintage Fen-Yll Boots, then enter Lalatta's Echo | Hidden selector/crafting/Echo hard stop; ten states, all eight exact recipe variants, boot repair, title `5401`, fifteen markers, Echo ask `51030`, and final `processEvent050` are recovered, but student/novice actors, selector/result mutation, inventory transactions, and private-Echo ownership are absent |
| Wdk200 | Deliver Vibrant Arrows, search for three branch candidates, choose one through ask `85`, and repair Wybir's Splintered Bow | Hidden search/crafting hard stop; six states/markers, all branch and bow outcomes, scenes, and final `processEvent040` are recovered, but search callbacks, selector mapping, recipe/result mutation, actor placement, and item cleanup are absent |
| Wdk300 | Find the scattered younglings through mandatory Parleys, deliver building blocks to the Phrontistery, then carry Sable Salve to Marcelloix | Hidden multi-Parley/delivery hard stop; nine states plus six substates, named leads, four title/event variants `2101/2201/2301/2302`, twelve real markers, and final `processEvent070` are recovered, but child actors, fourth title mapping, result flags, package transactions, and private ownership are absent |
| Wdk306 | Prepare Fairweather Fetishes, scout with Wybir while supplying arrows for her to shoot the threats, then complete the Mirror excursion and artwork | Hidden escort/interaction hard stop; this is archived non-combat with zero player kill targets; ten states, items, nine real markers, scenes through `wdk30660`, and final `processEvent060` are recovered, but enemy/arrow/ally callbacks, route actors/transforms, failure semantics, and reward variant are absent |
| Wvr200 | Repair one Red Riding Hood from the Ripped Riding Hood, Undyed Cotton Cloth, All-purpose Red Dye, and Cotton Yarn, then return it to Chuchumu | Hidden crafting hard stop; Deaustie ownership, four markers, five states, exact recipe/item visibility, Linkpearl, scenes, and final `processEvent030` are recovered, but synthesis flags, item transactions, Golden Bazaar trigger actors, private transitions, and post-1.20 EXP amount are absent |
| Wvr300 | Find Theldry's Midnight Slippers, then advertise her shop by winning four Parley encounters against Cicely, Nesta, Keelty, and Miounne | Hidden Parley hard stop; Deaustie/Chuchumu/Soileine/Theldry identities, ten markers, six states, all four opponent event groups, item, scenes, and true final `processEvent030` are recovered, but negotiation-title bindings, launch/result flags, slipper transaction, and private transitions are absent |
| Wvr306 | Free web-entangled Chuchumu one silk strand at a time and synthesize ten Luxurious Gloves beside her using ten Undyed Velveteen and ten Cotton Yarn | Hidden non-combat crafting/content hard stop; six markers, seven states, exact recipe/count/location rule, scenes, both empty director shells, and final `processEvent030` are recovered, but per-strand/synthesis flags, private SQB entry/success/cleanup, actor variants, Echo ownership, and atomic rewards are absent |
| Arc200 | Yarzon Invader candidates `2205503`, `2205504`, `2205505`; no exact mob profiles/count | Hidden hard stop; Nonolato/Keelty owners, all four markers, scenes, escaped-Ixal rule, and final report are recovered, but the archive does not prove which candidate actors spawn, how many copies/waves, or the content/failure lifecycle |
| Arc300 | Encounter roster unresolved | Hidden evidence only; all eight real markers and `arc30010/15/20/25/30/40/50` are staged, but marker display IDs do not prove route actors and no exact target/allies/profile/count/cap/content owner is recovered |
| Arc306 | First escape the Yarzons without a kill requirement; then defeat only Siward (`2289016`/`17`/`18` candidate), while optional Yarzons may attack him | Hidden two-director hard stop; Nonolato/Keelty/Siward identities, six markers, states `0/5/7/10/15/20`, five scenes, cutscene choice, and exact victory exclusions are recovered, but informant owners, Yarzon/Siward/Keelty battle variants, profiles/counts/waves/cap, and dual-duty lifecycle are incomplete |
| Thm200 | One death-marked billygoat `2202303`; no exact mob profile | Hidden hard stop; Yayake/I'loofii owners, all three markers, unique boss count, Twisted Aldgoat Horn proof, scenes, Wind Brand, gil, and post-1.20 EXP are exact, but boss stats/skills, surrounding herd, entry/proof-item/failure lifecycle, and party cap are absent |
| Thm300 | Eight Lemmings, exact actor classes unresolved; one protected Naldiq & Vymelli smith, actor unresolved | Hidden hard stop; nine markers, Baderon/Bodenolf/Yayake actors, smith outcome states 12/13, Writ of Access, Echo scene, and final report are staged, but rival/smith/target identities, composition/waves/cap/content lifecycle, and reward policy remain unresolved |
| Thm306 | One overweening thaumaturge, route actor `1000607` and battle candidate `2289015`; no exact mob profile | Hidden combat hard stop; Yayake/I'loofii ownership, four real markers, Echo gate, singular rival, after-warp lead-in/aftermath, final `processEvent060`, and rewards are recovered, but hostile binding, level/stats/skills, nonlethal victory, cap, content owner, and cleanup are unresolved |
| War0j1 | Antling Worker x4, actor `2203001`, adapter mob `32730`, skill list `3` | Enabled private adapter; the actor/model/skill family is source-backed, while the public Western Thanalan spawn, retail count, and exact field balance remain unresolved |
| War0j2 | Sirocco, actor `2100309`, public mob `3097`, skill list `4` | Enabled private adapter for retail open-world objective; exact actor/profile/skill family is local evidence, while Central Shroud placement and public trigger owner remain unresolved |
| War0j3 | Canyon Condor, actor `2201208`; no exact mob profile or count | Hidden hard stop; northern fight marker, east-gate aftermath marker, four-person cap, scene, return, and Collusion reward are exact, but “flock” proves only plurality and the bird has no combat binding |
| War0j5 | Audhumbla, actor `2100804`; no exact mob profile | Hidden hard stop; the single target, Iron Lake cave marker, party cap, and completion widgets are recovered, but Great Buffalo `2100801/3045` is a different NM and is not a legal fallback |
| War0j6 | Curious Gorge `2289037/3012/list 15` plus Cliffdiver `2201209`; Cliffdiver has no exact profile | Hidden hard stop; one frenzied Gorge, the second enemy family, eight-person cap, Silver Bazaar markers, and aftermath/reward scenes are recovered, but bird copies/waves and duty ownership are absent |
| Mnk0j1 | Runagate Imp ×3, actor `2202611`, level 35; no exact mob profile | Hidden hard stop; exact count, level, four-person cap, Mythril Pit route, automatic `mnk0j110` aftermath, and rewards are recovered, but the destination trigger, automatic completion owner, and Runagate-specific combat profile are absent |
| Mnk0j2 | Gluttonous Gertrude, actor `2102010`, public mob `3043`, skill list `6014`; Aetheriometer `11000552` | Enabled private adapter plus exact post-kill item objective; Lower La Noscea placement and retail timing remain unresolved |
| Mnk0j3 | Prince of Pestilence, actor `2100610`, mob `3081`, effective skill list `6026`; Outdated Aetheriometer `11000553` | Hidden hard stop; the exact one-boss fight must advance to a separate measurement point whose marker has no actor class/full transform or location-bound item-command owner |
| Mnk0j4 | Apep, actor `2100723`, level 53; no exact mob profile | Hidden hard stop; one-target count, eight-person cap, Experimental Aetheriometer, marker, and completion widgets are exact, but the quest-specific basilisk has no stats/skills/spawn owner |
| Brd0j1 | Qiqirn Shirrer ×4, actor `2206306`; no exact mob profile | Hidden hard stop; count, four-person cap, route, and reward are known, but a generic Qiqirn profile would invent the fight and Jehantel/Pukno lack public spawn contracts |
| Brd0j2 | Bardi, actor `2101413`, public mob `3003`, skill list `6002` | Enabled exact private adapter; Nanawa Mines marker and Bardi NM spawn/profile are source-backed, while the private shell owns the quest boundary |
| Brd0j3 | Phaia, actor `2101509`, public mob `3080`, skill list `6025` | Enabled exact private adapter; Central Shroud marker and Phaia NM profile are source-backed, while the original public spawn/content owner is not materialized |
| Brd0j4 | Ixali Scout `2206412` plus Scout Wolf `2201428`; no exact mob profiles | Hidden hard stop; both enemy families, levels 52/50, eight-person cap, Hyrstmill marker, and two-scene lifecycle are recovered, but copies/waves/skills and after-warp ownership are absent |
| Gla300 | J'moldva, actor `2289009`, mob `3062` | Enabled; Yoyobina public Y/rotation remains a documented placement scaffold |
| Gla306 | Player fight: Ala Mhigan challenger `2289007/3035`; observed match: bladedancer `2289010/3033` | Enabled safe player-fight slice; the observed match/refugee scene owner remains unresolved |
| Pgl300 | Kraken deckhand, actor `2280217`, mob `3066` | Enabled; ship-object and Hurrey Y/rotation remain documented placement scaffolds |
| Pgl306 | Ossuary Almstaker, actor `2289014`, mob `3079` | Enabled; generic Silver Bazaar trigger actor and public Y/rotation remain documented placement scaffolds |
| Blm0j2 | Daddy Longlegs, actor `2105513`, public mob `3013`, skill list `71` | Enabled private adapter for retail open-world objective; exact actor/profile/skill family is local evidence, while Western Thanalan placement and public trigger owner remain unresolved |
| Blm0j1 | Guano Gnat, actor `2200610`, mob `3050`, skill list `94` | Hidden hard stop; exact Brundleflight AI and the two NQ scenes are known, but “several” has no authoritative copy count and the content owner must preserve both scene transitions |
| Blm0j3 | Ragged Hippocerf x2 (`2200406/3089`) then Whitetalon (`2200407/3114`) | Enabled; public Kazagg/trial locations remain source-backed placement scaffolds |
| Pld0j1 | Wandering Soldier/Mage/Bogy plus Specter fallback (`2201807/32731`, `2201808/32732`, `2204318/32733`, `2206901/32734`) | Enabled private adapter; three client resources are exact, while the empty SpecterNormalPld0j1 shell requires the labeled generic SpecterStandard fallback |
| Pld0j2 | Alux, actor `2102609`, public mob `3000`, skill list `42` | Enabled private adapter for retail open-world objective; exact actor/profile/skill family is local evidence, while Mun-Tuy Cellars placement and public trigger owner remain unresolved |
| Pld0j3 | Old Six-arms, actor `2107614`, public mob `3078`, skill list `21` | Enabled private adapter for retail open-world objective; exact actor/profile/skill family is local evidence, while Lower La Noscea placement and public trigger owner remain unresolved |
| Pld0j5 | Jenlyns Straightblade, actor `2289035`, mob `3064` | Enabled; public high-ground marker is retained while the generic private shell owns the fight boundary |
| Pld0j6 | Manipulated Eye (`2201706/3069/list 2`) plus Manipulated Ogre (`2202503/3070/list 34`) | Hidden hard stop; copies, waves, allied Jenlyns/Solkzagyl behavior, and the warp-sensitive `pld0j610`/`pld0j620` content owner remain unknown |
| Drg0j2 | Bomb Baron, actor `2101610`, public mob `3007`, skill list `12` | Enabled private adapter for retail open-world objective; exact actor/profile/fire skill family is local evidence, while Cassiopeia Hollow placement and public trigger owner remain unresolved |
| Drg0j3 | Spitfire, actor `2106207`, public mob `3101`, skill list `1` | Enabled private adapter for retail open-world objective; exact actor/profile/skill family is local evidence, while Millers' Glade placement and public trigger owner remain unresolved |
| Drg0j5 | Stollenwurm, actor `2102219`, adapter mob `32729` | Enabled private adapter for retail open-world objective; public Camp Riversmeet field owner and eight-person balance remain unresolved |
| Drg0j6 | Estinien Wyrmblood (`2289038/3028`) plus Greywine (`2202208/3049`) | Enabled private adapter for the two-target quest battle; purple counter timing, after-warp owner, and historical party capacity remain source-backed follow-ups |
| Mnk0j6 | Widargelt the Watcher (`2289039/3115`) plus three Ala Mhigan soldiers (`2289040/3036`, `2289041/3032`, `2289043/3037`) | Enabled private adapter for the four-target quest battle; public Silvertear Falls owner, chakra phase callbacks, and historical party capacity remain source-backed follow-ups |
| Whm0j1 | Diremite Straggler ×1 (`2201115`) plus Miteling Straggler ×3 (`2201114`); no exact mob profiles | Hidden hard stop; exact roster/count, four-person cap, Mun-Tuy marker, Raya/moogle scenes, and rewards are recovered, but combat profiles, formation, entry owner, Nirvana transition, and public route actors are absent |
| Whm0j2 | Downy Dunstan, actor `2106017`, public mob `3019`, effective skill list `6010` | Enabled exact private adapter; Camp Glory marker/profile and four-person contract are source-backed, while Raya-O-Senna's public spawn remains a live reachability check |
| Whm0j3 | Cactuar Jack, actor `2100910`, public mob `3009`, effective skill list `6006` | Enabled exact private adapter; public NM placement and four-person contract are source-backed, while the private unique ID prevents ambient completion |
| Whm0j4 | Bandit and minions; nearby actors `2289031`–`2289034` are unbound candidates only | Hidden hard stop; eight-person cap, Bearded Rock/return markers, Oha-Sok aftermath, `whm0j410`, and Holy reward are exact, but no target-to-quest join, profiles, counts, waves, entry owner, or linkpearl ordering is proven |
| Whm0j6 | Icebound Wrath `2204707/3055` and Earthbound Wrath `2204907/3020`; four additional elemental families are named | Hidden evidence only; the source calls for an eight-person multi-element encounter, but copies, waves, remaining actor/profile bindings, kill rules, marker placement, and content ownership are unknown |
| Blm0j6 | Barbatos `2203503/3002/list 10` plus “several” Void Lanterns; lantern actor mapping unresolved | Hidden hard stop; exact interrogation route, eight-person cap, boss-kill win condition, 45-second lantern reset mechanic, scenes, and rewards are recovered, but the boss profile has level 0/no spells and lantern count/profiles/content lifecycle are incomplete |
| Brd0j6 | Yotoli Hueloc `2206413/3117/list 14` plus four exact level-53 Ixali types `2206414`–`2206417` | Hidden hard stop; five enemy types, eight-person cap, marker, scene-only actors, `brd0j610`, and rewards are exact, but multiplicities/waves are unknown, four types lack profiles, and Yotoli lacks CNJ spells |
| Drg0j1 | Crabfisher ×3 `2204511` level 33 plus Ironshell ×1 `2207612` level 35; no exact mob profiles | Hidden hard stop; exact four-target roster, four-person cap, Alberic route, Nine Ivies marker, `drg0j110`, and rewards are recovered, but profiles, wave partition, entry transform, and content lifecycle are absent |

No hidden job row retains a runnable target/director pair. In particular,
`Whm0j6` no longer treats one Icebound Wrath as the entire retail encounter:
that earlier preparation contradicted the recovered eight-person,
multi-element fight evidence and has been removed.

All 42 job rows now have an explicit boundary disposition: 18 enabled offers,
16 validator-enforced held combat contracts, and 8 validator-enforced held
AF/destination interactions. A hidden row can therefore no longer be only an
unexplained marker placeholder; its known route, roster, count/mechanic, scene,
reward, and exact blocker are materialized wherever the source permits.

The level-20/30/36 Alchemist, Archer, Blacksmith/Armorer, Carpenter, Conjurer,
Culinarian, Leatherworker, Marauder, Lancer, Thaumaturge, Miner, Fisher,
Botanist, Weaver, and Goldsmith audits now apply the same rule to forty-one
more class rows.
`Alc200`, `Alc300`, `Alc306`, `Arc200`, `Arc300`, `Arc306`, `Bsm200`,
`Bsm300`, `Bsm306`, `Cnj300`, `Cnj306`, `Cul200`, `Cul300`, `Cul306`, `Exc306`,
`Fsh300`, `Fsh306`, `Gld200`, `Gld300`, `Gld306`, `Hrv200`, `Hrv300`, `Hrv306`, `Lnc300`, `Lnc306`,
`Min200`, `Min300`, `Min306`, `Tan200`, `Tan300`, `Tan306`, `Thm200`,
`Thm300`, `Thm306`, `Wdk200`, `Wdk300`, `Wdk306`, `Wvr200`, `Wvr300`, and
`Wvr306` have corrected actor identities, ordered
marker/scene metadata,
fight/gathering/item facts, reward conflicts, and explicit rejected filler ranges. They
remain metadata-only—no live `route`, `battle`, target, or director table
exists—so a display ID or incomplete roster cannot accidentally become an
offerable duty. `Arc200` now completes on
Nonolato's `processEvent050` report rather than post-fight `processEvent040`;
`Thm300` likewise completes on Yayake's `processEvent050`, not the rival
aftermath; and `Exc306` completes on Waekbyrt's `processEvent080`, not the
preceding `processEvent070` Echo gate. `validate_class_held_routes.py` protects
all forty-four currently audited held class routes. Lnc300 likewise ends at
Willelda's `processEvent075` reward dialogue; `processEvent070` is J'moldva's
preceding after-warp report. Arc306 completes only on Nonolato's
`processEvent050`, after Keelty's `processEvent040` confession. Cnj306 keeps
the shared `cnj30690` scene's `processEvent090` AfterWarp variant separate
from the recovered `processEvent095` default-fade reward hook. Lnc306 now ends
at Willelda's `processEvent060` dialogue; `processEvent050` is only J'moldva's
preceding report. Min200 completes only on Linette's `processEvent050` reward;
Min300 must pass both twin Echo scenes and completes on `processEvent070`, not
the earlier `processEvent050` presentation; Min306 completes on Linette's
`processEvent040` after the ferry escort and Linkpearl report. Fsh300's
`processEvent070` is only its Echo and final completion is N'nmulika's
`processEvent075`; Fsh306's `processEvent060` is its third Echo and final
completion is N'nmulika's `processEvent070`. Hrv200/Hrv300/Hrv306 retain the
already-correct final hooks `processEvent030`, `processEvent040`, and
`processEvent070`, while their actor, reward, and objective metadata is now
corrected. Wvr300 no longer completes at the Midnight Slippers delivery scene
`processEvent020`; Deaustie's `processEvent030` is the actual reward boundary.
Wvr306 also preserves its recovered SimpleQuestBattle child as a non-combat
interaction/synthesis shell: the archive requires no spider kills and reports
only ten on-site glove syntheses while freeing Chuchumu. Goldsmith now ends at
Elecotte's `processEvent060`, Colbernoux's `processEvent090`, and Colbernoux's
`processEvent040` respectively; the old Gld306 `processEvent020` hook was only
a middle scene.
Alchemist now completes on `processEvent030`, `processEvent020`, and
`processEvent030`; the previous Alc300 hook stopped before Starfall Grass was
delivered. Blacksmith/Armorer completes on `processEvent020`, `040`, and `040`,
with Bsm306's old `020` likewise only a middle scene. Culinarian keeps
`processEvent030` for Cul200 but ends Cul300/Cul306 at `processEvent035` and
`processEvent070`, after the investigation and both Echo gates.
Leatherworker now ends all three recovered routes at `processEvent050`; the
level-36 `processEvent040` is its Echo gate, not completion. Carpenter ends at
`processEvent040`, `processEvent070`, and `processEvent060`; the old Wdk300
`processEvent060` was Marcelloix's cure aftermath, while Wdk306's old
`processEvent030` was only the scouting aftermath. Wdk306's offer hook is now
Marcelloix's recovered `processEventMarcelloixStart`, not an inferred
Nonolato/A'naidjaa start.

War0j1 is now an enabled private adapter: its Neale/Curious Gorge route,
source-backed Antling Worker identity, and four-copy exact-kill boundary are
wired while the public Western Thanalan fight owner remains unresolved. Mnk0j6
is now an enabled private adapter: its exact four-target fight,
`mnk0j610`/`mnk0j620` scene hooks, item/action presentation, and Erik return
boundary are wired, while its public Silvertear Falls owner remains explicitly
unresolved. Whm0j6 now retains its decomp-backed pre/post scenes and reward
presentation only as held evidence; it has no `targets` or `directorScript`
until the complete elemental roster and duty lifecycle are recovered. War0j1,
War0j2, Pld0j1, Pld0j2, Pld0j3, Pld0j5, Blm0j2,
Blm0j3, Brd0j2, Brd0j3, Whm0j2, Whm0j3, Drg0j2, Drg0j3, Drg0j5, Drg0j6, Mnk0j2, and Mnk0j6 are the promoted
exceptions; their offers, recovered scene hooks, private fights, and reward
returns are now wired and exposed. Blm0j2, War0j2, Brd0j2, Brd0j3, Whm0j2, Whm0j3,
Pld0j2, Pld0j3, Drg0j2, Drg0j3, and Mnk0j2 use existing public mob profiles inside
guarded private shells, so none of those eleven needed a migration-owned combat
profile; War0j1 and Drg0j5 use explicitly named private profiles where the
retail public profile is absent.

The job archive reconciliation counts 42 job quests: 34 combat/open-world or
instance objective chains and 8 AF coffer/destination interactions.  The
pre-battle routes are documented, but the remaining public job fights still
need an authoritative actor/trigger/spawn/content owner and return/reward lock
before they can be offered. `job_quests_enabled` is now true so the explicit
War0j1, War0j2, Pld0j1, Pld0j2, Pld0j3, Pld0j5, Blm0j2, Blm0j3, Brd0j2,
Brd0j3, Whm0j2, Whm0j3, Drg0j2, Drg0j3, Drg0j5, Drg0j6, Mnk0j2, and Mnk0j6 offers can run; `offer=true` remains absent
from the other 24 rows, and marker-only boundaries still cannot
become false completions.

## Next implementation order

1. Finish Gla306's observed-match/refugee scene owner and live-verify the
   Coliseum destination; do not add the bladedancer as a kill objective.
2. Live-verify Gla300's Wailing Barracks entry and correct the Yoyobina
   placement scaffold if needed; do not change the exact J'moldva binding.
3. Live-verify Pgl300's Astalicia/Mizzenmast transition and correct Hurrey's
   Y/rotation; do not change the exact Kraken Deckhand binding.
4. Live-verify Pgl306's generic 4000257 Silver Bazaar trigger candidate and
   public height/rotation; do not change the exact Ossuary Almstaker binding.
5. Continue promoting the best-documented job entry routes one at a time;
   War0j1, War0j2, Mnk0j2, Mnk0j6, Brd0j2, Brd0j3, Whm0j2, Whm0j3, Pld0j1, Pld0j2, Pld0j3, Pld0j5, Blm0j2, Blm0j3,
   Drg0j2, Drg0j3, Drg0j5, and Drg0j6 now have safe private adapters, while
   Whm0j6 additionally needs the complete six-family elemental composition,
   copies/waves/kill rules, marker placement, and eight-person content owner.
6. Recover quest-owned actor classes and full transforms for the eight AF
   coffer/destination interactions. Their server-side flag/item engine, exact
   events, marker geography, item sets, and completion boundaries are now
   staged; generic `4000257`/Guildleve-object substitutions remain forbidden.
7. Continue the remaining level-30/36 combat-class routes.
   Arc200/Arc300/Arc306/Cnj300/Cnj306/Exc306/Lnc300/Lnc306/Thm200/Thm300/Thm306 are now exact held
   contracts (Exc300 is promoted); promotion requires resolving the blockers recorded above rather
   than borrowing family profiles, marker display IDs, or unbound quest
   objects.
8. Add the remaining class non-combat, gathering, crafting, and multi-scene
   routes only after their item/scene/reward data is reconciled. The complete
   Min200/Min300/Min306, Fsh200/Fsh300/Fsh306,
   Hrv200/Hrv300/Hrv306, and Wvr200/Wvr300/Wvr306 chains are now exact held
   contracts; promotion
   still requires real gathering, delivery, timer, parley/emote, Echo, boat,
   stealth-hazard, and escort state owners. Continue with crafting chains
   without reducing multi-step objectives to reward-NPC clicks.

The availability switch currently exposes Gla200, Pgl200, Gla300, Gla306,
Pgl300, Pgl306, Exc300, War0j1, War0j2, Mnk0j2, Brd0j2, Brd0j3, Whm0j2, Whm0j3, Blm0j2, Blm0j3, Pld0j1, Pld0j2, Pld0j3, Pld0j5,
Drg0j2, Drg0j3, Drg0j5, Drg0j6, and Mnk0j6. The remaining generated class
rows still require `offer=true`, and the other 24 job rows remain hidden until their route owners and fight
mechanics are real.

## Held route evidence (do not expose yet)

The following are the current high-value candidates, but each is intentionally
kept out of `offer=true` until the missing combat/content-owner contract is
recovered:

| Quest | Recovered objective | Blocking evidence |
| --- | --- | --- |
| Alc200 — Sleep, Cousin of Death | Nogeloix → Nomomo/Mummified Mole → Potent Medication from Mole + Eye Drops → Nogeloix inspection without consuming it → S'lyhhia handoff/ward → Nogeloix, with states `0/5/7/10/15` | SQL/archive prerequisite conflict, synthesis work-slot mutation, exact medicine consume, initial-town scene payload, private-area lifetime, item cleanup, Linkpearl and reward era remain unresolved |
| Alc300 — The Boy and the Dragon Gay | Nogeloix/Damielliot/children → Frondale's Funds → optional Background/Evaluation information → Penelope Parley title `1302/1303/1304` → Starfall Grass → ward scene, with ten markers | Damielliot/final/info actor owners, funds consumption and memo exclusivity, title-to-information/result mapping, grass transaction, private transition and atomic rewards remain unresolved |
| Alc306 — Dream On, Dream Away | S'lyhhia/Damielliot → Echo gate → Frondale's Poultice → on-site Faustigeant's Salve synthesis → rescue scenes → Nogeloix, with states `0/5/10/12/15/20` | Damielliot variant, complete recipe ingredients/row, synthesis and salve delivery transactions, private-past owner, after-warp lifetime and atomic rewards remain unresolved |
| Bsm200 — An Ear for Quality | Bodenolf → class branch → four exact Blacksmith outputs or four exact Armorer outputs → Mimidoa, with states `0/5/7/8/9` | Class-30/31 gate, per-stage synthesis and item transactions, scene/state mutation, marker ownership, reward variant/era and class-specific tool/marks grant remain unresolved |
| Bsm300 — Song of the Sirens | Bodenolf → six miners × three Parley stages → choose Seastone or Reverberating Steel → Whistling Windwheel → Mimidoa, with twelve markers and state bands through `45` | Six opponent/title bindings, eighteen result stages/counters, material choice and item transactions, private transitions, class-specific rewards and atomic completion remain unresolved |
| Bsm306 — The Sound of Silence | Craft Blacksmith Mold or Armorer Casing → Brass Earplugs → equip them → solve eight-victim island puzzle while holding one of three clues at a time → Mimidoa | Island actors, exact clue/victim mapping, one-clue mutation, equipment check, synthesis/item transactions, private lifecycle, post-1.20 EXP and class reward policy remain unresolved |
| Cnj200 — Dendrological Duties | The journal says to clear a pack of rabid coywolves; actor class `2201408` is the exact local rabid-coywolf identity | No matching `server_battlenpc_mob_types` row, skill list, or authoritative private copy count is present for `2201408`; using the generic Wolf profile would silently change the fight |
| Cnj300 — Good Knight, Sweet Dreams | Soileine → Morys/Amberscale Rock → aspect-sensitive enraged elementals → fallen knight → Soileine → Owl's Nest/Yuhelmeric → rescued knight Echo → Morys → Soileine, with seven markers and the sequence-15 substate | Exact Morys variants, elemental actors/families/counts/profiles/skills/waves/levels, aspect-to-spell behavior, push/content owners, EXP scaling, after-warp event ownership, and failure/retry/cleanup remain unresolved |
| Cnj306 — The Call of Nature | Soileine → Ingram/bag → Morys escort through Yarzon Stalkers and a Furline Mosstrooper group → vanished/unconscious Morys and Echo → exactly three Hungry Dreadwolves → Ingram → Soileine, with eight markers and nine journal states | Exact Morys/wolf/Mosstrooper variants, escort copies/profiles/skills/path/endpoint, protected young-Morys actor, two private-content handoffs, after-warp ownership, item transaction, and reward atomicity remain unresolved |
| Cul200 — Showdown | Charlys → Prudentia's Piping Hot Pie Crust branch + Pulmia's Aromatic Pate branch → final scene, with two independent `5/10/15` work counters and eight markers | Final interaction actor, per-branch synthesis/result mutation, item grant/consume/cleanup, after-warp owner, tool/marks/EXP era and atomic reward remain unresolved |
| Cul300 — Mystery of the Gastronome Gone Home | Charlys → missing-gastronome investigation → mandatory thickset sailor/tailor Parley → return, with nine states and seven markers | Exact opponent variant, negotiation title/result bit, intermediate actors, private transitions, and atomic reward remain unresolved |
| Cul306 — Something in the Soup | Prudentia → Gerulf/R'sushmo/Frailoise ingredients → Foulbelly Meatball → first Echo → Devilbelly Meatball → second Echo → Charlys, with five work counters and eleven markers | Devilshroom source, actor variants, ingredient/recipe grants, two synthesis transactions, two Echo/private-area owners, and atomic era-correct reward remain unresolved |
| Exc200 — Bloody Baptism | The journal gives an exact `8/8` Lemming objective at Swiftperch Tower | The archive has several Lemming-family actors, including scenario-only `2204004`; the quest-specific actor/mob profile and content owner are not yet proven |
| Exc300 — Two-man Crew | Waekbyrt → Rostnsthal → steal Mirage Token/Ruby/Skull Island/Rum/Sourleaf → Rostnsthal → Rorojaru → Waekbyrt, with six markers and exact quest-item states | Promoted: bespoke `exc300.lua` is live; see the enabled section below |
| Exc306 — Captain's Orders | Waekbyrt → unwinnable captain's-quarters attack → cargo-hold recovery/Register → lounge/deck confrontation → rematch with Moenskaet and his men → Rostnsthal Echo → Waekbyrt, with eleven markers | Exact Moenskaet variant, add copies/profiles/skills/waves/cap, forced-loss/rematch state owner, marker `11010210/11` exact roles (`11010201/04/07` are guild-door waypoints; Rostnsthal is `1001652`), Register grant/consume, after-warp transitions, and failure/retry/cleanup remain unresolved |
| Lnc200 — A Wailing Welcome | Willelda → J'moldva → four Orchard Chigoes `2205605` → J'moldva → Willelda, with all four markers | Orchard Chigoe has no exact combat profile; no-limit party semantics, wave topology, `lnc20020` after-warp ownership, Linkpearl handling, and authoritative EXP remain unresolved |
| Lnc300 — Culture Shock | J'moldva → Gagaruna/Dreues alliance → J'moldva → south-road caravan escort → beast-pack defense/injured moogle → J'moldva → Willelda, with seven real markers and states `1..40` | Enemy family/classes/copies/profiles/skills/waves, protected caravan actors/failure rule, Dreues fight ownership, marker `11018104`, destination/content triggers, after-warp lifecycle, and cleanup remain unresolved |
| Lnc306 — Necessary Evils | Willelda → J'moldva → south-road Ul'dahn caravan → elemental defense → three merchant/three Wailer aftermath talks → surviving merchant's Echo → J'moldva → Willelda, with five real markers and states `0/5/10/15/20/25` | Elemental actor/copies/profiles/skills/waves, merchant/Wailer actor classes and failure semantics, destination/content trigger, Echo broker identity, after-warp lifecycle, retry/cleanup, and era-correct atomic rewards remain unresolved |
| Fsh300 — The Beast of the Barrel | N'nmulika → Sisipu/feed → Rerenasu/boat → Barrel Wawalago → Rorojaru/message/Subligar → four emote rounds → one unrestricted fish catch → Sisipu/Echo → N'nmulika, with thirteen meaningful markers and eleven states | Prerequisite SQL, public Sisipu/Barrel trigger ownership, atomic route-item transactions, equipment validation, emote-round binding/counters, catch credit, boat travel, dynamic journal data, and reward atomicity remain unresolved |
| Fsh306 — Polishing the Mast | N'nmulika assigns one of five exact fish under a timer → sale/timeout flow → three required Echoes on Sisipu/Sisipu/Maisie → N'nmulika, with eight meaningful markers and timed states `10..19` | Random selection/deadline persistence, bell clock source, fresh-catch policy, atomic fish removal/sale payout, timeout/extension/retry transitions, three state-25 substates, initial push owner, and transactional rewards remain unresolved |
| Gld200 — She Walks in Beauty | Elecotte → Colbernoux/Z'ssapa → Amajina Silver Nuggets/Brooch Pin → Parley with three miners for three sketches and the Ideal Miner Sketch → synthesize Z'ssapa's Brooch → F'lhaminn Echo → Elecotte, with nine markers and states `0/5/10/15/17/18/20/25` | Exact Z'ssapa/F'lhaminn/miner variants, sketch-to-miner and negotiation-title bindings, Parley state mutation, recipe registration, item transactions, private-area/Echo owner, Linkpearl, reward era, and atomic completion remain unresolved |
| Gld300 — F'lhaminn's Flower | Elecotte/Opyltyl/V'korolon → follow and protect a spriggan through three attacks using Violet Augite made from two Mismatched Stones each → Moogle Parley `3801` → one Pearl Clover Blossom → repair/deliver F'lhaminn's Flower → Colbernoux, with ten markers and state ranges through `50` | Exact spriggan quest binding, hostile actors/copies/waves/transforms, node/item-command callbacks, follower path/AI/damage/failure lifecycle, Moogle actor/result flag, private Echo owner, item transactions, reported EXP, and atomic rewards remain unresolved |
| Gld306 — Struck Through the Heart | Elecotte → Sence Parley → three storehouse interactions for Pure Metal Ore, Brilliant Glass Shards, and Silverwater → Heartstrike Replica synthesis → Colbernoux/Ossuary Echo → Colbernoux, with six markers and states `0/1/2/3-4/5/10/15` | Storehouse object actors/callbacks, negotiation title/result mutation, recipe registration, item transactions, private-area/Echo owner, Niellefresne/Greinfarr bindings, reward variant/EXP, and atomic completion remain unresolved |
| Hrv200 — Gridanian Roots | Opyltyl → Cicely → clear every troublesome weed near Quarrymill/gather Spiny Turnip Leaves → Opyltyl, with four markers and states `0/5/10` | Exact count/node transforms/callbacks, marker `02/03` ownership, leaf cleanup, after-warp lifetime, `Fade to White` prerequisite conflict, linkpearl semantics, EXP scaling, and atomic rewards remain unresolved |
| Hrv300 — The Grass is Always Greener | Cicely/Penelope → one branch + one nut → Nostalgic Ink Parley → Pirate Ship Tale → olives/letter delivery to Nogeloix/Linette/Nenekko → Amajina Ceruleum → Opyltyl, with ten meaningful markers | Item-to-area callbacks, Parley parameters/result, seven transactional consumes/grants, Nenekko variant, guild/final trigger owner, journal flags, after-warp lifetime, EXP scaling, and reward atomicity remain unresolved |
| Hrv306 — A Moogle Bouquet | Rychyld → flower-field seeds → Cicely/Greatloam → Humblehearth faeces while avoiding sleep/wake Yarzons → Cicely Echo → Opyltyl seedling → moogle delivery → Cicely, with twelve markers/states | Dynamic seed/faeces formula, node/hazard actors, stealth/aggro/over-harvest lifecycle, scene payloads, Greatloam/delivery actors, final reward owner, after-warp lifetime, EXP scaling, and atomic transactions remain unresolved |
| Min200 — A Piece of History | Linette → Z'ssapa/Nanawa → mine Sheep's-eye, Petrified Wood, and Ewer Fragment from the three Thanalan regions → appraisal → Nenekko story handoff → Linette, with eight markers and states `0/5/7/10/15/25` | Exact Z'ssapa/Nenekko variants, quest-node item callbacks/flags, appraisal and item consumption, private-instance transition, event lifetime, post-1.20 EXP amount, and atomic reward remain unresolved |
| Min300 — Little Saboteurs | Linette → V'korolon → carriage-driver parley → Longroot buried box → Linette/Nenekko → separate Popokkuli and Seserukka Echoes, with fourteen markers and states through `40` | Placeholder private transforms, parley result mutation, Linkpearl command, buried-box actor/flag, exact Nenekko/Popokkuli variants, per-Echo state ownership, and transactional completion remain unresolved |
| Min306 — Runaway Little Girl | Linette → Momodi/Nenekko → Sil'dih viewpoint → western Thanalan escort → three stops with two mining points each → Vesper Bay/Linkpearl → Linette, with seven markers/states and six exact gathering interactions | Exact Nenekko/pursuer/node actors, escort path/stops/transforms, mining callback/state mutation, private handoffs, Linkpearl owner, failure/retry/cleanup, post-1.20 EXP, Master of Rock grant, and atomic reward remain unresolved |
| Tan200 — The Silent Partners | Hereward → Lalatta → repair Damaged Wailer Armor → make/equip Wood Wailer's Jacket → stable inspection → Quarrymill delivery → Hereward, with eleven markers and states `0/5/10/15/17/18/20` | Lalatta/Gylbart/stable actor variants, replacement recipe binding, work-slot/synthesis mutations, route-gear ownership, equipment check, inventory cleanup, after-warp lifetime, and atomic reward remain unresolved |
| Tan300 — Designer Imposters | Hereward/Lalatta → Leather Chocobo Saddle to Owl's Nest → cinematic one-bandit ambush → exact Toad Leather/Brass Ingot bag synthesis → Vielle Parley `1101`/hostage rescue → Hereward | Ser Yuhelmeric/hostage actors, saddle and bag transactions, synthesis mutation, Parley result, private after-warp owner, cleanup, and atomic reward remain unresolved; the bandit is not a player kill target |
| Tan306 — Head of the Class | Hereward/students → Lifemend Stump theft → novice Parley `5401` → one of eight exact five-item synthesis assignments → damaged-to-vintage boot repair → Lalatta Echo → Hereward | Novice/student actors, selector/work-slot mutation, all synthesis/inventory transactions, Parley result, Echo/private-area owner, after-warp cleanup, and atomic reward remain unresolved |
| Wdk200 — The Mouths of Babes | A'naidjaa/younglings → Vibrant Arrows to Wybir → find Blooming/Supple/Sturdy Branches → ask-`85` branch selection → one of four bow outcomes → A'naidjaa | Wybir/youngling/Marcelloix placement, search interactions, branch-to-output selector mapping, repair/result transaction, item cleanup, after-warp ownership, and atomic reward remain unresolved |
| Wdk300 — Hide and Seek Shenanigans | A'naidjaa → recover Nicoliaux/Ryd/Elyn and the other children through hide substates and Parleys → Colorful Building Blocks/Nogeloix → Sable Salve/Marcelloix → A'naidjaa | Child actors, fourth `S000`–`S003` Parley/title mapping, title/result flags, package/salve transactions, private cure-scene owner, cleanup, and atomic reward remain unresolved |
| Wdk306 — Spanning the Spectrum | Marcelloix → Large Leaf/Fairweather Fetish preparation → Nonolato → Wybir scouting where the player supplies arrows and Wybir shoots the beasts → A'naidjaa/Mirror children → artwork to Marcelloix | Marcelloix/Wybir placement, enemy roster/count/profiles, arrow recipe/delivery, allied-shooter and failure callbacks, route transforms/private ownership, child-interaction flags, cleanup, and reward variant remain unresolved; archived type is non-combat with no player kill target |
| Wvr200 — Hoodwinked | Deaustie → Chuchumu/Golden Bazaar → return for the ripped heirloom → synthesize one Red Riding Hood from four exact inputs → Chuchumu/Ouvielle → Deaustie, with four markers and states `0/5/6/8/10` | Golden Bazaar trigger actors, exact Chuchumu/Ouvielle variants, synthesis-result callback, quest-item grant/consume/cleanup, private after-warp transitions, Linkpearl grant, post-1.20 EXP amount, and atomic reward remain unresolved |
| Wvr300 — Dance the Night Away | Deaustie/Chuchumu → Soileine → Theldry → Parley separately with Cicely, Nesta, Keelty, and Miounne → Midnight Slippers → Chuchumu → Deaustie, with ten markers and states `0/5/10/15/19/20` | Exact Chuchumu variant, private-area entry/return, title-to-opponent negotiation bindings, Parley launch/result/per-opponent flags, slipper grant/consume, and transactional reward remain unresolved |
| Wvr306 — A Fruitful Murder | Deaustie/Chuchumu → Copperbell → remove silk one strand at a time while synthesizing ten Luxurious Gloves beside Chuchumu → deliver gloves → Gold Court Echo → Deaustie, with six markers and states `0/5/10/15/20/25/30` | Exact Chuchumu/private trigger actors, strand/synthesis counters and item transactions, non-combat SQB entry/success/retry/cleanup, late-scene state split, Echo owner, and atomic era-correct reward remain unresolved; spiders are narrative, not kill targets |
| Arc200 — Filling the Quiver | Nonolato → Keelty → Emerald Moss → Fallgourd Lake → Yarzon Invaders → Nonolato, with four exact markers and `arc20010/20/30/40` | `2205503`–`2205505` are candidates rather than a proven spawn set; exact copies/waves/profiles/cap, trigger transform, after-warp owner, and failure/retry/cleanup are missing |
| Arc300 — The Foreboding Forest | Eight exact markers, seven named cutscenes, two unbound talk events, a `51030` Echo gate, and Arc200 prerequisite | Marker display IDs do not establish actor classes; encounter roster/allies/counts/profiles/cap, offer/final owners, objective mechanics, and reward package remain unresolved |
| Arc306 — There Can Be Only One | Nonolato → Archer informants → Keelty/Sorrel Haven → escape Yarzons without killing them → return and defeat only Siward → Keelty confession → Nonolato, with six markers and two directors | Informant suffix ownership, marker `11016206`, exact Yarzon/Siward/Keelty battle classes, profiles/skills/counts/waves/cap, escape endpoint/failure, dual-director handoffs, and transactional rewards remain unresolved |
| Thm200 — The Big Payback | Yayake → I'loofii → one death-marked billygoat `2202303` → Twisted Aldgoat Horn `11000015` → I'loofii | Boss profile/level/skills, herd/add roster, waves, party cap, entry/proof-item owner, failure lifecycle, prerequisite conflict, and legacy-mark era policy remain unresolved |
| Thm300 — Revelry in Rivalry | Yayake → rival → Baderon → eight Lemmings while protecting one smith → Bodenolf/Yayake/rival/Yayake, with nine exact markers and smith states `12/13` | Rival, smith, trigger, and Lemming actor classes; roster split/waves/profiles/cap; `processEvent030` branch; content lifecycle; and post-1.20 rewards remain unresolved |
| Thm306 — Law and the Order | Yayake → Ossuary investigation/I'loofii → coach accident/rival → Echo → one overweening thaumaturge → I'loofii aftermath/final report, with markers `11024201/02/03/05` | Exact route-vs-battle actor binding, profile/level/skills, adds/allies/waves/cap, surrender/HP-threshold success, launch/aftermath ownership, failure/retry/cleanup, prerequisite SQL, and atomic reward ownership remain unresolved |
| War0j5 — Proof is in the Pudding | One Audhumbla, actor `2100804`, in the cave southeast of Camp Iron Lake; eight-person recommendation | Audhumbla has no exact mob profile or spawn owner; Great Buffalo `2100801/3045` is a separate NM and cannot be substituted |
| War0j6 — How to Quit You | One frenzied Curious Gorge `2289037/3012/list 15` plus quest-specific Cliffdiver `2201209` at the Silver Bazaar; eight players permitted/recommended | Cliffdiver profile/skills/copies/waves, Broken Mountain-to-Gorge transition, private entry/after-warp owner, and empty director lifecycle are unresolved |
| Blm0j1 — Hearing Voices | Guano Gnat `2200610/3050/list 94`, Brundleflight `23064`, Western Thanalan marker, four-person recommendation | “Several” does not prove a copy count, and the empty director does not assign the `blm0j110`/`blm0j120` scene and sequence transitions |
| Pld0j6 — Keeping the Oath | Manipulated Eye `2201706/3069/list 2` and Manipulated Ogre `2202503/3070/list 34`; eight-person recommendation | Enemy copies/waves, allied Jenlyns/Solkzagyl behavior, and the after-warp duty owner are not recovered |
| Mnk0j3 — The Pursuit of Power | One Prince of Pestilence `2100610/3081/list 6026`, four-person recommendation, then Outdated Aetheriometer `11000553` | Measurement marker `11221203` is ambiguous display `4000257` with no actor/full transform; the existing item command is location-blind and cannot safely own this second objective |
| Brd0j1 — A Song of Bards and Bowmen | Four Qiqirn Shirrer `2206306`, four-person recommendation, exact Georjeaux/Jehantel/Pukno route | Qiqirn Shirrer has no mob profile/skills, Jehantel and Pukno are not publicly spawned, and the client director is empty |
| Brd0j4 — Doing It the Bard Way | Escort Jehantel north of Hyrstmill, then repel Ixali Scout `2206412` and Scout Wolf `2201428`; eight players permitted/recommended | Both profiles/skill lists, target multiplicities/waves, private entry and after-warp owner, automatic aftermath transition, and reward variant are unresolved; the client director is empty |
| Fsh200 — To Fight a Fishback | N'nmulika `1000153` -> Maisie `1000173` -> catch/deliver five Pixie Remora `11000127`; exact NPC transforms, five fishing markers, scenes, and rewards are recovered | No active fishing data produces Pixie Remora at those waters; the class runtime has no catch counter, delivery/consumption gate, dynamic journal state, linkpearl grant, or verified prerequisite |
| War0j3 — Curious Gorge Goes to the Bazaar | Curious Gorge → Canyon Condor `2201208` flock at marker `11220201` → east-gate `processEvent005/war0j310` at `11220202` → return/reward at `11220203`; four-person cap | No exact bird profile, skill list, copy count, wave layout, battlefield owner, or automatic east-gate transition exists; a generic Bird fallback would invent the contract |
| Mnk0j1 — Brother from Another Mother | Gagaruna → Erik → exactly three level-35 Runagate Imps `2202611` at Mythril Pit T-8 → automatic `mnk0j110` and rewards; four-person cap | Runagate Imp has no exact profile/skills; marker `11221002` lacks an entry actor/full transform; the generic runtime launches at Erik and expects a later reward-NPC click instead of automatic completion |
| Mnk0j4 — Good Vibrations | Erik grants Experimental Aetheriometer `11000555`; defeat one level-53 Apep `2100723` at marker `11221301`; eight-person cap; instrument shatters and Dragon Kick follows | Exact mob type, stats, skills, loot/profile, Y/rotation, and spawn owner remain absent; generic basilisk `2100709/list 5006` is not an exact substitute |
| Whm0j1 — Seeds of Initiative | Soileine → Raya-O-Senna → one Diremite Straggler `2201115` plus three Miteling Stragglers `2201114` in Mun-Tuy → Raya/moogle `whm0j110` reward; four-person cap | Both mob profiles, formation/waves, destination entry actor/full transform, Nirvana transition, and public Raya/moogle spawns are missing; the current route would launch the fight at Raya |
| Whm0j4 — The Wheel of Disaster | Raya → eight-person bandit/minions boundary south of Bearded Rock → Oha-Sok/`whm0j410` aftermath → Raya/Holy return | No actor is explicitly joined to the quest; nearby bandit actors `2289031`–`2289034` have no profiles/counts/waves and remain unbound candidates; entry and linkpearl sequence ownership are missing |
| Blm0j6 — Always Bet on Black | Da Za → Dozol → Kazagg → Lalai → one Barbatos `2203503/3002/list 10` plus several Void Lanterns; kill Barbatos to win, with special lantern respawns; eight-person cap | Lantern count/actor mapping/profiles, boss level/spells, marker full transform, 45-second respawn owner, scene branch ordering, and automatic reward/cleanup remain unresolved |
| Brd0j6 — Requiem for the Fallen | Jehantel → Yotoli `2206413/3117/list 14` plus sabreur/strongbeak/bravewing/fogcaller `2206414`–`2206417`; eight-person cap | Enemy multiplicities/waves/kill rule, four profiles, Yotoli's spell list, entry transform, Jehantel classification, and automatic clear/cleanup are absent |
| Drg0j1 — Eye of the Dragon | Haurtefert → Alberic → three level-33 Crabfishers `2204511` plus one level-35 Ironshell `2207612` → `drg0j110` → Alberic; four-person cap | Both mob profiles/skills, wave partition, marker actor/full transform, and failure/retry/cleanup owner are missing; generic fish/crab profiles are not substituted |
| Whm0j6 — The Chorus of Cataclysm | Icebound Wrath `2204707/3055`, Earthbound Wrath `2204907/3020`, six named elemental families, eight-person recommendation, and pre/post scene hooks | Four family actor/profile bindings, every multiplicity/wave/kill rule, marker placement, Raya-O-Senna's spawn, and after-warp content ownership remain unresolved |

This table is deliberately conservative: an exact name or model is not enough
to enable a fight. The adapter needs the actor class, combat profile, count,
owner sequence, and return/reward boundary together.

### AF coffer interaction engine and held evidence

The job template now has the reusable server half of the four-coffer protocol:
four independent quest-data bits, duplicate-push rejection, inventory-visible
item grants before a bit is saved, per-objective marker filtering, and a
fourth-item transition. War/Pld/Brd can complete at the fourth coffer; Whm0j5
can instead move to sequence `10`, expose Raya-O-Senna, run
`processEvent_RAYA_O_clear`, and then complete. This code is deliberately
dormant: an `interactions.objectives` table needs four exact
`{actor, marker, item}` rows before `onPush` exposes anything.

Seven audited coffer rows now preserve their exact item sets without treating
unproven ordinal list alignment as gameplay data. Dragoon is the one exception
where an independent walkthrough corroborates each item/location pair; those
bindings are documentation only because the coffer actors are still absent:

| Quest | Recovered four-piece set | Completion shape |
| --- | --- | --- |
| War0j4 | Fighter's Breeches `8051403`; Gauntlets `8071403`; Jackboots `8081803`; Burgeonet `8013503` | Four unordered coffers; no separate return state recovered |
| Mnk0j5 | Temple Gloves `8071402`; Gaskins `8051402`; Circlet `8013502`; Boots `8081802` | Four apparently unordered coffers; fourth acquisition completes at the coffer and exposes the next Erik quest |
| Whm0j5 | Healer's Culottes `8051406`; Gloves `8071406`; Boots `8081806`; Circlet `8013506` | Four unordered coffers, then return marker `11222405` and `processEvent_RAYA_O_clear` |
| Blm0j5 | Wizard's Tonban `8051407`; Gloves `8071407`; Crakows `8081807`; Petasos `8013507` | Four unordered coffers; no separate return state or completion scene recovered |
| Pld0j4 | Gallant Cuisses `8051401`; Gauntlets `8071401`; Sollerets `8081801`; Coronet `8013501` | Four unordered coffers; no separate return state recovered |
| Brd0j5 | Choral Tights `8051405`; Ringbands `8071405`; Sandals `8081805`; Chapeau `8013505` | Four unordered coffers; no separate return state recovered |
| Drg0j4 | Drachen Breeches `8051404`; Gauntlets `8071404`; Greaves `8081804`; Armet `8013504` | Destination scene first, then four independent coffers; fourth acquisition completes immediately |

The exact client X/Z evidence is:

| Quest | Marker destinations (`marker: X, Z`) |
| --- | --- |
| War0j4 | Cutter's Cry `11220301: 28.74, -1674.01`; Natalan `11220302: 546.49, -154.67`; Turning Leaf `11220303: -1596.22, 162.98`; Craneperch Tower `11220304: 681.90, 553.73` |
| Mnk0j5 | Dzemael Darkhold `11221401: -74.51, 392.07`; U'Ghamaro Mines `11221402: 96.96, -2692.71`; Turning Leaf `11221403: -1528.00, 280.01`; Cape Deadwind `11221404: 118.06, 542.62` |
| Whm0j5 | Dzemael Darkhold `11222401: -74.51, 392.07`; Zahar'ak `11222402: 2179.07, 1022.85`; Turning Leaf `11222403: -1264.55, 201.69`; Tiger Helm Island `11222404: 1613.23, -142.48` |
| Blm0j5 | Aurum Vale `11223401: -368.99, 1397.95`; Dusk Vigil `11223402: -1838.30, -703.93`; west of Camp Brittlebark `11223403: 191.11, 608.84`; south of Camp Broken Water `11223404: 1761.81, 1428.56` |
| Pld0j4 | Aurum Vale `11224301: -368.99, 1397.95`; Natalan `11224302: 546.49, -154.67`; north of Camp Brittlebark `11224303: 344.34, 435.61`; northeast of Camp Crimson Bark `11224304: -1276.97, -841.74` |
| Brd0j5 | Cutter's Cry `11225401: 28.74, -1674.01`; Zahar'ak `11225402: 2179.07, 1022.85`; Turning Leaf `11225403: -1432.88, 127.03`; south of Camp Iron Lake `11225404: -477.06, -1557.28` |
| Drg0j4 | Aurum Vale/Breeches `11226302: -368.99, 1397.95`; U'Ghamaro/Gauntlets `11226303: 96.96, -2692.71`; north of Brittlebark/Greaves `11226304: 680.70, 460.93`; north of Bluefog/Armet `11226305: -228.54, -2380.83` |

All 28 coffer markers use display ID `4000257` (“???”). That display maps to
many unrelated actor classes and is not a legal `npc:GetActorClassId()` key.
The archive provides no Y coordinate or rotation for these coffers, and it
usually does not independently prove marker-to-item ordinal alignment.
Consequently all seven quests remain hidden at sequence `6`; enabling them now
would either strand the player or require fabricated actors. Raya-O-Senna and Jehantel also
lack ordinary public server spawn rows, adding a return/giver reachability
blocker for Whm0j5 and Brd0j5.

Blm0j4 is the eighth non-combat job boundary. Dozol Meloc's offer leads to
marker `11223301` in West Shroud at `(-1691.359985, 124.540001)`. The object
reminder `processEvent000_SEKIHI` describes a moss-covered stone stela;
`processEvent005` is the actual Gem of Shatotto activation/inscription, after
which `onJobQuestCompleteFirst` and `Second` present the reward and ability
`27317`. The marker again uses ambiguous display `4000257`; no stela actor
class, Y/rotation, unique spawn, or push owner is recovered, so the row remains
hidden with no `objectives` table.

Drg0j4 also has a distinct pre-coffer destination marker `11226301` southwest
of Skyfire Locks at `(159.229996, 477.869995)`. Its event owns the default-fade
`Drg0j410` scene, followed by `processEvent_ALBERIC_Guidance`. The scene owner
and transition are not recovered, so this lead-in is stored as
`documentedLeadIn`, not as a runnable route step. Each later coffer would call
`processEvent_getAF_info(itemId)` and the fourth distinct item completes at the
coffer without returning to Alberic.

### Fsh200 held contract — To Fight a Fishback

The old scaffold used display ID `1100206` as the quest actor and mislabeled
the 20,000-gil reward as EXP. The corrected dormant contract separates the two
real NPC actor classes and their public transforms:

- N'nmulika `1000153`, zone `230`, `(-612.9, 4.55, 341.42, 0.69)`, owns
  `processEventNnmulikaStart`.
- Maisie `1000173`, zone `230`, `(-603.64, 6.25, 355.46, -0.75)`, owns
  marker `11050001` and `processEvent010`/`fsh20010`, then return marker
  `11050003` and `processEvent020`/`fsh20020`.

The objective is exactly five Pixie Remora (`11000127`). The five DAT fishing
destinations are `11050004 (-227.94, -12.06, 101/101)`, `11050005 (-41.39,
225.90, 101/101)`, `11050006 (-1134.19, -694.57, 101/102)`, `11050007
(-1043.70, -554.61, 101/102)`, and `11050008 (1298.90, -886.29, 101/103)`.
Rewards are Yew Fishing Rod `7030011`, 1,760 Fisher EXP, 20,000 gil, and 2,000
Fishermen's Guild Marks (`1000123`).

This route is still not offerable. Pixie Remora has no active fishing-table
binding, and `class_quest_template.lua` cannot observe catches, persist the
0..5 count, gate/consume five items atomically, or emit the three dynamic
journal states. The archived guild-linkpearl grant and main-quest prerequisite
also remain unresolved. Exposing the exact NPC route without those pieces
would let an empty-handed player complete at Maisie, so the validator requires
the availability row and `offer=true` to remain disabled.

### Fsh300 held contract — The Beast of the Barrel

This level-30 quest is non-combat. The old row confused Sisipu's display ID
`1500024` with an actor class and confused 30,000 gil with EXP. The exact offer
and reward owner is N'nmulika `1000153` (display `1900011`). Installed cutscene
actor tables independently confirm Sisipu `1000155`, guild Wawalago `1000154`,
Barrel Wawalago `1000174`, Rerenasu `1000201`, and Rorojaru `1000374`.

```text
N'nmulika 1000153 / processEventNnmulikaStart / prerequisite Fsh200 110500
  -> Sisipu 1000155 / 11050101 / processEvent010 / fsh30010
       receive Barrel Feed 11000025
  -> Rerenasu 1000201 / 11050102
       processEvent010_1001: travel to the Barrel (ask 106, choices 107/108)
       processEvent020 / fsh30020 / AfterWarp
  -> Barrel Wawalago 1000174 / 11050103-04
       feed the fish; processEvent025/fsh30025 and 030/fsh30030
       perform the initial dance; receive Wawalago Message 11000133
  -> Rorojaru 1000374 / 11050105 / processEvent040 / fsh30040 / AfterWarp
       obtain Star-Spangled Subligar 8050521 and equip it
  -> Barrel / state 22 / 11050103-04 and 11050112-13
       complete four location/emote interactions
  -> Barrel / state 25
       catch exactly one new fish; no fixed species is required
  -> Sisipu / 11050109 / processEvent050 / fsh30050 / AfterWarp
  -> Sisipu / 11050110 / processEvent060 / fsh30060
  -> guild Wawalago/Sisipu / 11050108
       processEvent070 / Echo ask 51030 mode 2 / fsh30070
  -> N'nmulika / 11050111 / processEvent075 / final reward
```

The eleven journal states are `0, 5, 10, 15, 20, 22, 25, 30, 35, 40, 45`.
Markers `11050101`–`11050113` are meaningful, although `06/07` are replay-only
placeholder transforms. Marker rows `11050114`–`11050120` are unrelated filler.
The second Rerenasu ask, `processEvent010_1002` (text `116`, choices `117/118`),
returns the player to Fisherman's Bottom. Both recovered boat methods call
`ask()` twice due decompilation; an implementation must cache one result.

The DAT preserves four accepted emote groups:

1. bow / welcome / salute / kneel
2. beckon / wave / clap / confused
3. upset / cry / angry / furious
4. chuckle / laugh / joy / congratulate

It does not recover the exact marker-to-round mapping, accepted choice within
each group, wrong-answer behavior, or persistent counters. The item lifecycle
is similarly transactional: Barrel Feed is visible only in states `5..9`,
Wawalago Message in `15..19`, and the normal equipment item Star-Spangled
Subligar must be granted, retained, and actually equipped. The empty
`QuestDirectorFsh30001` owns none of those callbacks, and the generic class
runtime has no emote or fishing-catch listener.

The historical package is 30,000 gil, maximum 3,420 post-1.20 EXP, retained
Star-Spangled Subligar, and legacy Fisher marks item `1000123` ×3,000. Fixed
`exp = 3420` would still invent the old maximum-scaling policy. Most
importantly, `processEvent070` is the Echo, not completion. The corrected final
hook is N'nmulika's `processEvent075`; the route remains metadata-only until
all item/equipment/emote/catch/boat and reward transactions are atomic.

### Fsh306 held contract — Polishing the Mast

The level-36 finale is a timed sale challenge followed by three Echoes, not a
fight. The old row used N'nmulika's display ID `1900011` as an actor class,
treated 36,000 gil as EXP, and completed on the third Echo. N'nmulika
`1000153` owns offer, timed assignment, and final reward.

At state `5`, the game selects exactly one fish and requires one copy:

| Selector | Item | Fish |
| ---: | ---: | --- |
| 0 | `3011213` | Rothlyt Oyster |
| 1 | `3011203` | Nautilus |
| 2 | `3011209` | Bianaq Bream |
| 3 | `3011217` | Ash Tuna |
| 4 | `3011225` | Hammerhead Shark |

```text
N'nmulika 1000153 / prerequisite Fsh300 110501
  -> initial guild/private push / 11050201
       processEvent010 / fsh30610 / AfterWarp
  -> N'nmulika / state 5 / 11050202
       processEvent015: assign selected fish and deadline
  -> timed states 10..19 / N'nmulika
       processEvent015_3: selected fish + remaining bells
       processEvent015_2: timeout
       processEvent016: successful sale
       processEvent020 / fsh30620 / AfterWarp
  -> state 20 / replay marker 11050203
       processEvent030 / fsh30630
  -> state 25, substep 1 / Sisipu 1000155 / 11050204
       processEvent040 / Echo ask 51030 / fsh30640
  -> state 25, substep 2 / Sisipu 1000155 / 11050205
       processEvent050 / Echo ask 51030 / fsh30650
  -> state 25, substep 3 / Maisie 1000173 / 11050206
       processEvent060 / Echo ask 51030 / fsh30660
  -> state 28 / N'nmulika / 11050207
       processEvent070 / final reward
```

The exact journal states are `0, 5, 20, 25, 28`, with active timer states
`10..19`. Marker `11050208` is a Rerenasu marker with no journal or replay role
and is retained only as unresolved evidence; `11050209`–`11050220` are filler.
Each Echo requires result `1`, and each recovered method calls `ask()` twice;
the three state-25 substeps therefore need separate persistent flags.

The native director does not reveal who chooses the selector, the initial
deadline, whether a “bell” is Eorzean or real time, logout/restart behavior,
whether a preowned fish qualifies, the sale payout, or the exact timeout,
extension, retry, item-removal, and success transitions. Those choices cannot
be guessed without changing the quest. `QuestDirectorFsh30601` is empty.

Rewards are 36,000 gil, maximum 4,720 post-1.20 EXP, and legacy Fisher marks
item `1000123` ×3,600. `processEvent060` is only the third Echo; true completion
is N'nmulika's `processEvent070`. The row remains hidden with `exp = 0` until
random selection, timer persistence, fish sale/removal, three Echo substates,
and the final reward are implemented transactionally.

### Hrv200 held contract — Gridanian Roots

All three Botanist rows previously confused marker display IDs with actor
classes and gil with EXP. The shared guild owner is Opyltyl `1000236`
(display `1600132`), not Cicely display `1100263` or Rychyld display
`1100416`. Gridanian Roots is explicitly non-combat:

```text
Opyltyl 1000236 / processEventOpyltylStart
  ask 35 mode 2; result 1 accepts
  -> Cicely 1000326 / 11048001
       processEvent010 / hrv20010
  -> Quarrymill gathering destination / 11048002
       clear every troublesome weed
       gather Spiny Turnip Leaves 11000018 / dynamic count
       processEvent020 / hrv20020 / AfterWarp
       processEvent020_1 is the default-fade alternate
  -> guild cut-replay push / 11048003
       actor candidate 1090046 is already a main-scenario BTN trigger
  -> Opyltyl / 11048004
       processEvent030 / hrv20030 / AfterWarp / completion
```

Journal states are exactly `0, 5, 10`. The leaves are visible during state `5`
and disappear when state `10` begins; they are a gathering-state artifact, not
a combat drop. Neither the journal nor empty `QuestDirectorHrv20001` gives the
required count, exact nodes, or transforms. Marker `11048002` is display
`4000257`, not an actor; marker `11048003` overlaps existing trigger `1090046`
but cannot be claimed without event multiplexing. `11048005`–`11048020` are
unrelated filler.

There is also a prerequisite conflict: local SQL says zero, while the archive
places it after `Fade to White` (`110013`). Reward evidence separates a
20,000-gil package, Brass Hatchet `7020011`, maximum 1,760 post-1.20 EXP,
legacy Botanist marks item `1000122` ×2,000, and the Greatloam Growery
Linkpearl. The row remains hidden with `exp = 0` until count/node callbacks,
idempotent item cleanup, prerequisite/linkpearl policy, after-warp lifetime,
EXP scaling, and rewards are transactional.

### Hrv300 held contract — The Grass is Always Greener

This quest combines gathering, a real Parley, and a long item exchange chain.
The exact route is:

```text
Opyltyl 1000236 / prerequisite Hrv200 110480
  -> Cicely 1000326 / 11048101
  -> Penelope 1700001 / 11048102
  -> Cicely / 11048104
  -> gather exactly one of each at 11048109/11048110
       Bowing Pine Branch 11000086 x1
       Foul-smelling Nut 11000087 x1
       exact area-to-item assignment unresolved
  -> Cicely consumes both and grants Nostalgic Ink 11000085
  -> Penelope Parley / negotiation title 1301
       persist result; grant Pirate Ship Tale 11000042
  -> Cicely consumes ink + tale
       grant Meracydian Olives 11000135
       grant Letter to Nenekko 11000136
  -> Nogeloix 1000597 / 11048105 consumes olives
  -> Linette 1000861 + Nenekko / 11048106 consumes letter
       grant Amajina Ceruleum 11000137
  -> Opyltyl / 11048108 consumes ceruleum
       processEvent040 / hrv30040 / AfterWarp / completion
```

Journal progression is `0, 5, 10, 11, 12..17, 18, 20, 25, 30`.
`processEvent010/020/030/040` own scenes `hrv30010/20/30/40`; the offer's
duplicated `showQuestInfomation()` call is a decompilation shape and must be
cached once. Marker `11048103` is a replay-only contaminated transform, not
the filler boundary; `11048111`–`11048120` are filler. Marker `11048107`
again overlaps main-scenario trigger candidate `1090046` and is not safe to
bind directly.

Every exchange must be atomic: two gathered items to ink; successful Parley
to tale; ink+tale to olives+letter; separate Ul'dah consumes; letter to
ceruleum; and ceruleum to completion. The shared Parley system exists, but no
quest callback configures title `1301`, target, difficulty/turn contract, or
result persistence. `QuestDirectorHrv30001` is empty, and the exact Nenekko
variant remains one of `1000604`, `1000888`, or `2290035`.

The reward package is 30,000 gil, maximum 3,420 post-1.20 EXP, and legacy
Botanist marks `1000122` ×3,000. The row keeps `exp = 0`, no offer, and final
hook `processEvent040` until node callbacks, Parley, seven item transactions,
journal flags, final trigger, and reward scaling are fully owned.

### Hrv306 held contract — A Moogle Bouquet

A Moogle Bouquet is non-combat despite the Yarzon presence. In the archived
walkthrough the creatures alternate between sleep and wake while the player
harvests sparkle points and avoids aggro. They are hazards, not kill targets.
The two gathering counts are intentionally not guessed:

- Pearl Clover Seeds `11000128` are dynamic in states `10..19`; the English
  objective says neither too many nor too few, German suggests two, and an
  explicit over-harvest complaint proves continued collection is possible.
- Yarzon Faeces `11000043` are dynamic in states `25..29` and appear correlated
  with the seed count, but no exact formula survives.
- Pearl Clover Seedling `11000138` is one tracked item in states `43..44`.
- Pearl Clover Blossom `11000123` is story text, not a tracked objective item.

```text
Opyltyl 1000236 / prerequisite Hrv300 110481
  -> Rychyld 1000508 / 11048201 / state 0
  -> flower-field instance / 11048202 / states 5-10
       harvest dynamic Pearl Clover Seeds; preserve over-harvest branch
  -> Rychyld / 11048204 / state 15
  -> Cicely / 11048205 / state 20
  -> Greatloam/Opyltyl / 11048206
  -> Humblehearth instance / 11048207 / state 25
       harvest correlated Yarzon Faeces while avoiding sleep/wake Yarzons
  -> Opyltyl / 11048208 / state 30
  -> Cicely / state 35
  -> Cicely Echo / state 40 / processEvent040
       ask 51030 mode 2; result 1 runs scheduler and hrv30640
  -> Opyltyl / 11048210 / state 43 / receive one seedling
  -> forest/moogle destination / 11048211 / state 45
  -> Cicely / 11048212 / state 55
       processEvent070 / hrv30670 / completion
```

All twelve journal states are `0, 5, 10, 15, 20, 25, 30, 35, 40, 43, 45,
55`. `processEvent010` uses scene argument `2` and a recovered result to choose
default versus after-warp fade; that result must be cached. `processEvent020`
and `030` are after-warp, and `030` carries a dynamic payload whose replay rows
preserve variants `1` and `0`. `processEvent050/060` precede the final
`processEvent070`. Marker `11048203` is replay-only; markers
`11048213`–`11048220` are filler.

Both `QuestDirectorHrv30601` and `QuestDirectorHrv30602` are empty, leaving
node and hazard actors, aggro/sleep scheduling, count correlation,
over-harvest state, instance handoffs, dynamic scene payload, Greatloam actors,
forest delivery, retry/cleanup, and technical completion owner unresolved.
The narrative final actor is Cicely `1000326`, but that does not prove which
push owns the reward event, so the metadata row deliberately keeps primary
`actor = 0`.

Rewards are 36,000 gil, maximum 4,720 post-1.20 EXP, and legacy Botanist marks
`1000122` ×3,600. The corrected dormant row explicitly forbids Yarzon kills and
retains final hook `processEvent070`; it cannot be exposed until both gathering
instances, Echo, seedling delivery, reward event, EXP scaling, and cleanup are
transactional.

### Cnj200 held contract — Dendrological Duties

The hidden scaffold now records the recovered route without pretending the
fight itself is runnable:

```text
Soileine 1000234 / processEventSoileineStart
  -> Telent 1000504 / marker 11026001 / processEvent015
  -> dead-tree clearing / marker 11026002 / held fight boundary
       rabid coywolf actor 2201408
       alpha coywolf actor 2201409 (associated, not proven as a target)
  -> Telent / marker 11026003 / processEvent030
  -> Soileine / marker 11026004 / processEvent040 / reward
```

This corrects two display-ID mistakes in the old scaffold: `1000415` identifies
Telent for display purposes but is not his actor class, and `1300064` is
Soileine's display ID rather than her server interaction identity. The journal
proves a pack east of Blue Badger Gate and the `0 → 5 → 10 → 15` narrative
states, but it says only “a number” of rabid coywolves. Actor `2201408` has no
exact `server_battlenpc_mob_types` row; alpha actor `2201409` is present in the
local quest/location evidence but not proven by a director. Wolf-family skill
list `69` (Midnight Howl, Threatening Growl, Foul Bite, Sanguine Bite, and
Mandible Bite) is therefore documented only as a family lead, not assigned.
The empty recovered director supplies no count, wave, party cap, or Morys actor
variant, and `processEvent020` requires an after-warp scene lifetime. Cnj200
remains unavailable until those pieces form an exact content contract.

### Cnj300 held contract — Good Knight, Sweet Dreams

The one-line row had two severe identity/reward errors: `1300064` is
Soileine's display ID, not her actor class `1000234`, and 30,000 is gil rather
than EXP. The recovered state machine is substantially richer:

```text
Soileine 1000234 / processEventSoileineStart
  -> Lifemend Stump / state 0 / 11026101 / processEvent010 / cnj30010
       Morys candidates 1000505, 1000506, 2290033
  -> Soileine linkpearl / state 5 / processEvent010_2
  -> Amberscale Rock / state 10 / 11026102 / processEvent015_1
       plural enraged elementals
       identify each nature/aspect and use appropriate magic
  -> state 15, journal data 0 / processEvent020 / cnj30020 / AfterWarp
       fallen knight survives the immediate aftermath
  -> state 15, journal data nonzero / Soileine / 11026103 / cnj30030
  -> Owl's Nest / state 20 / 11026104 / Yuhelmeric candidate 1000370
       processEvent040 / cnj30040 / AfterWarp
  -> rescued knight 1000573 / state 25 / 11026105
       processEvent050 / ask 51030 result 1 / cnj30050
  -> forest-border Morys / state 30 / 11026106 / processEvent060 / cnj30060
  -> Soileine / state 35 / 11026107 / processEvent070 / cnj30070 / reward
```

The state-15 journal-data branch is essential: a generic battle clear cannot
jump directly to state 20. It must first show the fallen-knight aftermath, then
expose the Soileine return. `processEvent050` also contains two recovered Echo
asks and advances only on returned result `1`. Markers `11026108`–`11026120`
are unrelated Sthalmann filler.

No source identifies the elemental families, exact count, waves, levels, mob
profiles, skills, or how correct/incorrect aspect magic changes damage,
resistance, healing, or enmity. Morys leaves the task to the player and the
fallen knight is incapacitated; neither is a proven combat ally. Generic
`220460x/220480x/220490x` families and Cnj306 fire elemental `2205201` are
explicitly rejected substitutions. The empty director also supplies no
success callback, party-credit, failure, retry, or cleanup contract.

Post-1.20 evidence supports 30,000 gil and a maximum of 3,420 Conjurer EXP;
3,000 Conjurer marks are legacy. The metadata keeps live EXP at zero because
the archive proves a level-30 maximum, not the exact scaling function, and the
central/script reward transaction is not atomic. This quest remains hidden
until a Cnj300-specific state driver and aspect-aware director exist.

### Cnj306 held contract — The Call of Nature

The old row was not merely incomplete: `1000141` is Ingram's display ID, not
the quest owner, and 36,000 is gil rather than EXP. Soileine actor `1000234`
owns both offer and reward; Ingram actor `1000372` and Morys variants
`1000505`/`1000506`/`2290033` own the middle route. The recovered spine is:

```text
Soileine 1000234 / processEventSoileineStart
  -> state 0 / Ingram 1000372 / 11026201
       processEvent010 / cnj30610 / Mysterious Leather Bag 11000101
  -> state 5 / Amberscale Rock / 11026202
       Morys / processEvent020 / cnj30620
       processEvent025 / ask 50 result 1: escort Morys to Ishgard?
  -> state 15 / Camp Emerald Moss / 11026203
       processEvent030 / cnj30630 / QuestDirectorCnj30601
  -> state 20 / 11026204
       processEvent040 / cnj30640 / AfterWarp / Morys vanishes
  -> state 25 / unconscious Morys / 11026205
       three elementals / processEvent045 / Echo ask 51030 result 1
       processEvent050 / cnj30650 / AfterWarp
  -> state 30 / cave edge / 11026206
       processEvent060 / cnj30660 / AfterWarp
       QuestDirectorCnj30602
       processEvent070 / cnj30670 / AfterWarp
  -> state 40 / Ingram / 11026207 / processEvent080 / cnj30680
       return Mysterious Leather Bag
  -> state 45 / Soileine / 11026208
       processEvent090 or processEvent095 / cnj30690 / reward
```

`processEvent025` repeats its `ask(50)` call and accepts only result `1`.
`processEvent045` does the same with Echo ask `51030`. `processEvent090` and
`processEvent095` both play `cnj30690`, but only `095` is the recovered
default-fade reward hook; `090` is the AfterWarp variant. Marker rows
`11026209`–`11026220` are Sthalmann filler even though replay slot
`11026209` names the ninth scene.

The two combat phases cannot be collapsed into a kill counter:

1. Escort Morys from Camp Emerald Moss. Yarzon Stalkers attack along the
   route, then a Furline Mosstrooper group spawns together at a clearing.
   Morys reaching zero HP or the player moving too far away fails the duty;
   success requires reaching the clearing and defeating the Mosstrooper group.
2. Inside the Echo, defend Morys/young Morys against exactly three Hungry
   Dreadwolves. An area spell can pull their attention off him, but that is a
   tactic rather than a separate objective.

`2205506` is the local Yarzon Stalker candidate. Furline Mosstrooper classes
`2280158`–`2280163` all share the name, but no source proves which copies the
director used. Hungry Dreadwolf `2201412` is the strongest quest-era candidate
and has guildleve-type lead `9201412`/Wolf skill list `69`; same-name actor
`2201423` prevents an exact binding, and a guildleve profile is not proof of
the class-quest profile. The journal's three elementals are consistent with
Conjurer-36 spirit-of-the-wood actor `2205201`, but that actor is not a proven
combat target. The exact Morys/child variants, all mob profiles and skills,
escort copies/path/endpoint, and private transforms remain unresolved.

Both recovered directors are empty. They provide no launch handoff, party
credit, after-warp lifetime, retry, or cleanup. The client metadata encodes no
special strength, party-size, defeat, or failure limit; that does not erase
the walkthrough's explicit escort failures. The item must be granted at state
5, remain journal-visible through state 45, and return to Ingram atomically.

Archived post-1.20 evidence supports 36,000 gil and at most 4,720 Conjurer
EXP; 3,600 Conjurer marks are legacy and encoded `-13/8` semantics remain
opaque. The exact route/count/failure facts were cross-checked against the
[archived walkthrough](https://web.archive.org/web/20130315205114/http://ffxiv.gamerescape.com/wiki/The_Call_of_Nature).
The quest stays hidden until a bespoke two-director escort/Echo state machine,
exact profiles, and transactional item/reward ownership exist.

### Exc200 held contract — Bloody Baptism

The Marauder 20 route is also substantially recovered and now uses actor-class
IDs instead of display IDs:

```text
Waekbyrt 1000003 / processEventWaekbyrtStart
  -> Nunuba 1000004 / marker 11010001 / processEvent015
  -> Swiftperch Tower / marker 11010002 / held duty boundary
       Tower Lemming actor 2204003
       Lord of Swiftperch actor 2204004
       journal objective: Lemming 8/8
  -> Astalicia return / marker 11010003
       processEvent030 -> processEvent040 -> processEvent050
       Iron Bill 4040405 / reward
```

The archive identifies plural level-15 Tower Lemmings and one level-20 Lord of
Swiftperch, but it does not prove that retail used exactly seven plus one, that
they spawned together, or when the Lord entered. Neither actor has an exact
server mob profile, skill list, stats, or action schedule, and the inherited
client director contains no composition/wave logic. The participant cap is
also absent. `processEvent020` ends through an after-warp fade, so the actual
duty owner must preserve that event lifetime rather than launching a generic
shell after the scene. Exc200 therefore remains hidden even though its giver,
briefing NPC, `8/8` total, actors, marker, scenes, and reward item are recorded.

### Exc300 — Two-man Crew (enabled)

This is an infiltration/item route despite the stale generic `xtx_quest`
“Lemming 8/8” metadata. The journal and item-state expressions instead prove,
and the bespoke `Data/scripts/quests/exc/exc300.lua` now implements:

```text
Waekbyrt 1000003 / processEventWaekbyrtStart / exc30010
  -> Rostnsthal actor 1001652 / marker 11010101
       processEvent020 / exc30020 / conditional AfterWarp
  -> Krakens' den / marker 11010102
       Mirage Token 11000032
       Deep-red Ruby 11000033
       Skull Island 11000034
       Aged Rum 11000035
       Far Eastern Sourleaf 11000036
       collection states 7, 8, 9, 10, 11
  -> guild-door waypoint 11010103 (pre-existing push_mrd trigger; not a gate)
  -> Rostnsthal / 11010104 / processEvent022
  -> Rorojaru 1000374 / 11010105 / processEvent025
       exchange loot for Pirate Ship Funds 11000131
  -> Waekbyrt / 11010106 / processEvent030 / exc30030 / reward
```

The recovered `QuestObjectExc300` class deliberately hides talkable map
markers, and scenario method `trialObject` has three dialogue variants (the
watchman's log, the bill of sale, and the tattered parchment). It does not
reveal the object actor classes, five transforms, or the per-spot variant
mapping, so the server reuses the generic invisible-object contract (actor
`1090199`) with `uniqueId`-keyed flags exactly like the Pgl200 coin
objective, and rotates the three `trialObject` variants across the five
spots as a documented scaffold. Rostnsthal is resolved to actor `1001652`
(the proven `rostnsthal` spawn identity; `1000005` shares the display model
but has no spawn row), placed at the DAT marker X/Z on the guild upstairs
landing. Marker `11010103` sits exactly on the pre-existing `push_mrd`
guild-door trigger (`1090026` at `-753.29, 368.39`), so it is a route
waypoint rather than a progress gate. The old row's `actor = 1600150` and
`exp = 30000` were both wrong: `1600150` is a display ID, and the archived
post-1.20 maximum is 3,420 Marauder EXP, granted explicitly by the script
because quest `110101` has no central Exp row. Best-supported gil is
24,000; 2,400 Marauder marks are pre-1.20 legacy data, with 30,000/3,000
and 21,000/2,100 alternate DAT tiers.

The stale `Instanced` fight-setting row for Two-man Crew was removed: the
decompiled scenario contains no battle or duty. The ambient dialogue
groups (`processEvent010_2..010_14`, `020_2..020_7`, `022_2..023_7`,
`025_2..025_9`) stay unbound because their owners are not recovered; the
`022_2`/`023_N` texts are den-pirate chatter during collection, not a
second Rostnsthal visit.

Server sequences mirror the retail journal ladder exactly, because the
client keys journal text off the sequence: `0` (row 35, find Rostnsthal)
→ `5` (row 36, steal the loot) → `7/8/9/10/11` (row 37, one state per
pickup) → `12` (row 37, report to Rostnsthal) → `15` (row 38, sell in
Ul'dah) → `16` (row 39, return to the Astalicia). State 11 is the
transient all-collected instant on the way to 12. Row 39 names
Rostnsthal as awaiting, but no post-sale Rostnsthal event exists in the
decomp, so the sale leads straight to Waekbyrt's `processEvent030`
reward scene (both NPCs are present below decks). The Pirate Ship Funds
are consumed in that final handoff so the quest item cannot linger.

### Exc306 held contract — Captain's Orders

The stale central `xtx_quest` Lemming text does not describe this quest. The
journal, eleven non-filler markers, Kraken Register state, and decompiled
scenario instead prove a two-encounter story:

```text
Waekbyrt 1000003 / processEventWaekbyrtStart
  -> captain's quarters / 11010201 / processEvent010 / exc30610 / AfterWarp
       first attack by the captain's grunts is intentionally unwinnable
  -> cargo hold / 11010202 / processEvent020 / exc30620 / AfterWarp
  -> Rostnsthal / 11010203 / processEvent030 / exc30630 / AfterWarp
       recover Kraken Register 11000132 from the barrel
  -> return warning / processEvent033 then processEvent035
  -> lounge confrontation / 11010206 / processEvent040 / exc30640 / AfterWarp
  -> deck oath and Register handoff / processEvent050 / exc30650
  -> captain's-quarters rematch / 11010207
       Moenskaet the Honorbound candidates 2289004 or 2289005
       right hand 2280219; left hand 2280220
  -> Rostnsthal report / 11010208 / processEvent060 / exc30660 / AfterWarp
  -> Echo gate / processEvent070 / exc30670 / ask 51030 result 1
  -> Waekbyrt / 11010209 / processEvent080 / reward
```

Marker `11010204` sits exactly on the pre-existing `push_mrd` guild-door
trigger (`1090026` at `-753.29, 368.39`), and markers `11010201`/`11010207`
sit exactly on the upstairs-door trigger
(`push_mrd_outside_upstairs_door`, `1090097` at `-779.199, 386.5`), so all
three are route waypoints rather than progress gates. Markers `11010210`
and `11010211` are within 0.3m of the downstairs door triggers
(`1090100`/`1090101`), a probable but inexact waypoint mapping, so their
exact roles stay unresolved; marker rows `11010212`–`11010220` are filler.
Rostnsthal is resolved to actor `1001652` (the proven `rostnsthal`
identity). Scene actors `1000489`, `1000885`, and `1000886` support the
captain/right/left presentation, but do not prove the server battle
composition. No candidate enemy has an exact server mob profile, and the
archive does not establish the boss variant, add multiplicities, levels,
skills, waves, party cap, or how the first forced loss transitions safely
into the later rematch.

The archived post-1.20 reward is 4,720 Marauder EXP and 36,000 gil. The 3,600
Marauder-mark form is legacy; 28,800/2,880 and 25,200/2,520 are alternate DAT
tiers. The corrected hook ends at `processEvent080`; `processEvent070` is only
the preceding Echo choice. Until the forced-loss state machine, Register
grant/consumption, rematch lifecycle, and cleanup/retry paths are exact, this
contract remains metadata-only.

### Arc200 held contract — Filling the Quiver

The former row confused Keelty's display ID `1100199` with an actor class and
treated battle aftermath as completion. The corrected source order is:

```text
Nonolato 1000463 / processEventNonolatoStart
  -> Keelty 1000587 / marker 11016001 / processEvent010 / arc20010
  -> Camp Emerald Moss / marker 11016002 / processEvent020 / arc20020
  -> Fallgourd Lake patrol / marker 11016003
       processEvent030 / arc20030 / nation argument / AfterWarp
  -> Yarzon Invader group
       one Ixal escapes and is not a target
       candidate actors 2205503, 2205504, 2205505
       archived world level 15
  -> processEvent040 / arc20040 / AfterWarp battle aftermath
  -> Nonolato / marker 11016004 / processEvent050 / reward
```

The four marker locations are Quiver's Hold `(261.38, -1264.70)`, Emerald Moss
`(-1067.16, -1764.70)`, Fallgourd Lake `(-1356.24, -2104.54)`, and Nonolato
`(232.88, -1268.94)`. Destination display `4000257` is not an interaction
actor. Marker rows `11016005`–`11016020` are repeated Limsa/Sthalmann filler
and are explicitly rejected.

The story proves a Yarzon group and the non-target Ixal escape, but the three
Longlegs actor records do not prove one copy each or even that all three were
used. None has an exact server mob profile. Existing Sand, Bog, and Cliff
Yarzon profiles belong to different actors and cannot supply retail stats or
skills. The DAT says no participant limit; the shared private launcher requires
a finite cap, so no value is invented. Exact trigger Y/rotation, spawn
composition, waves, timer, success callback, failure/retry, and cleanup remain
absent from the empty director. The dormant row retains Elm Velocity Bow
`4070011`, 20,000 EXP/gil-era evidence, and legacy 2,000 Archer marks as an
explicit policy conflict. It has no runnable route or battle table.

### Arc300 held contract — The Foreboding Forest

Arc300's client scenario is extensive, but its marker presentation IDs do not
establish a server owner chain. The metadata-only spine is:

```text
Nonolato-named offer method / processEventNonolatoStart
  -> 11016101 / processEvent010 / arc30010 / AfterWarp
  -> 11016102 / processEvent015 / arc30015 / AfterWarp
  -> 11016103 / processEvent020 / arc30020 / AfterWarp
  -> unbound talks processEvent025 and processEvent025_2
  -> 11016104 / processEvent027 / arc30025 / AfterWarp
  -> 11016105 / processEvent030 / arc30030 / AfterWarp
  -> 11016106 / processEvent040 / ask 51030 result 1
       arc30040 / AfterWarp
  -> 11016107 / processEvent050 / arc30050
  -> 11016108 / final reward marker; owner unresolved
```

The real marker range is `11016101`–`11016108`; `11016109`–`11016120` is
contaminated filler. Displays `1100199`, `4000257`, `1200019`, and `1400007`
are retained only as marker evidence. Although `1400007` maps to Nonolato's
known actor class elsewhere, the archive does not prove every route owner or
the final reward handshake. The exact fight actors, allies, count/waves,
profiles/skills, participant cap, content owner, and objective state machine
are wholly unresolved. Therefore `actor = 0`, `exp = 0`, and `noOffer = true`
remain mandatory. The row records Arc200 as the prerequisite and preserves the
conflicting 30,000 EXP, 30,000 central gil, 3,000 legacy marks, and encoded
`-13/11` reward candidates without granting any of them.

### Arc306 held contract — There Can Be Only One

The old actor `1100199` is Keelty's display identity. Nonolato actor
`1000463` owns offer and reward, Keelty's best public/cinematic actor is
`1000587`, Siward's cinematic actor is `1000588`, and M'koliwe's aftermath
actor is `1000594`. The journal states are exactly `0 → 5 → 7 → 10 → 15 →
20`:

```text
Nonolato 1000463 / processEventNonolatoStart
  -> question Archer Guild informants
  -> state 5 / Keelty near Sorrel Haven / 11016201
       processEvent010 / arc30610 / AfterWarp
       cutscene-internal choice: head back to Gridania?
  -> state 7 / QuestDirectorArc30601
       escape the Yarzons; killing them is not required
  -> return to Keelty / 11016202
       processEvent020 / arc30620 / AfterWarp
  -> state 10 / QuestDirectorArc30602
       Siward plus optional Yarzons
       defeat Siward only; Yarzons can even attack him
  -> state 15 / 11016203 / processEvent030 / arc30630 / AfterWarp
       leave Keelty with M'koliwe
  -> state 20 / Keelty 1000587 / 11016204
       processEvent040 / arc30640 / AfterWarp
  -> Nonolato 1000463 / 11016205
       processEvent050 / arc30650 / reward
```

Marker `11016206` is additional encounter geography near the first two route
markers, but its exact escape/director role is unresolved. Rows
`11016207`–`11016220` are unrelated filler. Archer candidates `1000625`,
`1000626`, `1000829`, `1000830`, `1000831`, and `1000832` may own the six
information talks, but no local binding maps each `processEvent005_*` suffix.
The choice text lives inside `arc30610`; it is not an Echo `51030` ask and does
not justify a server-side `requiredResult` gate.

The first director is a survival/escape objective. The second spawns Siward
and Yarzons outside immediate aggro range, but only Siward is mandatory. His
battle candidates are `2289016`, `2289017`, and `2289018`; all lack exact mob
profiles, levels, skills, and a proven variant. Keelty battle candidate
`2290032`, cinematic Yarzon proxy `1001266`, and the scene's dynamic party
slots do not prove an active ally or party cap. The precise Yarzon classes,
copies, behavior switch, escape endpoint/failure, waves, and all two-director
handoffs also remain absent from the empty directors.

Reward evidence conflicts: the archived route lists 36,000 gil and 3,600
Archer marks, the journal retains a stale 400-gil note, and patch 1.20 replaces
marks with level-scaled EXP (at most 4,720 for the adjacent level-36 package).
The dormant row grants none of them. It remains hidden until a bespoke
escape-plus-boss state machine, exact actors/profiles, and atomic post-1.20
reward ownership are implemented.

### Thm200 held contract — The Big Payback

The corrected identities and route are:

```text
Yayake 1000846 / processEventYayakeStart / thm20010
  -> I'loofii 1000847 / marker 11024001
       processEvent020 / thm20020
  -> battle destination 11024002
       death-marked billygoat 2202303 / display 3202303 x1
       proof: Twisted Aldgoat Horn 11000015 x1
  -> I'loofii / marker 11024003
       processEvent030 / thm20030 / reward
```

This replaces display ID `1900025` as the old fake owner. The battle is one
unique boss; the internal `xtx_quest` “Lemming 8/8” note conflicts with the
complete journal, dialogue, quest-specific boss actor, and proof item and is
rejected. Ravenous Billygoat `2102303/1315/list 5002` and generic aldgoat
actors are separate creatures, so they cannot supply the boss profile.

No exact level, stats, skills, surrounding herd/add roster, waves, party cap,
entry transform, proof-item grant/consume owner, or failure/retry/cleanup logic
has survived; the recovered director is empty. The post-1.20 package is Wind
Brand `5020210`, 20,000 gil, and at most 1,760 Thaumaturge EXP, with old 2,000
guild marks retained only as legacy evidence. The archive says prerequisite
“Fade to White” while local quest SQL says none. The row remains hidden and
metadata-only until those contradictions are resolved.

### Thm300 held contract — Revelry in Rivalry

Yayake `1000846`, Baderon `1000137`, and Bodenolf `1000144` are exact. The old
`actor = 1000015` value was Baderon's display ID. Rival display `4000189` maps
ambiguously to actor candidates `1000607` and `2289015`, while battle display
`4000257` supplies no trigger actor. The preserved route is:

```text
Yayake / processEventYayakeStart / thm30010
  -> six unbound thaumaturge talks / processEvent010_2..010_7
  -> rival / 11024101 / processEvent020 / thm30020
  -> Baderon / 11024102 / processEvent025
  -> battle / 11024103
       Lemming objective 8/8; exact actor classes/composition unknown
       protect one Naldiq & Vymelli smith; actor unknown
       smith death is not failure: state 12; survival: state 13
       Writ of Access 11000030
  -> Bodenolf / 11024104 processEvent027 (smith-dead report)
                11024105 processEvent028 (smith-survived report)
                11024106 processEvent030 or 030_1
                  ask 51030 result 1 / thm30030
  -> Yayake / 11024107 / processEvent035
  -> rival / 11024108 / processEvent040 / thm30040
  -> Yayake / 11024109 / processEvent050 / final reward
```

This corrects the completion hook from rival aftermath `processEvent040` to
Yayake's final `processEvent050`. Marker rows `11024110`–`11024120` are filler
and excluded. The protected smith's death changes the report branch rather
than failing the quest, which means a generic escort director would be wrong.
No source fixes the Lemming actor classes, count split across actor records,
waves, combat profiles/skills, party cap, smith actor/AI, rival owner, content
launcher, or retry/cleanup. Reward sources conflict between 400 gil, 30,000
post-1.20 EXP, and 3,000 obsolete guild marks. The dormant row records each
fact but exposes no runnable route, battle, or reward grant.

### Thm306 held contract — Law and the Order

The former row used I'loofii's display `1900025` as an actor and treated
36,000 gil as EXP. Yayake `1000846` is the offer owner, I'loofii `1000847` is
the briefing/final owner, and the recovered chronology is:

```text
Yayake / processEventYayakeStart / thm30610
  -> Ossuary information gathering / processEvent010_2..010_7
  -> I'loofii / 11024201 / processEvent020 / thm30620
  -> coach accident and rival / 11024202 / processEvent030 / thm30630
       route actor candidate 1000607 / display 4000189
  -> Echo / 11024203 / processEvent035 / ask 51030 result 1
  -> processEvent040 / thm30640 / AfterWarp / battle handoff
       one “overweening thaumaturge”
       battle actor candidate 2289015 / display 4000189
  -> processEvent050 / thm30650 / AfterWarp / battle aftermath
  -> I'loofii / 11024205 / processEvent060 / thm30660 / reward
```

World marker `11024204` and `11024206`–`11024220` are unrelated Sthalmann
filler; similarly numbered cut-replay rows do not make them valid world
markers. The rival remains alive for the Order's judgment after being bested,
so a death-only kill callback is not proven. There is no exact binding between
route actor `1000607` and battle candidate `2289015`, and no mob type, level,
stats, thaumaturge skill/spell schedule, add/allied roster, wave plan, party
cap, battlefield transform, surrender/HP-threshold rule, or cleanup contract.
The recovered director is empty. A low-confidence Pugilist job inference for
`2289015` is rejected because it contradicts the thaumaturge narrative.

Patch-1.20-era rewards are 36,000 gil and at most 4,720 Thaumaturge EXP; 3,600
Thaumaturges' Guild Marks are legacy data. `processEvent050` is the after-warp
battle aftermath, while I'loofii's `processEvent060` is the final reward hook.
The local SQL prerequisite also still needs correction to Thm300 `110241`, and
central gil/legacy-mark completion must be reconciled atomically with the
script-owned EXP before this route can be enabled.

### War0j3 held contract — Curious Gorge Goes to the Bazaar

This quest has three distinct geographic states, now represented separately in
the hidden template instead of treating both destination markers as battle
entries:

```text
Curious Gorge 1060028 / processEventCURIOUSGORGEStart
  -> northern Silver Bazaar objective
       marker 11220201: X -1343.819946 / Z 364.390015
       Canyon Condor 2201208 / display 3201208
       journal quantity: “flock” / plural only
       party maximum: four total
  -> east gate after the fight
       marker 11220202: X -1343.119995 / Z 480.079987
       processEvent005 / war0j310
  -> Curious Gorge cave
       marker 11220203: X -1116.040039 / Z 285.489990
       processEvent010 / processEventKokuti / Collusion 27188
```

Actor `2201208` is the exact Canyon Condor identity and binds display
`3201208` to `BirdStandard`, but no server mob row supplies its level, stats,
job, skill list, or spells. Other buzzard/vulture profiles and bird skill list
`5060` belong to different actor classes and are not valid provenance. “Flock”
does not establish a numeric count, and Curious Gorge's western half of the
two-pronged assault is narrative direction rather than proof of a second wave.

The recovered `QuestDirectorWar0j301` is empty beyond its generic base. It does
not identify a trigger actor, formation, success rule, post-clear marker owner,
or retry path. The row therefore keeps `11220201` as the combat marker and
`11220202` under `documentedAftermath`; it has no runnable `targets` or
`directorScript` and remains hidden.

### War0j5 held contract — Proof is in the Pudding

The Warrior 45 combat follow-up is an open-world named-monster objective, not
an interchangeable buffalo-family kill:

```text
Curious Gorge 1060028 / processEventCURIOUS_GORGEStart
  -> cave southeast of Camp Iron Lake
       marker 11220401: X 218.679993 / Z -1771.75
       Audhumbla actor 2100804 / KujataHornedWar0j5
       one named target / eight people total
  -> Curious Gorge
       onJobQuestCompleteFirst: long completion notice
       onJobQuestCompleteSecond: Steel Cyclone 27192
       onJobQuestCompleteThird: linkshell actor 1600318 / event 77
```

The actor-class table proves `2100804` and display `3100804`, but no
`server_battlenpc_mob_types` row binds Audhumbla to stats, level, or skills.
The nearby tempting row is Great Buffalo `2100801`, mob `3045`, skill list
`6015`; it is a distinct named monster and cannot be reused merely because it
shares the horned-buffalo family. The template now records Audhumbla under
`documentedTargets`, keeps the exact eight-person cap and completion hooks,
and deliberately omits both `targets` and `directorScript`. The route remains
hidden until Audhumbla's own profile and public/private spawn owner are found.

### War0j6 held contract — How to Quit You

The Warrior finale now preserves both recovered enemy identities rather than a
marker-only placeholder. Curious Gorge `1060028` accepts at the Silver Bazaar;
return marker `11220501` is `(-1116.040039, 285.489990)`, and battle marker
`11220502` is `(-1343.119995, 480.079987)`, both in map area `104/403`. The
journal permits and recommends eight players.

The story first identifies Broken Mountain, then says Curious Gorge defeats
him, succumbs to the inner beast, and turns on the player. The actual named
boss is therefore one frenzied Curious Gorge: actor `2289037`, display
`3280319`, mob `3012`, level 55, skill list `15` (Animal Instinct, Godsbane,
Jump, and Wyvern Dive). The archive also associates level-53 Cliffdivers with
the same quest, and actor `2201209` is explicitly backed by the client subclass
`BirdNormalWar0j6`, but it has no server combat profile. No source fixes how
many birds appear or whether they are an initial, concurrent, or repeating
wave.

`processEvent010` is the entry fade; `processEvent020` owns `war0j620` after
the fight. The Curious Gorge return then calls `processEventClear(8032703)` to
present Fighter's Cuirass and action `27189`. The empty
`QuestDirectorWar0j601` contributes no formation or state transitions. Until
the Cliffdiver profile/count/waves, Broken Mountain scene handoff, private
entry/after-warp owner, and clear transition are recovered, both enemies stay
under `documentedTargets` and the route remains hidden.

### Blm0j1 held contract — Hearing Voices

The Black Mage unlock fight has a complete enemy combat identity but an
incomplete formation and scene lifecycle:

```text
Yayake 1000846 / processEventYayakeStart
  -> Guano Gnats west of Nophica's Wells
       marker 11223002: X -828.539978 / Z -59.150002
       actor 2200610 / display 3200609
       mob 3050 / job 23 / levels 30-42 / skill list 94
       Brundleflight 23064
       journal count: “several” / four people total
  -> processEvent010 / blm0j110 / Gem of Shatotto 11000556
  -> processEvent020 / blm0j120
  -> Yayake / processEventClear / processEventClearAfter
       Soul of the Black Mage 3020410 / Convert 27305
```

Neither recovered `QuestDirectorBlm0j101` nor its simple-battle base binding
contains copy or wave logic. Guessing two, three, or four gnats would turn a
translation's indefinite plural into server behavior. More importantly, the
generic job adapter's normal battle-success transition would bypass one or
both NQ methods. The target therefore stays documented rather than runnable
until the count and the owner of `blm0j110`/`blm0j120` are recovered together.

### Blm0j6 held contract — Always Bet on Black

The full pre-battle interrogation route is source-backed and uses public
actors with existing transforms:

```text
Da Za 1060038 / processEventStart
  -> Dozol Meloc 1060037 / marker 11223501 / processEventDozol01
  -> Kazagg Chah 1060036 / marker 11223502 / processEventKazagg02
  -> Lalai 1060035 / marker 11223503 / processEventLalai02
  -> Nald's Reflection / zone 174 / eight people total
       marker 11223504: X 915.130005 / Z 661.270020
       Barbatos 2203503 / display 3203505 ×1
       local mob 3002 / THM / level 0 / skill list 10 / no spell list
       Void Lanterns: “several,” exact count and actor mapping unknown
```

The encounter's unusual success logic is explicit: Barbatos and the lanterns
begin together, but killing Barbatos wins. Lanterns respawn continuously unless
all are killed together; if all die together, the whole lantern set returns
after 45 seconds. Three Will-o'-the-Wisp actor classes `2209906`–`2209908` and
three empty `SpecterNormalBlm0j6a/b/c` resources exist, but neither set proves
that retail spawned exactly three or maps an ID to an ordinal copy. They remain
unbound candidates, not targets.

The current local Barbatos row provides mob `3002` and elemental skill list
`10`, but its level is zero and its spell-list audit is explicitly unassigned.
No lantern actor has an exact quest profile. `processEventNQ01` owns
`blm0j610`; `NQ02` and `NQ03` own after-warp/default forms of `blm0j620`;
`processEventAfget(8032707)` presents Flare `27316` and Wizard's Coat. The
branch ordering, entry actor/Y/rotation, lantern scheduler, success/failure
transition, and content-owned automatic reward/cleanup are absent from empty
`QuestDirectorBlm0j601`. No EXP is guessed.

### Pld0j6 held contract — Keeping the Oath

The Paladin finale preserves two exact quest-specific monster families:

| Enemy | Actor / display | Mob / skill list | Recovered moves |
| --- | --- | --- | --- |
| Manipulated Eye | `2201706 / 3201708` | `3069 / 2` | Seismic Scream `23093`, Level 5 Petrify `23094`, Aural Vacuum `23095`, Seismic Rift `23298`, Death March `23379`, Death Throes `23380` |
| Manipulated Ogre | `2202503 / 3202504` | `3070 / 34` | Double Smash `23041`, Elbow Drop `23042`, Inferno Drop `23043`, Bone Breaker `23044`, Booming Bellow `23045`, Primal Scream `23046`, Drop Kick `23074`, Bellowing Grunt `23157` |

The journal places the ambush southeast of Camp Bluefog at marker `11224501`
(`121.919998, -1582.25`) and recommends eight people total. It also frames
Jenlyns and Solkzagyl as participants, but does not reveal the enemy copy
counts, waves, ally actor variants, or ally AI. The recovered scenes impose a
second independent constraint: `processEventNQ01` owns `pld0j610` and can exit
locally or after warp, while `processEventNQ02` and `NQ03` own the after-warp
and local forms of `pld0j620`. A content owner must choose and preserve those
branches around the duty transition.

The final Jenlyns handoff is now fully documented even while hidden:
`processEventClear` presents the dialogue, then `processEventKokuti(8032701)`
shows Spirits Within `27148` and Gallant Surcoat `8032701`; the server remains
the authoritative reward grant. No `targets` or `directorScript` is present
until the formation, allies, and warp owner are exact.

### Lnc200 held contract — A Wailing Welcome

The corrected hidden Lancer route is:

```text
Willelda 1000242 / display 1100014 / processEventWilleldaStart
  -> J'moldva 1000599 / display 1900046
       marker 11018001 / processEvent010 / lnc20010
  -> Central Shroud duty marker 11018002
       Orchard Chigoe actor 2205605 / display 3205605 ×4
       participant limit: none
  -> processEvent020 / lnc20020 / AfterWarp exit
  -> J'moldva / marker 11018003
  -> Willelda / marker 11018004
```

Actor `2205605` has no server mob profile. The only readily available Chigoe
profile is mob `1005` for generic actor `2105601` at levels 4–5; assigning it
to four quest chigoes would fabricate their level, stats, and skills. The
archive proves the total count but not whether all four were simultaneous.
It also explicitly says the duty has no participant limit, whereas the shared
launcher currently requires a finite total cap and defaults to three.

The row now uses Willelda's actor class instead of J'moldva's display ID,
records every marker and the four-target count, and sets `exp = 0`: the
recovered `20,000` value is gil, not an authoritative 20,000 EXP grant. Iron
Guisarme `4080406`, 2,000 Lancer marks, and the archived Wailing Barracks
Linkpearl are documented, but guild-currency/Linkpearl delivery and the true
EXP value still need ownership. `processEvent020` must remain attached to the
event that performs the return warp, so no director is installed yet.

### Lnc300 held contract — Culture Shock

The old row used Gagaruna's display ID `1400019` as the quest actor and would
have paid 30,000 EXP on one interaction. The archive instead identifies
Willelda `1000242` as offer/reward owner and proves this sequence:

```text
J'moldva 1000599 / processEventJMoldvaStart / lnc30010
  -> Gagaruna 1000862 / 11018101 / processEvent020 / lnc30020 / AfterWarp
  -> Dreues 1000402 / 11018107 / processEvent030 / lnc30030
       physical test; whether this is playable or scene-only is unresolved
  -> J'moldva / 11018102 / processEvent040 / lnc30040
  -> south-road caravan / 11018103 / processEvent050 / lnc30050 / AfterWarp
  -> Garlean flyover and raging-beast attack / processEvent060 / lnc30060
       protect the Ul'dahn merchants and cargo
  -> injured moogle / processEvent065 / lnc30065 / AfterWarp
  -> merchant thanks / processEvent068
  -> J'moldva / 11018105 / processEvent070 / lnc30070 / AfterWarp
  -> Willelda / 11018106 / processEvent075 / reward
```

Journal states `1, 5, 10, 15, 20, 25, 30, 35, 40` independently preserve the
same progression. Actor `1000403`/display `4000135` owns real marker
`11018104`, but its exact route role is not established. Markers
`11018108`–`11018120` are repeated filler. The central quest row explicitly
lists no participant limit, kill condition, or failure condition; it does not
name even one beast family. The journal only proves a pack, protection of the
merchants, and that an injured moogle is discovered after victory.

The post-1.20 maximum is 3,420 Lancer EXP plus 30,000 gil; 3,000 Lancer marks
are legacy data. No server fight can honestly be built until the enemy roster,
copies, profiles, waves, protected caravan actors, and failure semantics are
recovered. The corrected completion hook is `processEvent075`, because
`processEvent070` is the preceding J'moldva report.

### Lnc306 held contract — Necessary Evils

The old scaffold used J'moldva's display/model ID `1900046` as the live actor
and treated 36,000 gil as EXP. Actor-class joins and the archived quest instead
place both offer and final reward on Willelda `1000242` (display `1100014`),
with J'moldva `1000599` owning the assignment and report:

```text
Willelda 1000242 / processEventWilleldaStart
  -> J'moldva 1000599 / 11018201
       processEvent010 / lnc30610 / argument 1 / AfterWarp
  -> south-road destination / 11018202 / display 4000257
       processEvent020 / lnc30620 / argument 2 / AfterWarp
  -> private caravan defense
       protect the Ul'dahn merchants from an enraged elemental force
  -> processEvent030 / lnc30630 / argument 1 / AfterWarp
       three merchant and three Wood Wailer aftermath dialogue slots
  -> surviving merchant/Echo broker / 11018203 / display 4000135
       processEvent035 / ask 51030 mode 2
       result 1 -> runCharaSchedulerPastAreaIn
       processEvent040 / lnc30640
  -> J'moldva / 11018204
       processEvent050 / lnc30650
  -> Willelda / 11018205
       processEvent060 / reward
```

Journal sequences `0, 5, 10, 15, 20, 25` independently describe the same
route. Markers `11018201`–`11018205` are the only real markers;
`11018206`–`11018220` are repeated unrelated filler. Display `4000135` joins
to actor candidates `1000403`, `2290024`, and `2290028`; `1000403` is the
best public-NPC candidate, but the exact Echo broker remains unresolved.

The fight evidence proves an instanced south-road caravan defense and an
elemental enemy family, but not a safe spawn roster. English uses a singular
“enraged elemental,” while German and French describe multiple elementals;
neither phrasing proves copies or waves. The recovered
`ElementalScenarioLncLv20` client class has no quest actor binding or skill
contract, and `QuestDirectorLnc30601` is empty. Generic elemental
`2105201`/profile `1364`/skill list `5021`, Conjurer elemental `2205201`, and
Pugilist trigger `1000174` are explicitly rejected substitutions. The archive
also lacks actor classes and HP/distance failure behavior for the three
merchants and three Wailers; the Garlean spies in the Echo are story actors,
not player targets.

Reward evidence separates eras: 36,000 gil and a post-1.20 maximum of 6,231
EXP coexist in the archive with legacy item `1000107` ×3,600 Lancer marks and
opaque encoded pair `-13/8`. The dormant row therefore pays zero live EXP and
does not expose a reward transaction. Its corrected completion hook is
`processEvent060`; `processEvent050` is J'moldva's preceding report, not the
reward boundary.

### Min200 held contract — A Piece of History

The recovered level-20 Miner route is a gathering/appraisal chain, not a
fight. The archived quest page and local journal agree that Linette `1000861`
(display `1100016`) offers and rewards the quest after `Fade to White`
(`110013`). The old scaffold incorrectly used Z'ssapa's display ID `1900018`
as an actor class and treated the documented 20,000 gil as EXP.

```text
Linette 1000861 / processEventLinetteStart / ask 77 mode 2
  -> Z'ssapa at Nanawa / 11046001
       actor candidates 1000887 or 1001217 / display 1900018
       processEvent010 / min20010 / argument 2
  -> mine one different quest item from nearby normal nodes in each region
       eastern Thanalan / 11046006 / Sheep's-eye 11000012 x1
       western Thanalan / 11046007 / Petrified Wood 11000013 x1
       central Thanalan / 11046008 / Ewer Fragment 11000014 x1
       Prospect is not required; Lay of the Land is required
  -> Z'ssapa appraisal / 11046003
       processEvent015_1 / 015_2 / 017_A / 017_B / 017_C branches
  -> processEvent020 / min20020 / argument 1 / AfterWarp
  -> Nenekko private story / 11046004
       candidates 1000604, 1000888, or 2290035 / display 1500080
       processEvent030 / min20030 / argument 1 / AfterWarp
       processEvent040 / text 69 / min20035 / argument 1 / AfterWarp
       Nenekko asks for an escort, then walks toward Ul'dah herself
  -> Linette / 11046005
       processEvent050 / text rows 73-76 / final reward
```

Journal sequences `0, 5, 7, 10, 15, 25` and markers `11046001`–`11046008`
materialize the same route. Markers `11046009`–`11046020` are unrelated
repeated filler and are explicitly excluded. `QuestDirectorMin20001` is empty,
so none of the gathering, appraisal, or private-instance mutations can be
delegated to a recovered client director.

The three item IDs and one-per-region objective are exact, but current
gathering infrastructure does not bind those quest items to the relevant
normal mining points, set three independent objective flags, or atomically
consume/appraise the set. Marker `11046002` also uses placeholder display
`4000257` and the generic private transform, so it is not safe as an entry
actor. The dormant row records the route but deliberately has no live `route`
or `battle` table.

Reward evidence is era-split: 20,000 gil and legacy Miner-marks item `1000121`
×2,000 are exact; Patch 1.20 proves conversion from marks to EXP but not the
replacement amount. Iron Dolabra `7010010` is a possible period reward, not a
source-proven reward for this exact transaction. The live row therefore keeps
`exp = 0`, remains hidden, and completes only at `processEvent050` once the
gathering/appraisal/private-content owner is implemented.

### Min300 held contract — Little Saboteurs

The archived walkthrough identifies this as an explicitly non-combat level-30
quest. Linette, not V'korolon's display ID `1900110`, owns offer and reward.
The route combines a private Chocobo Stables scene, a parley result, a buried
object interaction, several Linkpearl/private handoffs, and two independently
required Echo interactions:

```text
Linette 1000861 / processEventLinetteStart
  -> V'korolon 1000458 at Gridania's Roost / 11046101
       processEvent010 / min30010 / argument 1
  -> Chocobo Stables private handoff / 11046102-03
  -> Fafajon's carriage driver 1700010 / display 4000559 / 11046104
       processEvent013 / text rows 19-21
       processEvent017 / win the information through parley
  -> Linkpearl/private transition / 11046105
       processEvent020 / min30020 / argument 1 / AfterWarp
  -> Longroot flower field / 11046106
       inspect the twins' buried box; no enemy is fought
  -> Linette interim report / 11046108
       processEvent025 / text rows 33-34
  -> Eshtaime's Lapidaries instance / 11046109
       Nenekko / 11046110
       processEvent030 / min30030 / argument 1 / AfterWarp
       processEvent040 / min30040 / argument 1 / AfterWarp
  -> Linette/twins presentation / 11046111
       processEvent050 / min30050 / argument 1 / AfterWarp
  -> Popokkuli candidate / 11046112
       processEvent060 / min30060 / Echo ask 51030 mode 2
  -> Seserukka 1000858 / 11046113
       processEvent070 / min30070 / Echo ask 51030 mode 2 / completion
```

The ten journal states are `0, 5, 7, 13, 14, 20, 25, 30, 35, 40`.
Marker `11046114` records the Echo's flower-field geography; markers
`11046115`–`11046120` are contaminated filler. Several private handoff markers
retain the decompiled generic transform `(-431, 187)` and displays `4000257`
or `1600179`; these are evidence of scene boundaries, not legal server actors.
The exact Nenekko variant and the Popokkuli variant among `1000040`, `1000041`,
and `1000857` are likewise unresolved.

This route cannot be reduced to “talk to Linette.” The server must persist the
driver's parley success, own the Linkpearl report, spawn and gate the buried
box, and store separate Popokkuli/Seserukka Echo bits. In particular,
`processEvent050` is not completion: the journal still requires both Echoes.
The corrected completion hook is `processEvent070`, after the second successful
`51030` Echo prompt. `QuestDirectorMin30001` is empty, so those state owners
must be implemented explicitly before promotion.

The exact historical reward is 30,000 gil plus Miner-marks item `1000121`
×3,000. Patch 1.20 proves an EXP replacement exists, but its value is still
unresolved. The row remains metadata-only with `exp = 0`, no offer, and no
partial reward path.

### Min306 held contract — Runaway Little Girl

This level-36 finale is an escort/chase solved by mining. The archived
walkthrough is unusually precise about the objective loop: while escorting
Nenekko toward Vesper Bay, the party reaches three stops; two mining points
appear at each stop; both points must be mined once before Nenekko continues.
That is exactly six gathering interactions. The pursuer is evaded by the dug
pits and is not a kill target.

```text
Linette 1000861 / processEventLinetteStart
  -> Momodi 1000841 at the Quicksand / 11046201
       processEvent013 / text rows 70-71
       min30610 / argument 1 / Nenekko private scene
  -> Quicksand transition / 11046202
  -> Sil'dih mirage viewpoint south of Ul'dah / 11046203
       processEvent020 / fade-only boundary; expected min30620 is absent
  -> western Thanalan border / 11046204
       escort Nenekko toward Vesper Bay
       stop 1: mine point A once + point B once
       stop 2: mine point A once + point B once
       stop 3: mine point A once + point B once
  -> Vesper Bay ferry docks / 11046205
       processEvent030 / min30630 / argument 1 / AfterWarp
       processEvent035 / text rows 53-54 / Nenekko farewell
  -> Linkpearl/private transition / 11046206
       contact Popokkuli and Seserukka
  -> Linette / 11046207
       processEvent040 / min30640 / argument 1 / final reward
```

The seven journal states `0, 3, 5, 10, 13, 15, 20` match the seven real
markers. `11046208`–`11046220` are unrelated filler. Nenekko actor candidates
remain `1000604`, `1000888`, and `2290035`, all using display `1500080` in the
recovered material; the escort-specific copy is not identified. The pursuer,
six node actors, exact escort spline, three stop transforms, leash/failure
conditions, and retry/cleanup semantics are also absent. The empty
`QuestDirectorMin30601` supplies none of that lifecycle.

The implementation must therefore model an escort that pauses at an indexed
stop, materializes two quest-owned gathering points, accepts each point only
once, advances only after the local pair is complete, and cleans all points on
failure or success. Killing a generic pursuer would contradict the source and
is explicitly forbidden by the dormant contract. `processEvent020` must remain
a fade-only transition unless a real `min30620` resource is recovered.

Reward evidence records 36,000 gil, legacy Miner-marks item `1000121` ×3,600,
and command `29724`, **Master of Rock**. Patch 1.20 proves replacement EXP but
not its amount. The row consequently pays no live EXP and grants neither money
nor the command until escort completion, reward atomicity, and command
ownership are implemented. Its final hook is `processEvent040`; the preceding
escort and Linkpearl boundaries cannot complete it.

### Wvr200 held contract — Hoodwinked

The first Weaver quest is a five-state non-combat crafting story. Deaustie is
actor class `1000293` (display `1300034`) and owns both offer and reward; the
old template had used the display ID as the actor and had also interpreted the
20,000-gil reward as EXP. The archived reward lists the Sunsilk Tapestries
Linkpearl and 20,000 gil, not the template's invented Brass Needle `6060010`.

```text
Deaustie 1000293 / processEventDeaustieStart / ask 51 mode 2
  -> Golden Bazaar / 11040001
       processEvent010 / wvr20010 / argument 1 / AfterWarp
       meet Chuchumu; her inherited hood has been torn by a beast
  -> Deaustie / state 5
       receive/track Ripped Riding Hood 11000055
  -> state 6 synthesis
       Red Riding Hood 11000054 ×1
         Ripped Riding Hood 11000055 ×1
         Undyed Cotton Cloth 10005005 ×1
         All-purpose Red Dye 10010719 ×1
         Cotton Yarn 10005302 ×1
  -> Golden Bazaar / 11040002-03
       processEvent020 / wvr20020 / argument 1 / AfterWarp
       give the repaired hood to Chuchumu/Ouvielle
  -> Deaustie / 11040004
       processEvent030 / wvr20030 / final reward
```

The journal states are exactly `0, 5, 6, 8, 10`. The quest UI exposes Ripped
Riding Hood from state 5 until 7 and the repaired Red Riding Hood from state 7
until 10. Markers `11040001`–`03` all point to the same Golden Bazaar
destination at `(1106.5, -1056.910034)` in eastern Thanalan; `11040004` points
to Deaustie. The third duplicate destination's precise state owner is not
encoded by the marker table, so it remains explicit unresolved metadata rather
than a fabricated NPC. Markers `11040005`–`20` are generic contaminated filler.

The recovered client scenario also contains seven `processEvent005_*` and six
`processEvent020_*` public-dialogue variants around the two cutscene phases.
Those variants prove this was not one NPC click, but they do not provide the
server-side quest-item grant, synthesis-result callback, idempotent consume,
or after-warp event lifetime. `QuestDirectorWvr20001` is empty. Chuchumu's
display maps to candidates `1000905` and `1000906`, while Ouvielle's exact
quest copy and all Golden Bazaar push actors remain unresolved. The dormant
contract therefore pays nothing and stays hidden until those state owners are
real. Historical Weaver marks are item `1000118` ×2,000; patch 1.20 proves an
EXP replacement existed, but the archived Hoodwinked row reports no amount.

### Wvr300 held contract — Dance the Night Away

This level-30 quest is a travel-and-Parley chain. It contains no conventional
combat and no crafting objective. Deaustie again owns both ends. Chuchumu asks
for magical slippers; Soileine sends the player to Theldry at the Ebony
Stalls; Theldry will part with the Midnight Slippers only after the player
advertises her shop by winning four separate Parley encounters.

```text
Deaustie 1000293 / processEventDeaustieStart
  -> wvr30010 / argument 2 / conditional AfterWarp / guild instance
  -> Chuchumu candidate 1000905 or 1000906 / 11040101
  -> Soileine 1000234 / 11040102
       processEvent012 / text rows 17-23
  -> Theldry 1000379 / 11040103
       processEvent015 / text rows 24-26,55
  -> advertise Theldry's shop; all four are required
       Cicely 1000326 / 11040107 / S001-S004 event group 1
       Nesta 1000593 / 11040108 / S001-S004 event group 2
       Keelty 1000587 / 11040109 / S001-S004 event group 3
       Miounne 1000230 / 11040110 / S001-S004 event group 4
       processEvent018 / 018_2 / 019: Theldry result and item grant
  -> Midnight Slippers 11000139 / visible at state 19
  -> Chuchumu / 11040104
       processEvent020 / wvr30020 / argument 1 / AfterWarp
  -> Deaustie / 11040105
       processEvent030 / text rows 33-35 / final reward
```

The journal states are `0, 5, 10, 15, 19, 20`. Marker `11040106` is a generic
Ul'dah private-area boundary; it is not a legal replacement NPC. The remaining
ten markers map cleanly to the named route above. The scenario has four
complete Parley dialogue families: `processEventS001_1`–`S004_1`, through
`processEventS001_4`–`S004_4`. Each initial dialogue uses ask row `70` in mode
`4`. The negotiation table contains quest titles `2401` through `2901`, but
the recovered evidence does not bind an individual title ID to an individual
opponent; the contract records that ambiguity instead of choosing four
arbitrarily. The runtime must persist four independent wins and gate Theldry's
item grant on all four.

The previous hook incorrectly treated `processEvent020`, Chuchumu's slipper
delivery scene, as completion. The journal still directs the player to
Deaustie, and `processEvent030` is the final three-line reward talk, so the
corrected hook is `processEvent030`. The archived package is 30,000 gil and a
maximum 3,420 post-1.20 EXP; the central old-era table retains Weaver marks
`1000118` ×3,000. `QuestDirectorWvr30001` is empty, leaving Parley launch,
result callbacks, four result bits, private instance return, slipper
grant/consume, and atomic era-correct reward unresolved.

### Wvr306 held contract — A Fruitful Murder

This quest is the strongest warning against classifying content from a
director filename alone. The client contains both a normal
`QuestDirectorWvr30601` and a same-named `SimpleQuestBattleBaseClass` child,
but both bodies are empty and the retail archive explicitly labels the quest
**Non-Combat**. The objective is interaction plus location-bound synthesis:
free Chuchumu from webs one silk strand at a time, and immediately use each
strand to craft a glove beside her because the silk cannot be transported.
There is no spider kill objective and no recovered enemy roster.

```text
Deaustie 1000293 / processEventDeaustieStart
  -> order Luxurious Gloves 11000056 ×10
  -> Chuchumu at Sunsilk / 11040205
       processEvent010 / wvr30610 / argument 1
       recipe briefing; travel to Copperbell Mines
  -> Copperbell approach/content / 11040201-02
  -> web-entangled Chuchumu / 11040206
       processEvent020 / wvr30620 / argument 1
       remove Thanalan Spider Silk 11000057 one strand at a time
       synthesize beside Chuchumu until Luxurious Gloves count reaches 10
       processEvent008/008_2 and S001-S005 interaction/progress responses
  -> Deaustie / 11040204
       deliver ten gloves; prince recognizes Chuchumu
  -> Gold Court / 11040203
       Echo reveals poisoned apples for Ouvielle and the stepsisters
  -> late return/completion boundary
       processEvent030 / wvr30630 / argument 1
```

The exact per-glove recipe is one Thanalan Spider Silk `11000057`, one Undyed
Velveteen `10005015`, and one Cotton Yarn `10005302`. The archived walkthrough
therefore tells the player to bring **ten** Velveteen and **ten** Cotton Yarn
to Copperbell, then make ten Luxurious Gloves there. The journal states are
`0, 5, 10, 15, 20, 25, 30`; the quest UI tracks the dynamic glove count and
the transient silk during the Copperbell phases. Markers `11040201`–`06` are
meaningful and `11040207`–`20` are filler.

`processEvent030` is the last scenario method and remains the completion hook.
The exact split between the Gold Court revelation and Deaustie's final return
is internal to the late scene/state callbacks and must be recovered before a
live route mutates state 30. The empty SQB child is treated as a likely owner
for the private silk-removal/on-site-synthesis lifecycle only. Promotion needs
a Copperbell entry trigger, a Chuchumu instance actor, one-use strand
interactions, ten location-bound synthesis credits, item rollback and cleanup,
success/retry/exit handling, the late Echo state owner, and one atomic reward.
Substituting spiders, waves, or kill callbacks would contradict the archive.

Rewards are 36,000 gil and a maximum 3,720 post-1.20 EXP—not the generic
4,720 seen on several other level-36 class quests. The old-era table records
Weaver marks `1000118` ×3,600. All remain descriptive and unpaid while the
route is hidden.

### Alchemist held contracts — medicine, information Parley, and Echo synthesis

Alc200 replaces three unsafe assumptions: Nomomo display `1500091` is not the
offer actor, 20,000 is gil rather than EXP, and the Iron Alembic cannot be paid
alongside a late-era package without selecting an era. Nogeloix
`1000597/1200017` offers and rewards the quest. Nomomo `1001392/1500091`
grants Mummified Mole `11000076`; Patch 1.21 requires it plus Eye Drops
`3020401` to make Potent Medication `11000077`. Nogeloix inspects but must not
consume it, because S'lyhhia `1000932/1900021` then administers it. The states
are `0/5/7/10/15`; `alc20020` and `alc20030` preserve an initial-town branch,
and `processEvent030` is final. SQL says no prerequisite while the archive says
`110013`, so it remains hidden.

Alc300 has states `0/5/10/15/20/25/30`. Frondale's Funds `11000037` can buy
Penelope's Background `11000038` or Evaluation `11000039`; three negotiation
titles `1302`–`1304` share the quest title, but their no-memo/background/
evaluation mapping is absent. Parley success is work slot 2 reaching 10.
Penelope then grants Starfall Grass `11000041`, which must be delivered before
the ward scene. `processEvent010` is therefore not completion;
`processEvent020` is. Damielliot, the second information seller, and the final
ward interaction owner are unresolved.

Alc306 enters the Echo with ask `51030`, obtains Frondale's Poultice
`11000078`, and synthesizes Faustigeant's Salve `11000079` on site. Only the
poultice input is proven; extra recipe materials are not. States are
`0/5/10/12/15/20`; `processEvent010` runs `alc30610` and `alc30620` before
AfterWarp, and Nogeloix's `processEvent030` is final. None of the three quests
has a combat target, failure condition, or non-empty director.

### Blacksmith/Armorer held contracts — dual recipes and island puzzle

Bsm200/300/306 are shared by Blacksmith class `30` and Armorer class `31`.
Bodenolf `1000144/2200064` owns offers and Mimidoa `1000176/1400012` owns
rewards. Bsm200 has four exact outputs per class: the Blacksmith branch makes
items `11000004`–`07` from Bronze/Iron Ingots, while the Armorer branch makes
`11000008`–`11` from Bronze/Iron Plates, Rivets, and Iron Ingots. States are
`0/5/7/8/9`; `processEvent020` is final. Class validation, every synthesis
transaction, and class-specific tool/mark rewards remain missing.

Bsm300 is a non-combat six-opponent route with three Parley stages per miner.
The result is Seastone `11000023` or Reverberating Steel `11000024`, followed
by Whistling Windwheel `11000022`. Its state bands run through `45`, all twelve
real markers are preserved, and `processEvent040` is final. The eighteen
opponent/title/result bindings are the activation blocker.

Bsm306 branches to Sound-proofing Rubber `11000052` → Bronze Earplug Mold
`11000050` for Blacksmith, or Admiral Alloy `11000053` → Bronze Earplug Casing
`11000051` for Armorer. Brass Earplugs `11000080` must then be equipped during
an eight-victim island puzzle. Only one clue—Charred Red Newt `11000102`, Bent
Glasses `11000103`, or Island Coconut `11000104`—may be held at once. The exact
clue/victim mapping is absent. `processEvent020` is a middle scene and
`processEvent040` is final; there is no combat objective.

### Culinarian held contracts — paired recipes, Parley, and two Echo gates

Cul200's two independent work counters each progress through `5/10/15`.
Prudentia `1000168/1100450` requests Piping Hot Pie Crust `11000069` from five
exact ingredients; Pulmia `1000169/1100408` requests Aromatic Pate `11000070`
from another five. Charlys `1000138/1000066` offers the quest, but the exact
final interaction owner is not bound. The route is non-combat and ends at
`processEvent030`.

Cul300 is an investigation with one mandatory Parley against thickset
sailor/tailor candidates `1000292` or `1700032`; it has nine states, seven real
markers, and no crafting/combat. `processEvent030` is still a preceding route
scene; Charlys's `processEvent035` is final.

Cul306 cooks Foulbelly Meatball `11000073` from Button Mushroom, Queer-smelling
Meat, and Sweet-smelling Spice, then Devilbelly Meatball `11000071` from that
output and two Devilshrooms `11000072`. The Devilshroom source is not locally
recovered. Two separate `51030`/mode-2 Echo gates occur at `processEvent020`
and `050`; `processEvent065` is late dialogue, while Charlys's
`processEvent070` is final. No combat or Parley is encoded.

### Leatherworker held contracts — armor repair, hostage Parley, and evaluation recipes

Hereward is actor `1000231`, display `1000324`, and owns the offer/reward
boundary for all three Leatherworker quests. The former template actors
`1500065`, `1300094`, and `1000324` were Lalatta/Vielle/Hereward display IDs,
not three valid quest owners. The routes are non-combat; their activation
blockers are synthesis, equipment, Parley, and private-event transactions.

Tan200, The Silent Partners, has states `0/5/10/15/17/18/20`:

```text
Hereward / processEventHerewardStart
  -> Lalatta / damaged Wood Wailer armor
  -> repair 11000044 + Aldgoat Leather 10007126
       result: Repaired Wailer Armor 11000045
  -> Lalatta's repair fails; receive Armor Remnants 11000046
  -> make Wood Wailer's Jacket 8030916
  -> Hereward inspection; equip the jacket
  -> chocobo-stable inspection while wearing it
  -> Gylbart/Quarrymill delivery
  -> Hereward / processEvent050 / tan20050 / reward
```

The exact replacement-recipe registration is not recovered even though the
key material, additional leather, wearable result, and equip step are. There
is also a source conflict worth preserving: the damaged item's English text
calls it buffalo leather, while the recovered recipe key is Aldgoat Leather.
Markers `11038001`–`11` are route-specific; `12`–`20` are filler. Scenes run
`tan20010/20/30/40/50`, with after-warp ownership in `010` and `030`.
Raw rewards include 20,000 gil, Leatherworker marks `1000117` ×2,000, the
Wood Wailer's Jacket, old tool Iron Round Knife `6050011`, and maximum 1,760
post-1.20 EXP. The jacket's route-versus-final-reward ownership must be made
atomic before the quest can be enabled.

Tan300's title is **Designer Imposters**; the old SQL/template spelling
“Design Imposters” has been corrected. The route delivers Leather Chocobo
Saddle `11000021` to Owl's Nest. A lone bandit ambush follows, but Lalatta
knocks him out in the scene: there is no player kill count, enemy profile, or
quest battle. Lalatta later instructs the player by linkpearl to make Fen-Yll
Birkin Bag `11000047` from Toad Leather `10007113` and Brass Ingot `10003012`.
At Clearwater Lake, Vielle `1000388/1300094` holds the leatherworkers hostage.
Her mandatory Parley uses title `1101`; the Knights rescue the hostages after
success. States cover `0/5/10`, crafting bands `15`–`19`, hostage/Parley bands
`20`–`24`, and final state `25`. Markers `11038101`–`08` and scenes
`tan30010/20/30/40/50` are retained. `processEvent050` is Hereward's final
boundary; activation still needs Ser Yuhelmeric/hostage actors, item mutation,
Parley result persistence, private transitions, and cleanup.

Tan306, Head of the Class, has a mandatory novice Parley (title `5401`) and a
work-slot selector choosing one of eight evaluation recipes. Every selected
recipe asks for five copies of its output:

| Selector | Output ×5 | Recovered material IDs |
| ---: | --- | --- |
| 1 | Dated Leather Jackboots `8080806` | `10007106, 10007303, 10007409, 10310009, 10311214, 10007503` |
| 2 | Dated Leather Armguards (Black) `8070903` | `10007106, 10007107, 10311213, 10003072, 10007502` |
| 3 | Dated Leather Tool Belt (Red) `8090002` | `10007107, 10007109, 10311214, 10002072, 10007502` |
| 4 | Dated Leather Satchel Belt `8090201` | `10007106, 10007303, 10311216, 10007502` |
| 5 | Leather Crakows `8080513` | `10002012, 10007126, 10007510, 10009307` |
| 6 | Toadskin Hunting Belt `8090504` | `10002013, 10007113, 10007126` |
| 7 | Toadskin Jacket `8030922` | `10007113 ×2, 10007126, 10007510` |
| 8 | Toadskin Jacket `8030922` | `10002073, 10007113 ×2, 10002013` |

The later repair is exact: Damaged Fen-Yll Boots `11000048` plus Boar Leather
`10007116` produces Vintage Fen-Yll Boots `11000049`. States are
`0/5/10/16/17/18/20/22/25/30`; markers `11038201`–`15` are meaningful. The
Garlean-juggernaut component triggers Lalatta's reaction, and
`processEvent040` asks `51030` in mode 2 before `tan30640` enters her past.
That Echo is not completion. `processEvent050` is the final Hereward boundary.
No hostile encounter is encoded. Promotion needs the novice/students, selector
and synthesis result callbacks, all item transactions, and the Echo owner.

### Carpenter held contracts — bow repair, youngling Parleys, and Wybir scouting

A'naidjaa is actor `1000465`, display `1900034`, and owns the first two quests.
Nonolato is `1000463/1400007`; Ryd is `1000412/1000414`. Wybir and Marcelloix
have recovered actor candidates `1000556/1100118` and `1000596/1200064`, but
those actor rows are empty and lack safe public placement. All three archived
quests are non-combat even though Wdk306 contains combat-adjacent narration.

Wdk200, The Mouths of Babes, delivers Vibrant Arrows `11000026` to Wybir at
Quarrymill. Her Gods' Quiver bow breaks, producing Splintered Bow `11000061`.
The player searches for Blooming, Supple, and Sturdy Branches
`11000062/63/64`; three work flags record the discoveries. Each branch
interaction uses confirmation ask `85`, mode 2. A selector can produce
Blooming Bow `11000058`, Supple Bow `11000059`, Sturdy Bow `11000060`, or the
unchanged Splintered Bow for the unsuitable/no-repair outcome. The exact
selector-to-result values are not recovered, so the server must not silently
make every branch succeed. States are `0/5/10/12/15/20`; markers
`11030001`–`06` and scenes `wdk20010/20/30` are exact. A'naidjaa's four-line
`processEvent040` is final. Raw rewards are 20,000 gil, Carpenter marks
`1000113` ×2,000, Bas-relief Iron Saw `6010011`, and maximum 1,760 EXP.

Wdk300, Hide and Seek Shenanigans, uses main states
`0/5/10/14/15/20/25/30/35`; state 10 contains substates
`0/5/10/15/20/25`. The journal places Nicoliaux at Acorn Orchard, Ryd at the
Wailing Barracks, and Elyn near Quiver Hold, each behind a mandatory Parley.
Sansa, Powle, and Nicoliaux provide leads, while Aunillie turns out never to
have left the workshop. Four recovered event groups `S000`–`S003` and four
negotiation titles `2101/2201/2301/2302` all carry the quest name; only three
named opponent joins are explicit, so the fourth event/title mapping remains
unassigned.

After the children return, Colorful Building Block `11000029` goes to
Nogeloix at the Phrontistery. He provides Sable Salve `11000027` for
Marcelloix; V'korolon `1000458/1900110` owns the emergency summons. Marker
`11030102` is an isolated copied filler row; `01` and `03`–`13` are the real
route. `processEvent055` is an ask-`108` gate, and `processEvent060` plays the
Marcelloix cure aftermath. It is not completion: A'naidjaa's final four-line
`processEvent070` follows. Rewards are 30,000 gil, Carpenter marks ×3,000,
Woolen Sugarloaf Hat (Red) `8010932`, and maximum 3,420 EXP.

Wdk306, Spanning the Spectrum, is the important fight-classification edge
case:

```text
Marcelloix / processEventMarcelloixStart
  -> children / Acorn Orchard
       gather Large Leaf 11000066
       craft Fairweather Fetish 11000065
  -> Nonolato / scouting briefing
  -> Wybir / road to Quarrymill
       player supplies arrows
       Wybir shoots the beasts
       no player kill objective is recovered
  -> A'naidjaa / route clear
  -> Mirror excursion / speak with each child
  -> rain and drawing interactions / ask 108, mode 5
  -> artwork to Marcelloix / processEvent060 / wdk30660
```

The states are `0/5/10/12/13/14/15/20/25/28`; Gods' Quiver Petition
`11000028` is also visible on the scouting route. The local source supplies no
enemy actor, count, mob profile, arrow recipe/delivery callback, allied-shooter
AI, Wybir failure rule, or route transform. Consequently this cannot be
implemented honestly as a player battle or generic escort. Markers
`11030201/02/03/04/06/07/08/09/10` are meaningful; `05`, `11`, and `12`–`20`
are copied/filler boundaries. Scenes progress through `wdk30610/20/30/40/50/60`;
the old `processEvent030` completion hook stopped immediately after scouting.
Raw reward rows disagree at 38,000/36,000/34,200/32,600 gil, while central SQL
uses 36,000; legacy mark variants are 3,600/3,420/3,240. The selector/era rule
must be recovered before any reward is paid.

### Gld200 held contract — She Walks in Beauty

This is a non-combat crafting route with three mandatory miner Parleys. Elecotte
`1000950/1300001` owns the offer and final reward; Colbernoux
`1000949/1200166` owns the commission briefing. The old template row used
Colbernoux's display ID as an actor class, copied the 20,000-gil reward into
EXP, and could grant an Iron Ornamental Hammer from a conflicting reward era.

```text
Elecotte / processEventElecotteStart
  -> Colbernoux / 11036001,03,04 / processEvent013
  -> Z'ssapa / 11036002
       deliver Amajina Silver Nuggets 11000121
       receive Brooch Pin 11000109
  -> three miners / 11036007-09
       win all three Parleys
       receive sketches 11000110/11/12, then Ideal Miner Sketch 11000113
  -> synthesize Z'ssapa's Brooch 11000108
  -> Z'ssapa, then F'lhaminn/Echo / 11036005
       gld20020 -> gld20030 -> gld20040 -> gld20050
  -> Elecotte / 11036006 / processEvent060 / reward
```

The exact journal states are `0, 5, 10, 15, 17, 18, 20, 25`; miner progress is
stored in three separate work slots. Each win grants one of Adorable, Graceful,
or Dashing Miner Sketch, and all three produce the Ideal Miner Sketch. The
scenario and archive do not bind a particular sketch/title to each miner, so
the contract does not invent those mappings. The archived recipe requires the
silver nuggets and Brooch Pin; the Ideal sketch is proven guidance/key data but
is not proven consumed. Markers `11036001`–`09` are real and `10`–`20` are
filler. `QuestDirectorGld20001` is an empty base-class shell.

The final hook is `processEvent060`, not the earlier story scenes. Raw data
records 20,000 final gil, 1,000 mid-route gil, Goldsmith marks `1000116` ×2,000,
and Iron Ornamental Hammer `6040012`; the late archive reports 21,000 total gil,
maximum 1,760 EXP, and Eshtaime's Linkpearl without listing that hammer. These
era-conflicting rewards remain unpaid until one atomic policy is selected.

### Gld300 held contract — F'lhaminn's Flower

This route's “fight” is an escort-protection mechanic, not a conventional
kill-count duty. From Camp Tranquil the player follows a spriggan through the
forest. Three hostile encounters occur; the spriggan is attacked and fights
back, and its death fails the attempt. Player healing magic cannot heal it.
Instead, green gathering points grant Mismatched Stones `11000115`, two of
which make one Violet Augite `11000114`; using Augite heals the spriggan and
also raises its attack. With enough Augite the player can let the spriggan do
the fighting. No surviving local table proves the hostile actors, copies,
transforms, or waves, so those details are intentionally not fabricated.

```text
Elecotte / processEventElecotteStart
  -> Opyltyl / 11036101
  -> V'korolon / 11036102,04
  -> Camp Tranquil/Juliembert boundary / 11036103
       start spriggan follow/protection
       encounter 1 -> encounter 2 -> encounter 3
       follower death = failure
       Violet Augite = follower heal + attack increase
  -> flower clearing/Moogle boundary / 11036110
       mandatory Parley title 3801, "F'lhaminn's Flower"
       obtain exactly one Pearl Clover Blossom 11000123
  -> Elecotte / 11036105
  -> Colbernoux / 11036106; receive delivery request
  -> F'lhaminn / 11036107; deliver F'lhaminn's Flower 11000124 / Echo
  -> Colbernoux / 11036108 / processEvent090 / reward
```

The state machine contains `0, 5, 10, 15`, Parley ranges `20`–`24` and
`25`–`32`, then `33, 35, 40, 48, 50`. The initial story asks for ten blossoms,
but the actual successful route grants one Pearl Clover Blossom. Shattered
Brooch `11000122` is the other delivery-chain item. The candidate spriggan ally
is `2290036/3206201`, but its quest binding is not exact enough to enable.
Markers `11036101`–`10` are meaningful and `11`–`20` are filler. Scenes are
`gld30020/30/40/50/60/80`; `processEvent078` is the re-entry prompt and
`processEvent090` is Colbernoux's final dialogue. The director is empty.

Raw rewards are 30,000 gil and Goldsmith marks `1000116` ×3,000. The archive
does not report EXP for this row; 3,420 is only the generic level-30 candidate,
so it is recorded as inferred and not granted. Promotion requires a real
follower path/AI, damage and Augite item-command callbacks, node ownership,
three exact encounters, fail/retry/cleanup, the Moogle actor/result flag, all
inventory transactions, and one atomic reward boundary.

### Gld306 held contract — Struck Through the Heart

The final Goldsmith quest is explicitly non-combat. It begins with a mandatory
Parley against Sence `1001498/1100422`, then uses three storehouse interaction
points to grant exactly one Pure Metal Ore `11000117`, one Brilliant Glass
Shards `11000118`, and one Silverwater `11000119`. After showing all three to
Sence, the player synthesizes one Heartstrike Replica `11000116`; the archived
walkthrough explicitly says this requested synthesis grants no synthesis SP.

```text
Elecotte / processEventElecotteStart / gld30610
  -> Sence / processEvent011/012 / mandatory Parley
  -> three storehouse "???" interactions / 11036201
  -> show all three materials to Sence / 11036206
  -> processEvent015 / gld30615
  -> synthesize Heartstrike Replica / processEvent020 / gld30620
  -> Colbernoux at Ossuary / 11036202-03
  -> processEvent030 / gld30630 / Niellefresne-Greinfarr Echo / AfterWarp
  -> Colbernoux / 11036204 / processEvent040 / reward
```

The journal states are `0, 1, 2, 3..4, 5, 10, 15`. Markers `11036201`–`06`
are meaningful and `07`–`20` are filler. `processEvent020` is the middle
replica scene; the corrected completion hook is `processEvent040`.
`QuestDirectorGld30601` is empty. Raw reward variants preserve
36,000/28,800/25,200 gil and 3,600/2,880/2,520 marks, but their selection rule
and post-1.20 EXP are unreported. The route remains hidden until storehouse
objects, the Sence negotiation title/result, recipe and inventory transactions,
private-area/Echo ownership, and reward variant can be implemented exactly.

### Mnk0j1 held contract — Brother from Another Mother

The Monk unlock encounter is unusually well documented at the objective
level:

```text
Gagaruna 1000862 / processEventGAGARUNAStart
  -> Erik 1060033 / marker 11221001 / processEvent005
  -> west of Mythril Pit T-8, south of Camp Drybone
       marker 11221002: X 1283.359985 / Z -155.490005
       server zone 144 / map region 104 / area 402
       Runagate Imp 2202611 / display 3202612 ×3
       all level 35 / four people total
  -> automatic processEvent010 / mnk0j110
       processEvent010_2_system(3020410)
       processEvent010_3_system / Shoulder Tackle 27108
```

The walkthrough fixes the target count and level and depicts the three imps
together, but the empty retail director does not independently encode wave
timing. More importantly, actor `2202611` has no server mob profile. The nearby
level-34–37 Firestarter Imp profile `1298`, skill list `5034`, and spell list
`2` are family analogues; assigning them would invent Runagate-specific stats,
detection, and actions.

There are also two lifecycle mismatches. Marker `11221002` has no actor class,
Y, or rotation, so the generic route would launch content immediately at Erik
rather than after travel. On success the retail path automatically starts
`mnk0j110` and presents rewards; the shared runtime advances to sequence 10 and
waits for a later public reward-actor click, but this quest has no recovered
reward NPC. The exact count/level/location/scene metadata and widget hooks are
now staged, while the row remains non-runnable.

### Mnk0j3 held contract — The Pursuit of Power

This route is close, but it is intentionally two objectives rather than a
boss-only quest:

```text
Erik 1060033 / processEventStart / Outdated Aetheriometer 11000553
  -> Widargelt 1060032 / marker 11221201 / processEventStartAfter
  -> marker 11221202 / four people total
       Prince of Pestilence 2100610 / display 3100612
       mob 3081 / level 47 PGL / HP 19285 / MP 25530
       effective NM skill list 6026 / one target, one wave
  -> sequence 6 / measurement marker 11221203
       place/use Outdated Aetheriometer 11000553
  -> processEventClear / mnk0j310 / processEventAfget / action 27109
```

Skill list `6026` carries Brundleflight, Thunderstrike, Thunderwall, and
Thunderstorm. The blocker is the measurement point: marker `11221203` has
only X/Z and ambiguous display `4000257`, not an actor class, Y/rotation, or
unique interaction owner. The existing item-objective registry is deliberately
location-bound only for Mnk0j2's item `11000552`; adding `11000553` without a
point owner would let the player complete the measurement anywhere. The
template therefore records the boss under `documentedTargets` and the second
objective under `documentedPostBattleInteraction`, with no runnable director.

### Mnk0j4 held contract — Good Vibrations

Erik's level-45 assignment gives the player Experimental Aetheriometer
`11000555` and sends an up-to-eight-player party to marker `11221301` at
`(-1670.089966, -1212.099976)` in Western Thanalan, server zone `172`, map
area `104/403`. The target is exactly one level-53 Apep: actor `2100723`,
display `3100721`, backed by the quest-specific client resource
`BasiliskLesserMnk0j4`. The instrument shatters when the objective completes.

The final Erik presentation is also exact:

```text
onJobQuestCompleteFirst  / completion notice and item 11000555 handling
onJobQuestCompleteSecond / Dragon Kick 27118
onJobQuestCompleteThird  / Widargelt linkshell display 2200241, event 93
```

The actor identity is not a combat profile. No local mob row binds `2100723`
to stats, level, job, skills, spells, or loot, and the marker supplies no
Y/rotation or entry actor. Generic basilisk `2100709` and family skill list
`5006` belong to a different actor and are not substituted. The hidden row now
retains the exact item, count, level, cap, coordinates, and completion hooks
without creating runnable targets.

### Brd0j1 held contract — A Song of Bards and Bowmen

The narrative and count are exact:

```text
Georjeaux 1000830 / processEventGEORJEAUXStart
  -> Jehantel 1060039 / marker 11225001 / processEvent000
  -> Pukno Poki 1001936 / marker 11225002 / processEvent005
  -> marker 11225003 / four people total
       Qiqirn Shirrer actor 2206306 / display 3206306 ×4
  -> Jehantel / marker 11225004 / processEvent015
       processEventJob(3020410) / Soul 2000205 / action 27237
```

No mob row binds Qiqirn Shirrer to a `mobTypeId`, stats, job, or skill list;
the empty recovered simple-battle director supplies none of those facts.
Jehantel and Pukno Poki are also absent from public spawn locations, even
though their actor classes and marker displays are known. The source now
retains the exact four-target count, cap, route, and missing reward widget
hook while keeping the row non-runnable.

### Brd0j4 held contract — Doing It the Bard Way

The single-line marker scaffold now records the complete evidence that is safe
to retain. `processEventStart` gives Jehantel's Ballad of the Vainglorious Fool
lesson and sends an up-to-eight-player party north of Hyrstmill. Marker
`11225301` is the exact DAT destination at `(-480.369995, -2624.030029)` in
map area `103/303`. `processEventNQ01` owns the default/after-warp form of
`brd0j410`; `processEventNQ02` is its all-default variant. The scene depicts
Jehantel drawing his bow but being unable to fire, so actor `1060039` is
documented as a noncombat scene participant rather than an allied target.

The archive independently names the attacking families and levels: Ixali Scout
`2206412`/display `3206412` at level 52, and Scout Wolf
`2201428`/display `3201427` at level 50. Neither actor has a local
`server_battlenpc_mob_types*` row. The sources say only “Ixali van/troop,” so
copy counts, waves, kill condition, and skills cannot be inferred. The checked
client `QuestDirectorBrd0j401` is an empty subclass and supplies no missing
lifecycle data.

After an eventual exact clear, `processEventNQ03` owns `brd0j420`, followed by
one of the identical `processEventClear01`/`Clear02` reward presentations for
action `27232` and 5,340 EXP. The private entry transform, after-warp owner,
automatic fight-to-aftermath transition, and retail choice between those
completion variants are still unknown. The row therefore has
`documentedTargets`/`documentedSceneFlow` only—no runnable `targets` or
director—and remains unavailable.

### Brd0j6 held contract — Requiem for the Fallen

The Bard finale has five exact enemy identities, but actor types are not spawn
counts:

| Enemy | Actor / display | Level | Local profile status |
| --- | --- | ---:| --- |
| Yotoli Hueloc the Austere | `2206413 / 3206413` | 55 | Mob `3117`, CNJ, skill list `14`; spell list unassigned |
| Ixali sabreur | `2206414 / 3206414` | 53 | No profile |
| Ixali strongbeak | `2206415 / 3206415` | 53 | No profile |
| Ixali bravewing | `2206416 / 3206416` | 53 | No profile |
| Ixali fogcaller | `2206417 / 3206417` | 53 | No profile or spells |

The journal says only “an Ixali war band,” so it proves none of the copy
counts, formation, wave order, or whether Yotoli begins with the other types.
Yotoli's exact current skill binding carries Sonorous Blast, Terrene Blast,
Remembrance, Chthonic Call, Blaster, and Aerial Blast variants, but does not
recover his missing CNJ spell behavior.

Marker `11225501` is `(475.200012, 608.080017)` in zone `143`, map area
`102/201`, beyond Griffin Crossing, with an eight-person cap. It supplies no
entry actor, Y, rotation, or private transform. Jehantel `1060039` is a giver,
guide, and scene participant—not a proven combat ally. Cutscene actor `1001964`
shares the sabreur display but is distinct from combat actor `2206414` and is
explicitly excluded from the target roster. `processEvent_010` owns
`brd0j610`; eventual content clear must call `processEventClear(8032705)` for
Battle Voice and Choral Shirt. Empty `QuestDirectorBrd0j601` contributes no
clear, retry, cleanup, or automatic handoff, so the row remains hidden.

### Drg0j1 held contract — Eye of the Dragon

The Dragoon unlock's route and four-enemy roster are exact:

```text
Haurtefert 1000569 / processEventStart / processEventStartAfter
  -> Alberic 1002001 / marker 11226001
       processEventAlberic / processEventAlbericAfter
  -> near Camp Nine Ivies / four people total
       marker 11226002: X 1483.930054 / Z -895.229980
       Crabfisher 2204511 / display 3204512 ×3 / level 33
       Ironshell 2207612 / display 3207612 ×1 / level 35
  -> processEventNQ / drg0j110
  -> Alberic / marker 11226003
       processEventClear / processEventKokuti(3020410)
       Soul 2000204 / Keeper's Hymn / Jump 27266
```

Neither exact enemy actor has a server mob profile. Piranha/Orobon skill list
`5044` and Crab/Megalocrab list `5038` are family analogues only. The source
also does not prove whether all four actors are simultaneous. Marker
`11226002` has no entry actor, Y, or rotation, and empty
`QuestDirectorDrg0j101` has no failure/retry/cleanup state. Estinien appears
only in `drg0j110`; the journal says the confrontation ends without another
fight, so he is neither an enemy nor ally. The template now separates the
automatic NQ aftermath from Alberic's later clear/reward interaction.

### Whm0j1 held contract — Seeds of Initiative

The White Mage unlock route contains an exact four-enemy roster:

```text
Soileine 1000234 / processEventStart
  -> Raya-O-Senna 1001570
       marker 11222001 / processEventRayao
  -> Mun-Tuy Cellars
       marker 11222002: X -1008.960022 / Z -2091.479980
       server zone 157 / map region 103 / area 311
       Diremite Straggler 2201115 / display 3201122 ×1
       Miteling Straggler 2201114 / display 3201121 ×3
       four people total
  -> Raya-O-Senna / marker 11222003
       processEventClear / processEventClearNQ / whm0j110
       processEventJob(3020410) / processEventKokuti
       Soul 2000206 / Presence of Mind 27344
```

Pukni Pakk `1001937` and Kupcha Kupa `1001938` have three recovered dialogue
variants apiece and appear as `whm0j110` cutscene surfaces; they are not proven
combat allies. Neither straggler actor has an exact server mob profile. Several
diremite-family skill lists exist, but none binds to `2201114` or `2201115`,
so even their action set cannot be selected authoritatively. The source proves
one adult and three young, not their formation or whether content phases them.

Marker `11222002` has only X/Z and placeholder display `4000257`; Raya and the
two moogles also lack active public spawns. The existing route launcher would
therefore start the fight at Raya's cave instead of Mun-Tuy. Finally, dummy
objective item Nirvana `11000551` is named in the journal, but its grant,
variable, or journal transition is not recovered. The row records all of these
facts plus the complete reward presentation while withholding runnable targets
and a director.

### Whm0j4 held contract — The Wheel of Disaster

The exact boundary is an eight-person trip south of Camp Bearded Rock, Lower
La Noscea, to defeat or free a bandit and his minions. Marker `11222301` is
`(222.649994, 441.820007)` in server zone `128`, map `101/101`; marker
`11222302` returns to Raya-O-Senna at `(-1540.979980, -1588.339966)`.
After combat Oha-Sok leaves, `processEventNQ` plays `whm0j410`, and the player
must return to Raya for `processEventClear` and Holy `27359`.

Four plausible bandit actor classes exist together in the recovered roster:
butcher `2289031`, lancer `2289032`, grappler `2289033`, and archer `2289034`.
They are not explicitly joined to quest `111244`; none has a mob profile,
skills, count, wave, level, or spawn transform. They are therefore stored under
`documentedUnboundCandidates`, never `documentedTargets`. Oha-Sok is narrative
presence rather than a proven battle ally. The two linkpearl methods
`processEventLS`/`LS2` also lack sequence ownership, and empty
`QuestDirectorWhm0j401` supplies no missing combat lifecycle. The completion
hook now correctly leaves automatic `processEventNQ` out of Raya's later
reward interaction.

### Whm0j6 held contract — The Chorus of Cataclysm

This audit removed a misleading one-target preparation. The exact known pairs
are Icebound Wrath `2204707/3055` and Earthbound Wrath `2204907/3020`, but the
quest evidence associates Earthbound, Firebound, Icebound, Lightning-bound,
Water-bound, and Wind-bound Wraths with the encounter and recommends eight
people total. It does not prove each family's actor/profile pair, multiplicity,
wave order, respawn behavior, or final kill condition.

`processEventCutSceneBeforeBattle` still owns `whm0j605`; `processEventNQ` and
`NQ03` own the `whm0j610` aftermath variants, followed by Healer's Robe
`8032706` and Benediction `27345` presentation. The marker `11222501`, public
Raya-O-Senna spawn, original content entry/return transform, and after-warp
owner are not implemented. Consequently the hidden row has only
`documentedTargets`/`documentedFamilies`; the former
`QuestDirectorJobWhm0j6.lua` one-Icebound shell has been removed.
