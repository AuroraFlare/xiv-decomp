# Hamlet Defense Point Rules

This is the recovered Hamlet Defense result-line catalog. `Text ID` and `Points` come from the locally mined retail client sheets `docs/Dat Mining/xtx_hamletDefScore.csv` and `docs/Dat Mining/hamletDefScore.csv`; those client-authored values take precedence when community wiki tables disagree. Placeholder labels use the client's `<PlaceHolder/>` token and should be formatted at result-display time.

Implementation status:

- `Scored`: currently evaluated by `HamletDefenseDirector`.
- `Cataloged`: preserved in data, but waiting on party, equipment, crafting, gathering, or missing-duty hooks.
- `Partial`: some supporting counters exist, but the exact retail trigger needs more packet/script recovery.

| Text ID | Result Line | Points | Status | Notes |
| --- | --- | ---: | --- | --- |
| 10001 | Balanced Party Utilized | 50 | Scored | Battle-start snapshot has War, Magic, Land, and Hand present. |
| 10002 | Eight Classes Represented | 30 | Scored | Eight distinct base classes at battle start. |
| 10003 | Only Disciples of War and Magic Present | 250 | Scored | Full party contains both combat disciplines and no Hand/Land members. |
| 10004 | Only Disciples of War Present | 500 | Scored | Full party contains only War members. |
| 10005 | Only Disciples of Magic Present | 500 | Scored | Full party contains only Magic members. |
| 10006 | Only Disciples of the Land and the Hand Present | 250 | Scored | Full party contains both non-combat disciplines and no War/Magic members. |
| 10007 | Only Disciples of the Land Present | 500 | Scored | Full party contains only Land members. |
| 10008 | All Three Disciples of the Land Present | 100 | Scored | Miner, botanist, and fisher are present in the full-party snapshot. |
| 10009 | Only Disciples of the Hand Present | 500 | Scored | Full party contains only Hand members. |
| 10010 | All Eight Disciples of the Hand Present | 100 | Scored | All eight crafting classes are present in the full-party snapshot. |
| 10011 | Job Crystals Equipped: 8 | 10 | Scored | All eight battle-start members have a job crystal selected. |
| 10012 | Job Crystals Equipped: 0 | 10 | Scored | No battle-start member has a job crystal selected. |
| 10013 | Same Profession Selected by All Members | 500 | Scored | All eight battle-start members share one base class. |
| 10017 | Disciples of the Land Present: <PlaceHolder/> | 100 each | Scored | Per Land member in the battle-start snapshot. |
| 10018 | Disciples of the Hand Present: <PlaceHolder/> | 100 each | Scored | Per Hand member in the battle-start snapshot. |
| 10022 | Provisioner Present | 3000 | Scored | At least one battle-start member is in the persisted current-cycle top 20. |
| 11001 | Party Members Using Weapons Level 40 and Below: <PlaceHolder/> | 10 each | Cataloged | Requires equipped weapon level checks. |
| 11002 | Party Members Using Weapons Level 30 and Below: <PlaceHolder/> | 20 each | Cataloged | Requires equipped weapon level checks. |
| 11003 | Party Members Using Weapons Level 20 and Below: <PlaceHolder/> | 40 each | Cataloged | Requires equipped weapon level checks. |
| 11004 | Party Members Using Weapons Level 10 and Below: <PlaceHolder/> | 80 each | Cataloged | Requires equipped weapon level checks. |
| 11005 | Party Members Using Damaged Weapons: <PlaceHolder/> | 100 each | Cataloged | Requires durability/condition checks. |
| 12001 | Beastmen Soldiers Dispatched: <PlaceHolder/> | 10 each | Scored | Counts normal non-caster, non-leader beastmen. |
| 12002 | Beastmen Casters Dispatched: <PlaceHolder/> | 10 each | Scored | Counts normal caster beastmen. |
| 12003 | Total Beastmen Dispatched: <PlaceHolder/> | 10 each | Scored | Counts all normal beastmen slain. |
| 12004 | All Melee Units Dispatched | 1000 | Scored | All normal melee units defeated. |
| 12005 | All Magic Units Dispatched | 1000 | Scored | All normal caster units defeated. |
| 12006 | No Beastmen Survivors | 2000 | Scored | All normal beastmen defeated. |
| 12007 | Rank 1 Beastman Leader Slain | 500 | Scored | Selected from the battle's persisted supply-cycle rating. |
| 12008 | Rank 2 Beastman Leader Slain | 3000 | Scored | Selected from the battle's persisted supply-cycle rating. |
| 12012 | All Beastmen Defeated Before Leader Arrival | 500 | Scored | Approximation based on live wave state when leader wave spawns. |
| 12013 | Stray Fauna Defeated | 1500 | Scored | Frightened Crab, Lemur, or Cactuar. |
| 12014 | Beast of Burden Defeated | 1500 | Scored | Synthetic Bomb, Scout Wolf, or Battle Drake. |
| 12015 | Errant Soul Defeated | 5000 | Scored | Dedicated actor spawns only after all non-leader beastmen die and both earlier unique foes are killed by militia archers. Exact retail timing remains approximate. |
| 12016 | All Non-beastmen Foes Defeated | 1000 | Scored | Granted when all three special categories are defeated. |
| 13001 | No Humour Pots Dropped | 100 | Cataloged | Requires destructible/dropped pot tracking. |
| 13002 | All Methods of the Warden's Justice Inflicted | 150 | Scored | Attack down, HP down, sleep, and order/enmity reset all used. |
| 13003 | Times Warden's Justice Inflicted: <PlaceHolder/> | 10 each | Scored | Each completed three-pot sequence. |
| 13004 | Times Enemy Attack Lowered: <PlaceHolder/> | 30 each | Scored | Red/red/red pot result. |
| 13005 | Times Enemy HP Lowered: <PlaceHolder/> | 30 each | Scored | Blue/blue/blue pot result. |
| 13006 | Times Alchemic Sleep Induced: <PlaceHolder/> | 30 each | Scored | Green/green/green pot result. |
| 13007 | All Methods of Justice Inflicted Simultaneously | 100 | Partial | Current score grants when all Warden's Justice methods are used in one run. |
| 14001 | All Methods of Disorientation Applied | 150 | Scored | Militia defense/evasion, attack, and regen support used. |
| 14002 | Instruments of Warfare Deployed: <PlaceHolder/> | 10 each | Scored | Each DoH support instrument. |
| 14003 | Times Militia Defense and Evasion Increased: <PlaceHolder/> | 30 each | Scored | Reinforced instrument. |
| 14004 | Times Militia Attack Power Increased: <PlaceHolder/> | 30 each | Scored | Spiked instrument. |
| 14005 | Times Regen Granted: <PlaceHolder/> | 30 each | Scored | Blessed instrument. |
| 14006 | All Varieties of Instruments Deployed Simultaneously | 100 | Partial | Current score grants when all instrument varieties and order reset are used in one run. |
| 15001 | No Humour Pots Dropped or Instruments of Warfare Destroyed | 100 | Cataloged | Requires destructible support-object tracking. |
| 15002 | All Orders from Enemy Leader Prevented | 300 | Scored | All issued leader orders were prevented. |
| 15003 | Orders from Enemy Leader Prevented: <PlaceHolder/> | 30 each | Scored | Musked/rainbow support counter. |
| 16001 | Militia Survivors: <PlaceHolder/> | 100 each | Scored | Remaining militia NPCs. |
| 16002 | No Militia Casualties | 1500 | Scored | All militia NPCs survive. |
| 16003 | No Militia Survivors | 500 | Scored | All militia NPCs defeated. |
| 16004 | Front Line Unbreached | 1500 | Scored | Front-line militia survives. |
| 16005 | Second Line Unbreached | 500 | Scored | Second-line militia survives. |
| 16006 | Third Line Unbreached | 100 | Scored | Third-line militia survives. |
| 16007 | All Lines of Defense Intact | 500 | Scored | All tracked defense lines survive. |
| 16008 | Supply Carts Remaining: <PlaceHolder/> | 500 each | Scored | Remaining supply carts. |
| 16009 | All Supply Carts Intact | 1500 | Scored | All supply carts survive. |
| 17001 | Only Enemy Leader Defeated | 1000 | Scored | Leader defeated with no other normal beastmen casualties. |
| 17002 | No Beastman Casualties | 1000 | Scored | Victory with no normal beastmen slain. |
| 17003 | No Beastmen Soldier Casualties | 250 | Scored | Victory with no melee beastmen slain. |
| 17004 | No Beastmen Caster Casualties | 250 | Scored | Victory with no caster beastmen slain. |
| 18001 | Beastmen Taken Captive: <PlaceHolder/> | 30 each | Scored | Live normal beastmen after victory. |
| 18011 | Times KO'd: 0 | 500 | Scored | Player death events mark the run ineligible for the no-KO result. |
| 19002 | Troops Rallied | 100 | Cataloged | Requires rally/emote or NPC encouragement hook. |
| 19003 | Enemies Goaded | 100 | Cataloged | Requires goad/emote or enemy taunt hook. |
| 19004 | Reckless Gathering Employed | 10 | Cataloged | Requires gathering action tracking. |
| 19005 | Reckless Crafting Employed | 100 | Cataloged | Requires crafting action tracking. |
| 19006 | Freeloading Gatherer Present | 10 | Cataloged | Requires participation tracking by role. |
| 19007 | Freeloading Crafter Present | 10 | Cataloged | Requires participation tracking by role. |
| 19008 | Materia Melded | 10 | Cataloged | Requires materia meld event tracking inside duty. |
| 19011 | Deserter Discovered | 10 | Cataloged | Requires duty-leave detection. |
| 19012 | Aetherial Deserter Discovered | 10 | Cataloged | Requires teleport/warp-out detection. |
| 19013 | One or More Members Missing in Action | 10 | Cataloged | Requires party member presence tracking at duty end. |

Current special foe mapping:

| Hamlet | Stray Fauna | Beast of Burden | Errant Soul |
| --- | --- | --- | --- |
| Aleport | Frightened Crab | Synthetic Bomb | Errant Soul (`2104301`) |
| Hyrstmill | Frightened Lemur | Scout Wolf | Errant Soul (`2104301`) |
| The Golden Bazaar | Frightened Cactuar | Battle Drake | Errant Soul (`2104301`) |

Official Forum Score Thread Observations:

- Multiple players confirm high scores require DoL/DoH support and usually the `Provisioner Present` bonus. One early estimate placed the practical ceiling around 36,000-40,000, while later level-2 reports reached roughly 48,000, 50,000, and 60,000.
- A level-2 battle was described as doubling the score relative to level 1, and the [archived eLeMeN Hamlet Defense page](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/etc/HamletDefenseBattles.html) independently states that rank 2 applies a x2 stockpile-rank correction. The server now applies it to the final score used for result totals and chest selection; the stock client's own supply-rating presentation behavior still needs a live packet capture.
- `Provisioner Present` is called out by players as 3,000 points.
- `Rank 1 Beastman Leader Slain` is called out as 500 points, while `Rank 2 Beastman Leader Slain` is called out as 3,000 points.
- Holding the leader until all waves are over grants `All Melee Units Dispatched`, `All Magic Units Dispatched`, and `No Beastmen Survivors`, confirmed by players as a combined 3,000 points.
- `Errant Soul Defeated` is described as 5,000 points, with an extra 1,000 points when the other special non-beastmen are also killed.
- The Errant Soul appears to be an undead mage type and was reported around 10 minutes remaining. The current framework begins checking eligibility at 20 minutes elapsed in a 30-minute duty.
- A later player report claims the final extra mob spawns when the unusual foes are killed by NPC archers, not by players or Warden's Justice poison. Death-source tracking now enforces an archer gate for the stray-fauna and beast-of-burden actors; the exact retail target identity still needs capture validation.
- Reward observations from the thread are noisy: players report 30 anima on many wins, 15 anima on at least one lower-scoring level-2 win, mostly dark matter from chests, and militia gear/accessory/tool rewards appearing more consistently from the captain for top-20 provisioners.
