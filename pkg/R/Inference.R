# -------------  class LBInference  ---------------------------------------------

#setClass( "LBInference", representation( paramHat = "numeric",
#                                       paramSe  = "numeric",
#                                       aic      = "numeric",
#                                       loglik   = "numeric" ) )


# >>> set-Methods

# infValues
setReplaceMethod( "infValues", "LBInference", function( object, value ){
  val.names <- names( value )

  if( "paramHat" %in% val.names ) object@paramHat <- value$paramHat
  if( "paramSe"  %in% val.names ) object@paramSe  <- value$paramSe
  if( "aic"      %in% val.names ) object@aic      <- value$aic
  if( "loglik"   %in% val.names ) object@loglik   <- value$loglik

  return( object )
} )


# >>> get-Methods

# infValues
setMethod( "infValues", "LBInference", function( object ){

  return( list( paramHat = object@paramHat,
                paramSe  = object@paramSe,
                aic      = object@aic,
                loglik   = object@loglik ) )
} )


# >>> other methods

# show
setMethod( "show", "LBInference", function( object ){
  cat( "An object of class LBInference\n\n" )
  cat( "Parameter Estimations:\n" )
    cat( "  Parameter:\n  " )
    print( object@paramHat )
    cat( "\n  StandardErrors:\n  " )
    print( object@paramSe )
    cat( "\n  Loglikelihood:\n  " )
    print( object@loglik )
    cat( "\n  AIC:\n  " )
    print( object@aic )
} )


# summary 
setMethod( "summary", "LBInference", function( object ){
  return( object )
} )

