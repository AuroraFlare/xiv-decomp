FFXIV Meteor dynamic item augment display overlay

Copy/enable this directory as one DatOverlay package. It renders up to
five server-side randomized augments through the stock materia UI. The
DesktopWidget LPB also includes the NewJobs class-icon patch because both
features target the same client file. Do not stack the older NewJobs LPB
after this one. Server mechanics remain authoritative; synthetic materia
types 89-185 are presentation-only.
The materia widget decodes +1..+50 and -1..-20 directly from the grade
byte. NormalItemBaseClass normalizes signed packet type bytes 128-185.
