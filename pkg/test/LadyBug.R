require(methods)
require(boa)
require(MASS)
require(coda)
require(rJava)
require(RUnit)

if ( ! ( "path.sep" %in% names( .Platform ) ) ) {
  .Platform$path.sep <- ifelse( .Platform$OS.type == "unix", ":", ";" )
}

#hoehlePath:
#lbpath <- paste( Sys.getenv( "HOME" ), "Transmission/RLadyBug/inst/LadyBug2.0/", sep="" )
  
#.jinit(c(paste( lbpath, "bin/ladybug.jar", sep="" ),
#         paste( lbpath, "bin/hydra.jar", sep="" )))

source( "../R/AllClass.R" )
source( "../R/AllGeneric.R" )
source( "../R/Experiment.R" )
source( "../R/functions.R" )
source( "../R/Inference.R" )
source( "../R/InferenceMCMC.R" )
source( "../R/InferenceML.R" )
source( "../R/InferenceMLK.R" )
source( "../R/Layout.R" )
source( "../R/Options.R" )
source( "../R/OptionsMCMC.R" )
source( "../R/OptionsML.R" )
