# Instance Boundaries Configuration

You can use the new boundary system to restrict player movement inside specific instanced areas (like `PrivateAreaContent` zones).

When a player hits the boundary edge, they will be "rubber-banded" (their position is rejected by the server and they snap back to where they were), and they receive a system error message: "You cannot pass this boundary."

To configure boundaries, you use the Lua methods exposed on the `Area` object within your instance scripts.

## Circle Boundary

To create a circular boundary, pass the center X, center Z, and the maximum allowed radius.

```lua
-- Example: Creating a circular arena in onCreate
function onCreate(player, area, director)
    -- Center X: 0.0, Center Z: 0.0, Radius: 50.0 yalms
    area:SetBoundaryCircle(0.0, 0.0, 50.0)
end
```

## Square Boundary

To create a square or rectangular boundary, provide the minimum X, minimum Z, maximum X, and maximum Z coordinates to define the box.

```lua
-- Example: Creating a rectangular room boundary
function onCreate(player, area, director)
    -- X range: -25 to 25. Z range: -50 to 50
    area:SetBoundarySquare(-25.0, -50.0, 25.0, 50.0)
end
```

## Line Boundary (Infinite Wall)

A line boundary acts as an infinite wall dividing the zone into a "valid" half and an "invalid" half.
It requires a point on the line (`p1X`, `p1Z`), and the normal vector pointing towards the **valid** (allowed) side (`normalX`, `normalZ`).

```lua
-- Example: Blocking players from moving past Z = 100 towards the positive Z direction
function onCreate(player, area, director)
    -- Point on line: X = 0, Z = 100
    -- Normal pointing to the valid side: X = 0, Z = -1 (The valid side is any Z < 100)
    area:SetBoundaryLine(0.0, 100.0, 0.0, -1.0)
end
```

## Clearing Boundaries

You can remove a boundary dynamically, for instance, when a boss is defeated or an event concludes:

```lua
-- Example: Removing the boundary
function onBossDefeated(player, area)
    area:ClearBoundaries()
end
```
