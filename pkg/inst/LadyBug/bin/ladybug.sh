#!/usr/bin/bash

#The "executable"  version just uses the jar files in the bin directory
#In case you made modifications to the LadyBug source and
#want to test those you need to go to the classes directory
#instead and 
JARDIR=c:/user/hoehle/LMU/Transmission/LadyBug2.0/bin/
MYCPATH=$CLASSPATH\;$JARDIR/hydra.jar\;$JARDIR/ladybug.jar

#If you instead are developing you probably want to 
#run the classes from $LADYBUG/classes/ folder. Then
#use this instead
#MYCPATH=$CLASSPATH\;$JARDIR/hydra.jar\;$JARDIR/../classes/


#Example (from the bin directory):
#./ladybug.sh ../examples/oneill.data ../examples/oneill.sir log.txt
java -cp $MYCPATH sir.estimate.LadyBug $*

