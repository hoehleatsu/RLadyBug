This folder contains example data for the LadyBug 2.0 program.
Go to the bin/ folder and run the ladybug.sh script on one of 
the files in the example folder.

Example:
--------
#cd $LADYBUG/bin/
ladybug.sh ../examples/oneill/oneill.data ../examples/oneill/mcmc.sir log.txt




The following examples datasets are available:
----------------------------------------------

csfv
----
Classical Swine Fever Virus data from the Dewulf et. al paper used
in the Hoehle et. al Applied Statistics paper. 

oneill
------
5 recovery times epidemic in the P.D. O'Neill article

abakaliki
---------
Smallpox data from the town of Abakaliki in Nigeria also used in
the P.D. O'Neill article. 

sim
----
Example of the SimSellke simulator. A specified number of epidemics in a 4x2 layout 
are generated. Use the sir.sim.SimSellke program -- see the comments
in the ladybug.sh script.