#This is the test file

#setwd( "/home/feldmann/privat/svine/src_ulrike/package_neu/" )
#options( ladybugPath="/home/feldmann/privat/svine/LadyBug2.0" )

#setwd( "z:/src_ulrike/package_neu" )
#options( ladybugPath="z:/LadyBug2.0" )

#setwd( "e:/Arbeit/StatInst/src_ulrike/package_neu" )
#options( ladybugPath="e:/Arbeit/StatInst/LadyBug2.0" )

#setwd( "/data/Arbeit/StatInst/RLadyBug/Entwicklung/R" )
#options( ladybugPath="/data/Arbeit/StatInst/RLadyBug/Entwicklung/inst/LadyBug2.0" )

#setwd( "/home/feldmann/RLadyBug/RLadyBug/R" )
#options( ladybugPath="/home/feldmann/RLadyBug/RLadyBug/inst/LadyBug2.0" )

# TODO: if (Sys.getenv("USER")
setwd( "z:/Transmission/RLadyBug/R/" )
options(ladybugPath="z:/Transmission/RLadyBug/inst/LadyBug2.0" )

setwd( "e:/LMU/Transmission/RLadyBug/test/" )
source("LadyBug.R")

library( RUnit )

#myts <- defineTestSuite( "my test",
#                         "/home/feldmann/RLadyBug/RLadyBug/test" )
#myts <- defineTestSuite( "my test",
#                         "/data/Arbeit/StatInst/RLadyBug/Entwicklung/test" )

#In case the package is not loaded with library
.jinit(c(system.file("LadyBug2.0","bin", "ladybug.jar", package = "RLadyBug"),
         system.file("LadyBug2.0","bin", "hydra.jar", package = "RLadyBug")))


#Develop version
lbpath <- paste(Sys.getenv("HOME"),"Transmission/RLadyBug/inst/LadyBug2.0/",sep="")
.jinit(c(paste(lbpath,"/bin/ladybug.jar",sep=""),
         paste(lbpath,"bin/hydra.jar",sep="")))



myts <- defineTestSuite( "RLadyBugTest",
                         "Z:/Transmission/RLadyBug/test")

runTestSuite( myts )

######################################################################
# The result should be:
#Number of test functions: 59 
#Number of errors: 0 
#Number of failures: 9
#
# Failures are due to the summary checks.
######################################################################

