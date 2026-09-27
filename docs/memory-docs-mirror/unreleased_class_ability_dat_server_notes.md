# FFXIV 1.0 Unreleased Class Ability Notes

This note documents how to expose or repurpose unused/player/enemy abilities for the
1.0 unreleased class ideas, and which side of the project needs to change.

## Short Answer

Most custom class work needs both sides:

| Goal | Client DAT change | Server change |
| --- | --- | --- |
| Change an action icon | Yes | No |
| Change action name/tooltip | Yes | No |
| Change class/level/category shown by the client | Yes | No, unless server gates also need changing |
| Make an action actually execute | Maybe | Yes |
| Change damage, status, target rules, cooldown, cost | No | Yes |
| Change or clone the command/action id | Yes | Yes |
| Reuse an enemy action as a player action | Yes | Yes |

The command id is the handshake. If the client sends command `23246`, the server
must know command `23246`. If a custom action is cloned to `31001`, both the DAT
command row and `server_battle_commands.sql` need to agree on `31001`.

## Where Things Live

### Client DAT / command sheet

The DAT command row controls presentation and client-side metadata:

- command id
- action name
- short name
- tooltip/description
- action category
- icon id
- displayed class/job id
- displayed level
- whether the row looks like a normal player action, enemy action, trait, etc.

In the extracted CSVs, the useful sources are:

- `AI Scripts/command.csv`
- `docs/Dat Mining/xtx_command.csv`

In `AI Scripts/command.csv`, the icon id appears as the observed column `37`.
For example:

| Command | Name | Current icon |
| ---: | --- | ---: |
| `26518` | `.Steal` | `30018` |
| `26514` | `Blindside` | `30019` |
| `29873` | `Stealth` | `30464` |
| `23246` | `Shadow Sickle` | `30000` |
| `23355` | `Shadow Burst` | `30000` |

Enemy actions often use `30000`, which is effectively the generic/not-useful
action icon. These can be repointed to normal action icons in a DAT mod.

### Server SQL

`Data/sql/server_battle_commands.sql` controls whether the action works and what
it does:

- accepted command id
- class/job requirement
- level requirement
- target rules
- range/AOE/cone
- potency and hit count
- cast time, recast time, MP/TP cost
- status effects and durations
- animation/VFX fields
- command/action type flags

Changing only the DAT icon will make an action look better, but it will not make
the server accept or resolve the action.

## Enemy Ability Icon Swaps

Enemy actions can be made to show real icons by changing the DAT command row icon
id. This does not require a server change unless the action is also being made
usable by players.

Good icon swaps:

| Enemy action | Current icon | Suggested action icon |
| --- | ---: | ---: |
| `23246` Shadow Sickle | `30000` | `30196` Shadowsear or `30170` Scourge |
| `23259` Blinding Burst | `30000` | `30181` Blind or `30036` Disorient |
| `23355` Shadow Burst | `30000` | `30196` Shadowsear or `30531` Burst |
| `23343` Poison Breath | `30000` | `30180` Poison |
| `23255` Hypha Whip | `30000` | `30122` Shadowbind or `30109` Trammel |
| `23224` Magitek Cannon | `30000` | `30202` Light Shot or `30127` Quick Nock |
| `23540` Mistral Song | `30000` | `30491` Swiftsong or `30514` Battle Voice |

Macro icons may be usable if they are in a compatible icon bank/path for action
icons, but normal action icon ids are the safer first choice.

## Recommended Workflow

1. Pick the ability fantasy and donor command.
2. Decide whether to reuse the original command id or clone it to a custom id.
3. Patch the DAT command row:
   - name
   - description
   - icon id
   - category
   - class/job id
   - level
4. Add or adjust the matching server command row:
   - same command id as the DAT row
   - player-safe target rules
   - player-safe class/level gates
   - player-safe animation/VFX donor
   - actual effect behavior
5. Test in client:
   - action list/hotbar display
   - tooltip
   - icon
   - command execution
   - animation/VFX
   - status/damage behavior

## Unreleased Class Anchors

Some unreleased classes have only a basic attack or shell row. Others have no
direct player command rows and need donor kits.

| Class idea | Direct command anchors found | Notes |
| --- | --- | --- |
| Fencer | `22106` rapier basic attack | Name is `***`, icon `30000`; description says rapier/piercing |
| Enforcer | `22107` Bludgeon | Club basic attack; icon `30000` |
| Musketeer | `22110` Discharge | Gun basic attack; icon `30000` |
| Sentinel | `22111` Guard, `22112` Block, shield actions | This is the most complete unreleased/side class kit |
| Arcanist | `22308` Create Distaff, `22309` Animate Distaff | Direct arcane-distaff anchors exist, icons `30000` |
| Samurai | none direct | Needs sword/slash donor kit |
| Stavesman | none direct | Needs blunt/staff donor kit |
| Assassin | none direct | Needs thief/poison/shadow donor kit |
| Flayer | none direct | Needs whip/lash/bind donor kit |
| Mystic | none direct | Needs Scourge/Banish/Bio/Dia/shadow donor kit |
| Bard/Musical | none direct for class `25` | Use Bard/Archer/song donors |
| Shepherd | none direct | Use animal/enmity/utility donor ideas |

## Donor Kit Ideas

### Fencer / Red Mage

Use a rapier basic attack plus sword and magic donors:

- `22106` rapier basic attack
- `26792` Red Lotus
- `26809` Luminous Spire
- `26814` Riot Blade
- `26817` Stroke of Time
- `28597` Banish
- `28602` Bio
- `27346` Cure
- enemy: `23121` Quickchant
- enemy: `23127` Dark Cloud

### Assassin / Thief

Use unused Pugilist thief-like actions plus poison/shadow:

- `26518` Steal
- `26519` Steal II
- `29873-29876` Stealth I-IV
- `26514` Blindside
- `26612` Victimize
- `26634` Pounce
- `22113` Throw
- `27415` Quickstride
- `28618` Poison
- enemy: `23246` Shadow Sickle
- enemy: `23259` Blinding Burst
- enemy: `23355` Shadow Burst

Steal has proper client text/icon, but the actual "steal a random item" behavior
still needs server-side loot-table logic.

### Musketeer

Use the gun basic attack plus ranged and cannon donors:

- `22110` Discharge
- `22108` Light Shot
- `27527` Quick Nock
- `27536` Bloodletter
- `27534` Foeseeker
- `27427` Farshot
- enemy: `23224` Magitek Cannon
- enemy: `23566` Drill Cannon
- enemy: `23420` Moogle Eye Shot

### Sentinel

Use the shield class rows and Gladiator tank donors:

- `22111` Guard
- `22112` Block
- `27942` Aegis Boon
- `27945` Outmaneuver
- `27948` War Drum
- `27951` Deflection
- `28052` Shield Bash
- `26682` Rampart
- enemy: `23223` Imperial Guard
- enemy: `23133` Claw Guard

### Samurai

No direct command rows were found for class `11`; use sword/slash donors:

- `22103` Light Slash
- `26802` Spinstroke
- `26805` Onion Cut
- `26814` Riot Blade
- `27697` Moonrise
- `26992` Maim
- `26995` Storm's Path
- enemy: `23217` Deft Slash
- enemy: `23010` Somersault Slash
- enemy: `23246` Shadow Sickle

### Stavesman

No direct command rows were found for class `12`; use blunt/staff-like donors:

- `26615` Concussive Blow
- `26624` Jarring Strike
- `26628` Aura Pulse
- `26618` Haymaker
- `26982` Fracture
- `22302` Phantom Dart
- enemy: `23230` Stone's Throw
- enemy: `23045` Booming Bellow

### Enforcer

Use the club basic attack plus control and blunt donors:

- `22107` Bludgeon
- `26982` Fracture
- `26865` Disorient
- `26879` Murderous Intent
- `26624` Jarring Strike
- `26615` Concussive Blow
- enemy: `23052` Gravel Burst
- enemy: `23230` Stone's Throw

### Flayer

No direct command rows were found for class `14`; use bind/lash donors:

- `27515` Shadowbind
- `27695` Trammel
- `27715` Twisting Vice
- `28634` Bind
- `28638` Paralyze
- enemy: `23096` Tail Whip
- enemy: `23141` Vertical Lash
- enemy: `23255` Hypha Whip
- enemy: `23283` Sweeping Lash
- enemy: `23038` Binding Tendrils

### Mystic

No direct command rows were found for class `21`; use old Thaumaturge mystic
magic:

- `28592` Scourge
- `28597` Banish
- `28602` Bio
- `28606` Dia
- `28622` Shadowsear
- `28642` Mass Fear
- `28562` Flashfreeze
- enemy: `23127` Dark Cloud
- enemy: `23355` Shadow Burst
- enemy: `23259` Blinding Burst

### Arcanist

Use the direct distaff rows plus arcane/status magic donors:

- `22308` Create Distaff
- `22309` Animate Distaff
- `22304` Magic Missile
- `28602` Bio
- `28618` Poison
- `28634` Bind
- `28636` Silence
- `29007` Sleep
- enemy: `23343` Poison Breath
- enemy: `23251` Slumber Cloud

### Bard / Musical

No direct class `25` command rows were found; use Bard/Archer/song donors:

- `27226` Swiftsong
- `27227` Battle Voice
- `27536` Bloodletter
- `27234` Gloom Arrow
- `27515` Shadowbind
- enemy: `23540` Mistral Song
- enemy: `23568` Mistral Song
- enemy: `23190` Woodland Lullaby

### Shepherd

No direct class `42` command rows were found. Treat this as a utility/animal
handling fantasy:

- `29873` Stealth
- `29869` Cloudkin Eluder
- other eluder actions by monster family
- enemy: `23090` Bleat
- enemy: `23091` Head Butt
- enemy: `23078` Stampede
- enemy: `23143` Threatening Growl

## Practical Rule

For a polished custom player action:

- use DAT patches for the action list, name, tooltip, icon, class display, and
  client category;
- use server SQL/code for behavior;
- keep command ids synchronized;
- prefer player-safe animation/VFX donors over raw enemy-only animation data;
- use normal action icon ids before trying macro icons.
