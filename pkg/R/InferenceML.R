# -------------  class LBInferenceML  -------------------------------------------

#setClass( "LBInferenceML", representation( cov    = "matrix",
#                                         corr   = "numeric" ),
#                         contains = "Inference" )


# >>> set-Methods

# infValues
setReplaceMethod( "infValues", "LBInferenceML", function( object, value ){
  object <- callNextMethod()

  val.names <- names( value )

  if( "cov" %in% val.names )  object@cov <- value$cov
  if( "corr" %in% val.names ) object@corr <- value$corr

  return( object )
} )


# >>> get-Methods

# infValues
setMethod( "infValues", "LBInferenceML", function( object ){
  li <- callNextMethod()

  return( c( li, list( cov  = object@cov,
                       corr = object@corr ) ) )
} )


# >>> other methods

# show
setMethod( "show", "LBInferenceML", function( object ){
  cat( "An object of class LBInferenceML\n\n" )
  cat( "Parameter Estimations:\n" )
    cat( "  Parameter:\n  " )
    print( object@paramHat )
    cat( "\n  StandardErrors:\n  " )
    print( object@paramSe )
    cat( "\n  Loglikelihood:\n  " )
    print( object@loglik )
    cat( "\n  AIC:\n  " )
    print( object@aic )
    cat( "\n  CovarianceMatrix:\n  " )
    print( object@cov )
    cat( "\n  Correlations:\n  " )
    print( object@corr )
} )


# summary
setMethod( "summary", "LBInferenceML", function( object ){
  return( object )
} )

# Compute basic reproduction ratio
setMethod("R0", "LBInferenceML",
          function( object, experiment ) {
            
  #Size of the layout
  noXY <- dim( experiment@layout@S0 )

  #Create global variable
  makeNeigh(noXY)

  #Number of individuals
  n <- sum( experiment@layout@S0 + experiment@layout@E0 )

  #Mean length of the infective period is given by the mean of the gamma distribution
  iota <- object@paramHat["gammaI"]/object@paramHat["deltaI"]

  #If one single unit (homogenous epidemic)
  if (prod(noXY) == 1) {
    return(as.numeric(object@paramHat["beta"]*n*iota))
  } else {
    stop("This is not implemented atm.")
  }
})

