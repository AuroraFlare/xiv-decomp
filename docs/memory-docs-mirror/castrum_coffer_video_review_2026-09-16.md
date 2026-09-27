# Castrum Novum coffer video review — 2026-09-16

This follow-up searched YouTube for original 1.x Castrum footage, inspected
selected video frames and descriptions, and re-read all three pages of the
contemporary coffer discussion. It did **not** recover Silver's reward table.
The research itself did not justify new item associations. The user's subsequent
authorization to estimate probabilities is implemented below in main SQL.

## Reward evidence

| Coffer | Supported item | Evidence and limit |
| --- | --- | --- |
| Gold | Imperial Operative Dalmatica (`8032829`) | [Raveheart's 1.23b Gold run](https://www.youtube.com/watch?v=HSzTBI0Nwbo): the uploader reports receiving a dalmatica in this run. The title identifies Gold. This is a participant report, not a newly verified chest-opening receipt. |
| Gold | Garlean Fiber (`10011250`) | [June 11, 2012, post #5](https://forum.square-enix.com/ffxiv/threads/47541-garlean-rubber-castrum-novum-coffer-keys?p=721170&viewfull=1#post721170) explicitly separates Rubber from the robot and Fiber from the chest opened with its Gold key. The same report's level 61 claim conflicts with the later tier evidence; preserve that discrepancy. |
| Copper | Garlean Fiber (`10011250`) | [June 17, 2012, post #18](https://forum.square-enix.com/ffxiv/threads/47541-garlean-rubber-castrum-novum-coffer-keys/page2) explicitly reports Copper coffer Fiber. The poster's proposed equipment distribution is speculation, not a recovered table. |
| Unspecified Castrum coffer | Garlean Rubber | [June 16, 2012, post #11](https://forum.square-enix.com/ffxiv/threads/47541-garlean-rubber-castrum-novum-coffer-keys?p=727279&viewfull=1#post727279) says the robot supplied a key and the chest supplied Rubber, but gives no key color. Do not assign this report to Silver or all three tiers. |
| Silver | No verified item | None of the reviewed evidence identifies an item with a Silver opening. |

The reports do not recover complete pools, quantities, probabilities, guaranteed
rewards or simultaneous material/equipment behavior. Silver's candidate position
stays disabled pending a supported reward. The former Gold Dalmatica-only
placeholder is superseded by the user-authorized estimate below.

## Implemented rate estimate

The user explicitly authorized estimated drop rates after the evidence review.
`Data/sql/server_open_world_coffers.sql` now supplies:

| Coffer | Roll per opening | Basis |
| --- | --- | --- |
| Copper | One Garlean Fiber, 100% | Only tier-specific supported reward; retain the existing material guarantee rather than introduce an unsupported empty or additional-item result. |
| Gold | One Garlean Fiber, 85%, **or** one Imperial Operative Dalmatica, 15% | Make the reported material common and equipment uncommon. Fifteen percent approximates the project's existing authored one-in-six ordinary Dzemael coffer equipment chance. Shposhae's equal-weight main pools also put individual equipment entries near 12.5–16.7%. Neither comparator is a measured Castrum rate. |
| Silver | Inactive | Unknown item identities cannot be supplied by estimating rates. |

The single-item exclusive model and quantity one are authored choices. Both
Gold rows use `lootGroup=1`, `chance=1` and weights 85/15: setting `chance=.15`
on the equipment row as well would incorrectly apply a second probability gate.
The existing manager filters unique-ownership-ineligible items before weighting;
15% is conditional on both rewards being eligible. Existing capacity and key
checks remain in force. No new gil, Rubber tier, key rate, placement, refill or
other stronghold change is included.

The main seed's existing Castrum loot deletion removes the obsolete disabled
group-zero Fiber row on reimport, then installs this complete pool. No separate
live migration is needed. This pass does not import the live database.

## YouTube inspection record

Searches used the YouTube UI with `ffxiv 1.0 castrum novum chest` and
`カストルム ノヴム 宝箱`. Modern ARR results, story introductions and private
United We Stand footage cannot establish public coffer loot.

- [Raveheart — HSzTBI0Nwbo](https://www.youtube.com/watch?v=HSzTBI0Nwbo):
  inspected 6:39, 7:36, 8:33, 9:13 and 9:23. At 6:39 the loot text includes
  a Gold Castrum coffer key and a Garlean steel joint after combat. The later
  samples show regrouping/combat around fortress walls. No chest-opening
  reward receipt was recovered from these samples. The description supplies
  the Dalmatica report above; key/robot loot must not become chest loot.
- [Mike — dgss7FT5KHw](https://www.youtube.com/watch?v=dgss7FT5KHw):
  description identifies the public approach to the United We Stand entrance
  and says the private fight is in a separate video. The 24:00 sample shows
  combat/experience feedback, not a coffer reward. Only sampled, not fully watched.
- [Ryligh Kell — z4sD0QEpAtI](https://www.youtube.com/watch?v=z4sD0QEpAtI):
  69-minute Castrum/United We Stand recording. The 6:54 sample shows a
  Centurion combat/experience log; 13:48 is cinematic footage. YouTube supplied
  no transcript. This limited inspection did not recover a chest receipt and
  does not establish that none exists elsewhere in the recording.
- [NyagerP — VJ4Cc8cZW_8](https://www.youtube.com/watch?v=VJ4Cc8cZW_8):
  42-second Japanese fortress clip; the 0:21 sample is cinematic Magitek footage,
  not loot evidence.
- [Speakers Network — vILPKP2ifNk](https://www.youtube.com/watch?v=vILPKP2ifNk):
  historical overview. Its available transcript supplied no chest/drop-table
  lead. This is retrospective commentary, not an original opening receipt.

Future useful evidence is a readable receipt after a known-color opening,
especially Silver, or a contemporary participant explicitly linking a named
item to that tier. The available evidence supports retaining the existing
uncertainties, not filling Silver from adjacent key tiers or ARR item sources.
