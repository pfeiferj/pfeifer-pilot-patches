#! /bin/bash

# allow union merges since patches are designed to not conflict in ways that
# will cause bad union merges.
echo "*.py merge=union -text" >> .gitattributes
echo "*.cc merge=union -text" >> .gitattributes

# These two are most likely to have problems from upstream changes
git merge lag-adjusted-curvature-velocity
git merge pfeifer-always-on-lateral

# The rest likely will not have trouble merging
git merge pfeifer-current-max-speed
git merge pfeifer-experimental-mode-toggle
git merge pfeifer-fast-boot
git merge pfeifer-gap-adjust-control
git merge pfeifer-hkg-long-control-tune
git merge pfeifer-lane-detection
git merge pfeifer-nudgeless-lane-change
git merge pfeifer-speed-limit-control
git merge pfeifer-vtsc
git merge pfeifer-mapd


# checkout the .gitattributes file so future merges will not be affected
git checkout .gitattributes