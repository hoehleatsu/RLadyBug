# generate generic functions needed

#Convert plot, summary to generic functions
setGeneric("summary")
if(!isGeneric("plot")) setGeneric("plot", useAsDefault=plot)
if(!isGeneric("simulate")) setGeneric("simulate", useAsDefault=simulate)


# #####     set-Methods     ##################################################

# --- class LBLayout
if ( ! isGeneric( "layoutMatrixes<-" ) ){
  fun <- function( object, value ) standardGeneric( "layoutMatrixes<-" )
  setGeneric( "layoutMatrixes<-", fun )
}
# --- END of class Layout

# --- class LBInference
if ( ! isGeneric( "infValues<-" ) ){
  fun <- function( object, value ) standardGeneric( "infValues<-" )
  setGeneric( "infValues<-", fun )
}

if ( ! isGeneric( "infValues" ) ){
  fun <- function( object ) standardGeneric( "infValues" )
  setGeneric( "infValues", fun )
}
# --- END of class LBInference

# -- Begin class LBOptions

#Don't forget: initialize

if ( ! isGeneric( "seed<-" ) ){
  fun <- function( object, value ) standardGeneric( "seed<-" )
  setGeneric( "seed<-", fun )
}

if ( ! isGeneric( "LBModel<-" ) ){
  fun <- function( object, value ) standardGeneric( "LBModel<-" )
  setGeneric( "LBModel<-", fun )
}

if ( ! isGeneric( "ignoreData<-" ) ){
  fun <- function( object, value ) standardGeneric( "ignoreData<-" )
  setGeneric( "ignoreData<-", fun )
}

if ( ! isGeneric( "initBeta<-" ) ){
  fun <- function( object, value ) standardGeneric( "initBeta<-" )
  setGeneric( "initBeta<-", fun )
}

if ( ! isGeneric( "initBetaN<-" ) ){
  fun <- function( object, value ) standardGeneric( "initBetaN<-" )
  setGeneric( "initBetaN<-", fun )
}

if ( ! isGeneric( "initIncu<-" ) ){
  fun <- function( object, value ) standardGeneric( "initIncu<-" )
  setGeneric( "initIncu<-", fun )
}

if ( ! isGeneric( "initInf<-" ) ){
  fun <- function( object, value ) standardGeneric( "initInf<-" )
  setGeneric( "initInf<-", fun )
}

if ( ! isGeneric( "initDia<-" ) ){
  fun <- function( object, value ) standardGeneric( "initDia<-" )
  setGeneric( "initDia<-", fun )
}

if ( ! isGeneric( "LBOptions<-" ) ){
  fun <- function( object, value ) standardGeneric( "LBOptions<-" )
  setGeneric( "LBOptions<-", fun )
}

if ( ! isGeneric( "LBInits<-" ) ){
  fun <- function( object, value ) standardGeneric( "LBInits<-" )
  setGeneric( "LBInits<-", fun )
}


####fetch methods

# --- class LBOptions
if ( ! isGeneric( "sim" ) ){
  fun <- function(object, nsim, seed, ...) standardGeneric("sim")
  setGeneric( "sim", fun )
}

# --- END of class LBOptions

# --- class LBOptionsMCMC
if ( ! isGeneric( "algo<-" ) ){
  fun <- function( object, value ) standardGeneric( "algo<-" )
  setGeneric( "algo<-", fun )
}

if ( ! isGeneric( "randomWalk<-" ) ){
  fun <- function( object, value ) standardGeneric( "randomWalk<-" )
  setGeneric( "randomWalk<-", fun )
}
# --- END of class LBOptionsMCMC


# #####     get-Methods     ##################################################

# --- class LBLayout
if ( ! isGeneric( "layoutMatrixes" ) ){
  fun <- function( object ) standardGeneric( "layoutMatrixes" )
  setGeneric( "layoutMatrixes", fun )
}

if ( ! isGeneric( "layoutAsDataFrame" ) ){
  fun <- function( object ) standardGeneric( "layoutAsDataFrame" )
  setGeneric( "layoutAsDataFrame", fun )
}
# --- END of class LBLayout


# --- class LBOptions
if ( ! isGeneric( "seed" ) ){
  fun <- function( object ) standardGeneric( "seed" )
  setGeneric( "seed", fun )
}

if ( ! isGeneric( "LBModel" ) ){
  fun <- function( object ) standardGeneric( "LBModel" )
  setGeneric( "LBModel", fun )
}

if ( ! isGeneric( "ignoreData" ) ){
  fun <- function( object ) standardGeneric( "ignoreData" )
  setGeneric( "ignoreData", fun )
}

if ( ! isGeneric( "initBeta" ) ){
  fun <- function( object ) standardGeneric( "initBeta" )
  setGeneric( "initBeta", fun )
}

if ( ! isGeneric( "initBetaN" ) ){
  fun <- function( object ) standardGeneric( "initBetaN" )
  setGeneric( "initBetaN", fun )
}

if ( ! isGeneric( "initIncu" ) ){
  fun <- function( object ) standardGeneric( "initIncu" )
  setGeneric( "initIncu", fun )
}

if ( ! isGeneric( "initInf" ) ){
  fun <- function( object ) standardGeneric( "initInf" )
  setGeneric( "initInf", fun )
}

if ( ! isGeneric( "initDia" ) ){
  fun <- function( object ) standardGeneric( "initDia" )
  setGeneric( "initDia", fun )
}

if ( ! isGeneric( "LBOptions" ) ){
  fun <- function( object ) standardGeneric( "LBOptions" )
  setGeneric( "LBOptions", fun )
}

if ( ! isGeneric( "LBInits" ) ){
  fun <- function( object ) standardGeneric( "LBInits" )
  setGeneric( "LBInits", fun )
}

if ( ! isGeneric( "optionsAsDataFrame" ) ){
  fun <- function( object ) standardGeneric( "optionsAsDataFrame" )
  setGeneric( "optionsAsDataFrame", fun )
}

if ( ! isGeneric( "initsAsDataFrame" ) ){
  fun <- function( object ) standardGeneric( "initsAsDataFrame" )
  setGeneric( "initsAsDataFrame", fun )
}
# --- END of class LBOptions

# --- class LBOptionsMCMC
if ( ! isGeneric( "algo" ) ){
  fun <- function( object ) standardGeneric( "algo" )
  setGeneric( "algo", fun )
}

if ( ! isGeneric( "randomWalk" ) ){
  fun <- function( object ) standardGeneric( "randomWalk" )
  setGeneric( "randomWalk", fun )
}

if ( ! isGeneric( "R0" ) ){
  fun <- function( object, ... ) standardGeneric( "R0" )
  setGeneric( "R0", fun )
}

# --- END of class LBOptionsMCMC


# #####     other Methods (internal)  #######################################

if ( ! isGeneric( "show" ) ){
  fun <- function( object ) standardGeneric( "show" )
  setGeneric( "show", fun )
}

# --- class Experiment

if ( ! isGeneric( "data2events" ) ) {
  fun <- function( object ) standardGeneric( "data2events" )
  setGeneric( "data2events", fun )
}

if ( ! isGeneric( "plot.global" ) ){
  fun <- function( object, options, ... ) standardGeneric( "plot.global" )
  setGeneric( "plot.global", fun )
}

if ( ! isGeneric( "plot.local" ) ){
  fun <- function( object, options, ... ) standardGeneric( "plot.local" )
  setGeneric( "plot.local", fun )
}

if ( ! isGeneric( "plot.individual" ) ){
  fun <- function( object, options, ...) standardGeneric( "plot.individual" )
  setGeneric( "plot.individual", fun )
}

if ( ! isGeneric( "plot.animation" ) ){
 fun <- function( object, options, ...) standardGeneric( "plot.animation" )
  setGeneric( "plot.animation", fun )
}
# --- END of class Experiment

# --- class LBOptionsMCMC, LBOptionsML
if ( ! isGeneric( "writeOptionFile" ) ){
  fun <- function( object, filename="character" ) 
             standardGeneric( "writeOptionFile" )
  setGeneric( "writeOptionFile", fun )
}
# --- END of class LBOptionsMCMC, LBOptionsML

# --- class InferenceMLK
if ( ! isGeneric( "plot.klink" ) ){
  fun <- function( object, exp="LBExperiment", eps="numeric" ) 
             standardGeneric( "plot.klink" )
  setGeneric( "plot.klink", fun )
}
# --- END of class InferenceMLK


# --- class InferenceMCMC
if ( ! isGeneric( "samplePaths" ) ){
  fun <- function( object) standardGeneric( "samplePaths" )
  setGeneric( "samplePaths", fun )
}
# --- END of class InferenceMLK
