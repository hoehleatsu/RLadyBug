#!/usr/bin/bash

#The exec version just uses the jar files in the bin directory
#In case you made modifications to the LadyBug source and
#want to test those you need to go to the classes directory
#instead and 
LADYBUG=z:/Transmission/LadyBug2.0
JARDIR=$LADYBUG/bin
MYCPATH=$CLASSPATH\;$JARDIR/hydra.jar\;$JARDIR/ladybug.jar

#If you instead are developing you probably want to 
#run the classes from $LADYBUG/classes/ folder. Then
#use this instead
#MYCPATH=$JARDIR/../classes/\;$CLASSPATH\;$JARDIR/hydra.jar
#MYCPATH=$JARDIR/../classes/\;$CLASSPATH

#Start the SimSellke class. For an example on how to use this
#see ${LADYBUG}/examples/sim/README.txt
java -cp $MYCPATH sir.sim.SimSellke $*


