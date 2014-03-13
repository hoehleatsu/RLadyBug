# # -------------  class LBOptionsMCMC  -------------------------------------------

# setClass( "LBOptionsMCMC", representation( algo       = "vector",
#                                          randomWalk = "vector" ),
#                          prototype( algo       = c( samples=2500,
#                                                     thin=10,
#                                                     burnin=10000 ),
#                                     randomWalk = c( "betaRWsigma"=NA,
#                                                     "betaNRWsigma"=NA,
#                                                     "gammaERWsigma"=NA,
#                                                     "deltaERWsigma"=NA,
#                                                     "gammaIRWsigma"=NA,
#                                                     "deltaIRWsigma"=NA,
#                                                     "gammaDRWsigma"=NA,
#                                                     "deltaDRWsigma"=NA,
#                                                     "ERWsigma"=NA
#                                                   ) ),
#                          contains = "LBOptions" )


# initialize
setMethod( "initialize", "LBOptions",
function( .Object, seed, LBmodel, ignoreData, initBeta, initBetaN, initIncu, initInf,
          initDia, algo, randomWalk ){
  if ( ! missing( seed ) ){
    seed( .Object ) <- seed
  }
  if ( ! missing( LBmodel ) ){
    LBModel( .Object ) <- LBmodel
  }
  if ( ! missing( ignoreData ) ){
    ignoreData( .Object ) <- ignoreData
  }
  if ( ! missing( initBeta ) ){
    initBeta( .Object ) <- initBeta
  }
  if ( ! missing( initBetaN ) ){
    initBetaN( .Object ) <- initBetaN
  }
  if ( ! missing( initIncu ) ){
    initIncu( .Object ) <- initIncu
  }
  if ( ! missing( initInf ) ){
    initInf( .Object ) <- initInf
  }
  if ( ! missing( initDia ) ){
    initDia( .Object ) <- initDia
  }
  if ( ! missing( algo ) ){
    algo( .Object ) <- algo
  }
  if ( ! missing( randomWalk ) ){
    randomWalk( .Object ) <- randomWalk
  }

  return( .Object )
} )


# show
setMethod( "show", "LBOptionsMCMC", function( object ){
  cat( "An object of class LBOptionsMCMC\n\n" )
  cat( "Options:\n" )
    cat( "  Seed:\n  " )
    print( seed( object ) )
    cat( "\n  LBModel:\n  " )
    print( LBModel( object ) )
    cat( "\n  IgnoreData:\n  " )
    print( ignoreData( object ) )
    cat( "\n  Algo:\n  " )
    print( algo( object ) )
    cat( "\n  RandomWalk:\n  " )
    print( randomWalk( object ) )
  cat( "InitialValues:\n" )
    cat( "  Beta:\n  " )
    print( initBeta( object ) )
    cat( "  BetaN:\n  " )
    print( initBetaN( object ) )
    cat( "  Inc:\n  " )
    print( initIncu( object ) )
    cat( "  Inf:\n  " )
    print( initInf( object ) )
    cat( "  Diag:\n  " )
    print( initDia( object ) )
} )


# >>> set-Methods

# algo
setReplaceMethod( "algo", "LBOptionsMCMC", function( object, value ){
  len <- length( value )
  vectorNames <- c( "samples", "thin", "burnin" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- vectorNames[1:len]
  }

  if ( len < length( vectorNames ) ) {
    old <- algo( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the vector elements
  object@algo <- value[ vectorNames ]
  return( object )
} )

# randomWalk
setReplaceMethod( "randomWalk", "LBOptionsMCMC", function( object, value ){
  len <- length( value )
  vectorNames <- c( "betaRWsigma", "betaNRWsigma",
                    "gammaERWsigma", "deltaERWsigma",
                    "gammaIRWsigma", "deltaIRWsigma",
                    "gammaDRWsigma", "deltaDRWsigma", "ERWsigma" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- vectorNames[1:len]
  }

  if ( len < length( vectorNames ) ) {
    old <- randomWalk( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the vector elements
  object@randomWalk <- value[ vectorNames ]
  return( object )
} )

# LBOptions
setReplaceMethod( "LBOptions", "LBOptionsMCMC", function( object, value ){
  object <- callNextMethod()

  val.names <- names( value )

  if( "algo"       %in% val.names ) algo( object )       <- value$algo
  if( "randomWalk" %in% val.names ) randomWalk( object ) <- value$randomWalk

  return( object )
} )


# >>> get-Methods

# algo
setMethod( "algo", "LBOptionsMCMC", function( object ){
  return( object@algo )
} )

# randomWalk
setMethod( "randomWalk", "LBOptionsMCMC", function( object ){
  return( object@randomWalk )
} )

# LBOptions
setMethod( "LBOptions", "LBOptionsMCMC", function( object ){
  li <- callNextMethod()

  return( c( li, list( algo       = algo( object ),
                       randomWalk = randomWalk( object ) ) ) )
} )

# optionsAsDataFrame
setMethod( "optionsAsDataFrame", "LBOptionsMCMC", function( object ){
  df1 <- callNextMethod()

  mat <- matrix( NA, nrow=12, ncol=2 )
  df2 <- as.data.frame( mat )

  algo <- algo( object )
  df2[1,] <- c( "samples=", algo[ "samples" ] )
  df2[2,] <- c( "thin=",    algo[ "thin" ] )
  df2[3,] <- c( "burnin=",  algo[ "burnin" ] )

  randomWalk <- randomWalk( object )
  df2[4,]  <- c( "betaRWsigma=",   randomWalk[ "betaRWsigma" ] )
  df2[5,]  <- c( "betaNRWsigma=",  randomWalk[ "betaNRWsigma" ] )
  df2[6,]  <- c( "gammaERWsigma=", randomWalk[ "gammaERWsigma" ] )
  df2[7,]  <- c( "deltaERWsigma=", randomWalk[ "deltaERWsigma" ] )
  df2[8,]  <- c( "gammaIRWsigma=", randomWalk[ "gammaIRWsigma" ] )
  df2[9,]  <- c( "deltaIRWsigma=", randomWalk[ "deltaIRWsigma" ] )
  df2[10,] <- c( "gammaDRWsigma=", randomWalk[ "gammaDRWsigma" ] )
  df2[11,] <- c( "deltaDRWsigma=", randomWalk[ "deltaDRWsigma" ] )
  df2[12,] <- c( "ERWsigma=",      randomWalk[ "ERWsigma" ] )

  return( list( df1, df2 ) )

} )


# >>> other Methods

# summary
setMethod( "summary", "LBOptionsMCMC", function( object ){
  return( object )
} )

# writeOptionFile
setMethod( "writeOptionFile", "LBOptionsMCMC",
function( object, filename = "ladybug-mcmc.sir" ){

  df.list <- optionsAsDataFrame( object )

  df <- rbind( c( "(options", "" ),
               df.list[[1]],
               c( ")", "" ),
               c( "(method mcmc", "" ),
               df.list[[2]],
               c( ")", "" ) )

  write.table( df, filename, quote=FALSE, row.names=FALSE, col.names=FALSE )

  return( filename )
} )
