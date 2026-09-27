# Thornmarch aftermath: coffer, rewards and Fretful Moogle

This offline implementation replaces the immediate-clear reward shortcut with
private interactable clear objects and the recovered native exit conversation.
It has not been deployed or accepted in a live client.

## Evidence and reconstruction boundaries

The pinned [A Feast of Fools archive](ffxiv-1.0-wiki/pages/A_Feast_of_Fools.html)
describes the victory chest and Fretful Moogle exit and lists seven Moogle weapons,
Kupo Nut Charm, Grade 5 Dark Matter and Vampire Plant. The earlier reconstruction
also lists Unmarked Keystone in its reward pool. No exact drop probabilities or
five-key consumption rule have been recovered. This pass preserves non-consuming
five-key eligibility and explicitly authors the reward selection below.

The native `Sum6m0.processEventContentExit` function is in
`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/sum/sum6m0.lua`.
It performs Fretful's talk turn/scheduler, scenario text 81, then asks
worldMaster question 52042. Native `NpcBaseClass.delegateEvent` in
`tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua`
passes the player and actual NPC to that function. The helper uses this native
function through the existing `delegateEvent` client bridge and checks its
Yes/No result. It does not complete a quest or grant a reward from the callback.

The [native coffer report](garuda-moogle-coffer-animation-decomp-2026-08-02/GIANT_COFFER_CLIENT_AND_OPENING_FINDINGS.md)
and [Moogle report](garuda-moogle-coffer-animation-decomp-2026-08-02/MOOGLE_CLIENT_AND_BATTLEFIELD_FINDINGS.md)
do not establish the exact Thornmarch coffer model. The runtime uses actor
1200160, a native b923/e002 coffer donor, with `InstanceRaidTreasureBox` behavior.
It reuses the existing generic coffer opening helper (bank 0001). Actor 1001838
supplies the native West Shroud Fretful Moogle appearance and name 2480008; the
arena binding is reconstructed. These appearances, the coffer bank and native
dialogue rendering still require a client test.

Both homes use `MoogleArenaNavigation.GetHome`, whose authoritative manifest is
`Data/raidroutes/thornmarch_navigation.json`. The coffer uses frozen source node
52 at (-2373.136, -22.527235, -895.58514); Fretful uses node 113 at
(-2359.4954, -22.754366, -889.7254). The source is the separate zone-238 recording
under `Data/quicknavmesh-evidence/quicknavmesh-20260924/`, SHA-256
`92b536e917892957540c7a6fd3be0c81daf636c9f93ced021e9f6bb07bc3897f`.
Native page 2399 supplies map calibration. These are exact recorded ground
positions selected for this implementation, not recovered retail actor homes.
Both rotations remain authored zero.

## Reward policy

Main `Data/sql/server_battlenpc_mob_types_loot.sql` owns private lists 950238 and
950239. The optional `Data/sql/live migrations/moogle_aftermath_rewards_20260925.sql`
contains identical removals and rows. Neither pool is attached to mob death.
Apply the main SQL with the normal updater; the optional migration is not needed
to recover the complete intended state.

| Selection | Authored per-person policy |
| --- | --- |
| Kupo Nut Charm | One guaranteed; existing server alias 1000105 for native 10011152 |
| Grade 5 Dark Matter | One, independent 20% |
| Vampire Plant | One, independent 10% |
| Unmarked Keystone | One, independent 10%; distinct from the five entry keys |
| Moogle weapon | One 14% optional roll; each of seven weapons occupies 2% |

The weapon roster is Murderous Mogfists, Morbid Mogblade, Malignant Mogaxe,
Mischievous Mogbow, Melancholy Mogfork, Maleficent Mogstaff and Malevolent Mogwand.
A person can receive at most one weapon from a clear. These odds and the
guaranteed charm are server policy, not statistically recovered retail rates.

`BeginMoogleAftermath` freezes each clear-time director member's character ID,
five-key eligibility and `moogle.test` flag before the encounter clears temporary
flags. GM test clears never select or grant rewards. Opening the coffer attempts
delivery for every eligible original participant currently connected in this
area through the existing `AddGeneratedLootItem` path. Its normal party rewards
enter Loot; the shared API retains its normal solo inventory behavior.

The ledger stores the complete selection before delivery. It removes only
successfully delivered items from the pending list. Full destinations, unavailable
SQL pools and exceptions retain pending items for another coffer interaction;
retries do not reroll or duplicate successful earlier items. Reconnecting the
same original character resolves the canonical current session and Player object.
Disconnected, superseded or unregistered captured sessions cannot receive items.
The ledger is instance-local and does not survive server process restart.

## Ownership and lifetime

The owning director starts one fixed five-minute aftermath deadline and updates
the helper until it reports completion. The five minutes are an authored grace
period; opening, retries and duplicate victory calls never renew it. The director
continues to own quest credit and content cooldowns. The helper owns only the
coffer, Fretful, clear reward claims and return-point departure.

The two actors are configured before area publication. They carry the content
group but are not director talk-event members, so their own native-path scripts
receive interactions. Partial spawn and per-viewer publication errors can retry
without substituting an unowned same-name object. Opening presentation receipts
are tied to Session and actor-table generation. Cleanup closes interaction first,
despawns only exact owned receivers and retains a closed tombstone to prevent a
second reward ledger from a duplicate victory callback.

Every interaction requires the original eligible participant identity, current
canonical connected non-superseded session, current director, exact registered
actor, client visibility, matching event owner, a living player, five-yalm
horizontal range and three-yalm height tolerance. The two distances are authored
interaction limits. Exit repeats these checks after the native Yes/No wait.
Foreign directors cannot close the owned state. Confirmed exit and deadline
expiry use the existing stored content return-point path. A failed return remains
pending; it does not award or reset the duty.

## Offline verification

`tools/moogle-aftermath-tests` links the production reward ledger and runs the
actual Lua dispatch scripts. With a freshly built Map Server DLL, it additionally
tests the production interaction guards using isolated actors and sessions.
The 2026-09-26 run passed **70 checks** against
`.codex-build/moogle-aftermath-final-20260926/map/Map Server.dll` after a successful
build with zero errors and five existing warnings. It covers SQL parity, fixed
and partial selections, concurrent opens, GM/no-key suppression, retry, native
conversation arguments, reconnect/session replacement, actor/director/event
ownership, range/height, expiry and duplicate-clear cleanup.

These checks do not constitute live loot transfer, native rendering, packet-order
or full party acceptance. The live server and database were not changed.
