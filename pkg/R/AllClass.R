
# -------------  class Layout  ---------------------------------------------
setClass( "LBLayout", representation( S0 = "matrix",
                                      E0 = "matrix" ) )

# -------------  class Experiment --
setClass( "LBExperiment", representation( data   = "data.frame",
                                        layout = "LBLayout",
                                             T = "numeric" ) )


# -------------  class Options  -----------------------------------------------
setClass( "LBOptions", representation( seed       = "numeric",
                                     LBmodel    = "vector",
                                     ignoreData = "vector",
                                     initBeta  = "list",
                                     initBetaN = "list",
                                     initIncu  = "list",
                                     initInf   = "list",
                                     initDia   = "list" ),
                     prototype( seed= 2006,
                                LBmodel= c( incuTimePDF="gamma",
                                            infTimePDF ="gamma",
                                            diagTimePDF="gamma",
                                            meanVar    ="false" ),
                                ignoreData = c( ignoreE=FALSE,
                                                ignoreI=FALSE,
                                                ignoreD=FALSE ),
                                initBeta=list( "init"=NA,
                                               "gamma"=0.001,
                                               "delta"=0.001 ),
                                initBetaN=list( "init"=NA,
                                                "gamma"=0.001,
                                                "delta"=0.001 ),
                                initIncu=list( "asis"=FALSE,
                                           "const"=FALSE,
                                           "const.val"=NA,
                                           "g"=NA,
                                           "g.gamma"=0.001,
                                           "g.delta"=0.001,
                                           "d"=NA,
                                           "d.gamma"=0.001,
                                           "d.delta"=0.001 ),
                                initInf=list( "g"=NA,
                                          "g.gamma"=0.001,
                                          "g.delta"=0.001,
                                          "d"=NA,
                                          "d.gamma"=0.001,
                                          "d.delta"=0.001 ),
                                initDia=list( "g"=10,
                                          "g.gamma"=0.001,
                                          "g.delta"=0.001,
                                          "d"=10,
                                          "d.gamma"=0.001,
                                          "d.delta"=0.001 ) ) )


# -------------  class LBOptionsML  -------------------------------------------

setClass( "LBOptionsML", contains = "LBOptions" )

# -------------  class LBOptionsMCMC  ----------------------------------------

setClass( "LBOptionsMCMC", representation( algo       = "vector",
                                         randomWalk = "vector" ),
                         prototype( algo       = c( samples=2500,
                                                    thin=10,
                                                    burnin=10000 ),
                                    randomWalk = c( "betaRWsigma"=NA,
                                                    "betaNRWsigma"=NA,
                                                    "gammaERWsigma"=NA,
                                                    "deltaERWsigma"=NA,
                                                    "gammaIRWsigma"=NA,
                                                    "deltaIRWsigma"=NA,
                                                    "gammaDRWsigma"=NA,
                                                    "deltaDRWsigma"=NA,
                                                    "ERWsigma"=NA
                                                  ) ),
                         contains = "LBOptions" )

# -------------  class LBInference  -------------------------------------------

setClass( "LBInference", representation( paramHat = "numeric",
                                       paramSe  = "numeric",
                                       aic      = "numeric",
                                       loglik   = "numeric" ) )

# -------------  class LBInferenceMCMC  ---------------------------------------

setClass( "LBInferenceMCMC", representation( samplePaths = "data.frame" ),
                           contains = "LBInference" )

# -------------  class LBInferenceML  ----------------------------------------

setClass( "LBInferenceML", representation( cov    = "matrix",
                                         corr   = "numeric" ),
                         contains = "LBInference" )

# -------------  class LBInferenceMLK  -------------------------------------------

setClass( "LBInferenceMLK", representation( r0 = "numeric",
                                          r0.ci = "numeric" ),
                          contains = "LBInferenceML" )

