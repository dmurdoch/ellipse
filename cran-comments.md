### ellipse 0.5: 

This change is at the request of Prof. Ripley, to prepare for the 
move of `MASS::pairs.profile` to `stats`.  In this release, I have
added a function `pairs_profile`, while deprecating `pairs`.  Before R 4.4.0 comes out, I intend to remove `pairs` and `pairs.profile`, keeping
only the new function.

### R CMD check results

0 errors | 0 warnings | 0 notes

