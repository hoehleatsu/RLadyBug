This directory contains LadyBug 2.0 files for the classical swine
fever epidemic being a subset of the experiment by Dewulf. et
al. described in "An experimental infection with classical swine fever
in E2 sub-unit marker-vaccine vaccinated and in non-vaccinated pigs",
Vaccine 19, pp. 475-482.

csfv.txt
--------
Data from the experiment in a format nicely read by R/Splus.

csfv.data   
---------
The data used in the Hoehle et. al. paper in the LadyBug data
format. All exposure and two infection times should be regarded
parametric. Use this together with the mcmc.sir specification
file. This should generate results similar to Table 2 (left pane) in
the Hoehle et. al paper. 

csfv-TDprior.data
---------
A version of csfv.data containing the prior on the diagnostic time.

csfv-ml.data
------------
A version of csfv.data suitable for the maximum likelihood; use this
together with ml.sir. In csfv-ml.data all parametric incubation and
exposure times have been made fixed. Furthermore, the option "incu
asis" is used to keep all incubation times fixed at the value
specified in the csfv-ml.data. Despite the incubation time being
specified as constant (six days) the inoculated individual has an
incubation time of just 3 days. In other words the "asis" is a trick
to work with fixed but different valued incubation times. In a
parametric setup, this wont work though! A future version of the
program should keep the initial incubation time fixed but allow the
time of infection to vary.

ml.sir
------
Specification file for computing the MLE. Results as in Table 1(left pane)

mcmc.sir
--------
Specifcation file for a MCMC analysis - gives results similar to Table 2.

