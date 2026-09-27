# Zone Position Reconstruction Method

This document records the exact method used to recover guildleve encounter positions for a zone, using Broken Water as the first fully worked example.

The goal is to preserve:

- the false starts
- the math that finally worked
- the exact data rows that mattered
- the manual validation loop
- a small Python script that reproduces the horizontal conversion

This is written so future work on another camp can follow the same playbook without having to reconstruct our conversation.

## Scope

This method currently works best for **guildleve encounter reconstruction**.

At the time of writing:

- guildleve `X/Z` cluster recovery is in good shape
- guildleve `Y` still needs in-game correction
- Behest encounter positioning is still weaker because the local archival data is weaker

For the validated output and current to-do list, also see:

- [behest_guildleve_seed_notes.md](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/behest_guildleve_seed_notes.md:85>)
- [position_reconstruction_todo.md](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/position_reconstruction_todo.md:1>)
- [server_guildleve_position_seed.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_guildleve_position_seed.sql:1>)

## Data Sources Used

Primary sources:

- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:100>)
- [2Dmap_marker.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/2Dmap_marker.csv:116>)
- [server_eventnpc_spawn_locations.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_eventnpc_spawn_locations.sql:752>)
- [gamedata_guildleves.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/gamedata_guildleves.sql:58>)
- [guildleve.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/guildleve.csv:14>)
- [xtx_guildleve.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/xtx_guildleve.csv:18>)

What each source contributed:

- `mapNavi_data.csv`
  - the actual navigation region blocks
  - the region base values
  - the candidate objective-point rows
- `2Dmap_marker.csv`
  - supporting marker-family context
  - useful for grouping related markers, but not enough on its own for world conversion
- `server_eventnpc_spawn_locations.sql`
  - hard world-space anchors that let us verify the conversion
- `gamedata_guildleves.sql`, `guildleve.csv`, `xtx_guildleve.csv`
  - which leves and mobs likely belong to the recovered encounter clusters

## The First Wrong Attempt

The first idea was to use `2Dmap_marker.csv` directly and try to derive world coordinates by simple scaling or affine conversion.

That failed.

Why it failed:

- some rows are UI-style map markers, not encounter centers
- the marker space is not a clean 1:1 world-space projection
- candidate outputs landed in water, inside terrain, or far enough off that the method was clearly wrong

This was useful because it told us the problem was not just bad altitude; the **horizontal source itself was wrong**.

## The Breakthrough

The real breakthrough was noticing that `mapNavi_data.csv` contains **region blocks** and **navigation rows** that line up with known world anchors.

The working horizontal conversion for a row inside a region block is:

- `worldX = navX - regionBaseX`
- `worldZ = navY - regionBaseY`

Where:

- `regionBaseX` and `regionBaseY` come from the region block row
- `navX` and `navY` come from the candidate row in the same block

This recovered the right horizontal positions for known gates and aetherytes, which gave us confidence to use the same conversion for nearby encounter rows.

## Broken Water Worked Example

Broken Water is zone `174`, and it became the first fully validated example.

### 1. Find The Region Base

Relevant `mapNavi_data.csv` rows:

- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:100>)
- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:120>)
- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:140>)
- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:150>)

For the Broken Water block, the repeated region base is:

- `regionBaseX = 2687`
- `regionBaseY = 3072`

Example region row:

```text
1500,104,405,0,2687,3072,...,4373,4067,...
```

The important part was not every column name, but that the row family repeated the same region base and grouped related marker/objective rows.

### 2. Verify The Math Against Known Anchors

We used rows tied to known eventnpc positions first.

Example:

```text
1520,104,405,20,2687,3072,...,4484,4928,3027
```

Apply the formula:

- `worldX = 4484 - 2687 = 1797`
- `worldZ = 4928 - 3072 = 1856`

That matches the known world anchor in [server_eventnpc_spawn_locations.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_eventnpc_spawn_locations.sql:767>):

```text
redlabyrinth_aetherytegate -> (1797, 249, 1856)
```

Another one:

```text
1530,104,405,30,2687,3072,...,3872,4479,3028
```

Apply the formula:

- `worldX = 3872 - 2687 = 1185`
- `worldZ = 4479 - 3072 = 1407`

That matches [server_eventnpc_spawn_locations.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_eventnpc_spawn_locations.sql:768>):

```text
burntlizardcreek_aetherytegate -> (1185, 280, 1407)
```

That was the moment the method became trustworthy.

### 3. Use Neighboring Rows As Candidate Encounter Points

Once the anchor math checked out, we looked for adjacent rows in nearby Broken Water region blocks that looked like encounter points instead of pure travel anchors.

The first big hit was region `404`:

- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:140>)
- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:141>)
- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:142>)
- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:143>)

Those rows contained:

```text
1400 ... 2522,1373 ...
1420 ... 2052,1275 ...
1430 ... 3134,914  ...
1440 ... 1977,860  ...
```

Using the formula:

- `2522 - 2687 = -165`
- `1373 - 3072 = -1699`

- `2052 - 2687 = -635`
- `1275 - 3072 = -1797`

- `3134 - 2687 = 447`
- `914 - 3072 = -2158`

- `1977 - 2687 = -710`
- `860 - 3072 = -2212`

That produced the horizontal cluster:

```text
(-165, -1699)
(-635, -1797)
(447, -2158)
(-710, -2212)
```

These became the first serious Broken Water candidate encounter points.

### 4. Try Them In Game

At first, the rough `Y` estimates were not consistently correct.

But after in-game correction, all four points landed cleanly:

```text
!pos 174 -635 282.36 -1797
!pos 174 447 262.37 -2158
!pos 174 -710 282.02 -2212
!pos 174 -165 284.68 -1699
```

This became the validated Broken Water drake/base cluster.

### 5. Repeat For Neighboring Clusters

After that, the same style of extraction plus in-game correction was used to recover a second Broken Water cluster:

```text
!pos 174 1249 263.54 -545
!pos 174 1555 250 -233
!pos 174 710 252.751 -493.724
!pos 174 468.127 280 385.656
```

This became the validated Broken Water route/intercept cluster.

## Why `Y` Still Needed Manual Work

The method above solved horizontal placement. It did **not** give us a reliable direct height source.

What happened in practice:

- sometimes the rough `Y` estimate was close
- sometimes the point landed underground
- sometimes the point landed into a cliff lane and needed a small `X/Z` nudge as well

So the actual workflow became:

1. recover the right horizontal cluster from data
2. test in game
3. correct `Y`
4. correct any final lane drift if terrain demanded it
5. save the corrected point as validated

That means the current process is:

- data-driven for cluster discovery
- manual for final terrain polish

## Why The Cluster Interpretation Is Still A â€œBest Fitâ€

Even once the points were validated, there was still a second question:

- which exact leve uses which exact point

The data is strong enough to identify **families** of likely leves:

- drake/base cluster:
  - `1011` `Operation: Bloody Scales`
  - `1012` `Operation: Under Siege`
  - `1013` `Operation: Pulling Fangs`
- route/intercept cluster:
  - `1007` `Operation: Warm Welcome`
  - `1008` `Operation: Broken Thunder`
  - `1018` `Operation: Tailspin`

That mapping came from:

- leve mobs
- leve text
- camp association
- the shape of the recovered clusters

But it is still fair to call the one-leve-to-one-point association **interpretive** rather than fully proven archival truth.

## Reproducible Python Example

We did not rely on a finished Python pipeline during the original recovery; a lot of the work was manual inspection plus in-game validation.

Still, this is the core math in a small reproducible Python form:

```python
region_base_x = 2687
region_base_y = 3072

region_404_rows = [
    {"label": "r1400", "nav_x": 2522, "nav_y": 1373},
    {"label": "r1420", "nav_x": 2052, "nav_y": 1275},
    {"label": "r1430", "nav_x": 3134, "nav_y": 914},
    {"label": "r1440", "nav_x": 1977, "nav_y": 860},
]

for row in region_404_rows:
    world_x = row["nav_x"] - region_base_x
    world_z = row["nav_y"] - region_base_y
    print(row["label"], world_x, world_z)
```

Expected output:

```text
r1400 -165 -1699
r1420 -635 -1797
r1430 447 -2158
r1440 -710 -2212
```

And here is the same idea written as a helper:

```python
def nav_to_world(region_base_x: int, region_base_y: int, nav_x: int, nav_y: int) -> tuple[int, int]:
    return nav_x - region_base_x, nav_y - region_base_y


print(nav_to_world(2687, 3072, 4484, 4928))  # red labyrinth gate
print(nav_to_world(2687, 3072, 3872, 4479))  # burnt lizard creek gate
print(nav_to_world(2687, 3072, 2052, 1275))  # candidate encounter point
```

Expected output:

```text
(1797, 1856)
(1185, 1407)
(-635, -1797)
```

## Practical Template For Another Zone

When repeating this for another zone, the pattern is:

1. find the relevant `mapNavi_data.csv` region block
2. identify the repeated region base
3. verify the math against one or more known world anchors in `server_eventnpc_spawn_locations.sql`
4. extract neighboring rows as candidate encounter points
5. convert candidate `navX/navY` into world `X/Z`
6. test in game
7. correct `Y`
8. preserve validated points in SQL and notes

## What I Would Not Assume

Things this method does **not** currently prove:

- direct archival `Y`
- exact encounter radius
- exact mob-by-mob spawn layout
- exact one-leve-to-one-point mapping in every case
- Behest encounter centers from the same confidence level as the Broken Water guildleve work

## Final Broken Water Result

Validated Broken Water cluster 1:

```text
!pos 174 -635 282.36 -1797
!pos 174 447 262.37 -2158
!pos 174 -710 282.02 -2212
!pos 174 -165 284.68 -1699
```

Validated Broken Water cluster 2:

```text
!pos 174 1249 263.54 -545
!pos 174 1555 250 -233
!pos 174 710 252.751 -493.724
!pos 174 468.127 280 385.656
```

That is the first zone where the method was tested end to end and confirmed in game.

