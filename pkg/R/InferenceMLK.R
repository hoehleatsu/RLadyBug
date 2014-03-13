# -------------  class LBInferenceMLK  -------------------------------------------

#setClass( "LBInferenceMLK", representation( r0 = "vector",
#                                          r0.ci = "vector" ),
#                          contains = "InferenceML",
#                          prototype( r0=NA,
#                                     r0.ci=c( lower=NA, upper=NA ) ) )


# >>> set-Methods

# infValues
setReplaceMethod( "infValues", "LBInferenceMLK", function( object, value ){
  object <- callNextMethod()

  val.names <- names( value )

  if( "r0" %in% val.names )  object@r0 <- value$r0
  if( "r0.ci" %in% val.names ) object@r0.ci <- value$r0.ci

  return( object )
} )


# >>> get-Methods

# infValues
setMethod( "infValues", "LBInferenceMLK", function( object ){
  li <- callNextMethod()

  return( c( li, list( r0  = object@r0,
                       r0.ci = object@r0.ci ) ) )
} )


# >>> other Methods

# show
setMethod( "show", "LBInferenceMLK", function( object ){
  cat( "An object of class LBInferenceMLK\n\n" )
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
    cat( "\n  R0 plus 95% confidence intervall:\n" )
    print( c( object@r0.ci[1], object@r0, object@r0.ci[2] ) )
} )


# summary
setMethod( "summary", "LBInferenceMLK", function( object ){
  return( object )
} )


# plot.klink
setMethod( "plot.klink", "LBInferenceMLK", function( object, exp, eps=1e-5 ){
  param <- object@paramHat
  param.se <- object@paramSe
  loglik <- object@loglik
  expint <- exp2interval( exp )

  ##Show likelihood surface
  beta1.grid <- seq( max( eps, param[1] - 3 * param.se[1] ), 
                     param[1] + 3 * param.se[1], length=50)
  beta2.grid <- seq( max( eps, param[2] - 3 * param.se[2] ), 
                     param[2] + 3 * param.se[2], length=50)

  grid <- expand.grid(beta1.grid,beta2.grid)
  #Normalized log-likelihood
  vals <- matrix( apply( grid, MARGIN=1, loglik.klink, expint=expint,
                         makeLambda=makeLambda2 ), 
                  length(beta1.grid), length(beta2.grid) ) - loglik

  #Show log-likelihood
  contour( beta1.grid, beta2.grid, exp(vals), nlevel=20, 
           xlab=expression(beta[w]), ylab=expression(beta[b]) )
  points( param[1], param[2], cex=2, pch=3, col=2)
  #95% Joint Highest Likelihood interval
  contour( beta1.grid, beta2.grid,vals, levels=log(0.95), col=2,
           add=T, lty=2, lwd=2)
} )





