# -------------  class LBInferenceMCMC  -----------------------------------------

#setClass( "LBInferenceMCMC", representation( samplePaths = "data.frame" ),
#                           contains = "Inference" )

# initialize
setMethod( "initialize", "LBInferenceMCMC",
function( .Object, paramHat, paramSe, aic, loglik, samplePaths ){
  if ( ! missing( paramHat ) ){
    .Object@paramHat <- paramHat
  }
  if ( ! missing( paramSe ) ){
    .Object@paramSe <- paramSe
  }
  if ( ! missing( aic ) ){
    .Object@aic <- aic
  }
  if ( ! missing( loglik ) ){
    .Object@loglik <- loglik
  }
  if ( ! missing( samplePaths ) ){
    .Object@samplePaths <- samplePaths
  }
  else {
    .Object@samplePaths <- data.frame()
  }

  return( .Object )
} )


# >>> set-Methods

# infValues
setReplaceMethod( "infValues", "LBInferenceMCMC", function( object, value ){
  object <- callNextMethod()

  val.names <- names( value )

  if( "samplePaths" %in% val.names )
     object@samplePaths  <- value$samplePaths

  return( object )
} )


# >>> get-Methods

# infValues
setMethod( "infValues", "LBInferenceMCMC", function( object ){
  li <- callNextMethod()

  return( c( li, list( samplePaths=object@samplePaths ) ) )
} )


setMethod( "samplePaths", "LBInferenceMCMC", function( object ){
  return(object@samplePaths)
} )


# >>> other methods

# show
setMethod( "show", "LBInferenceMCMC", function( object ){
  cat( "An object of class LBInferenceMCMC\n\n" )
  cat( "Parameter Estimations (posterior mean from",nrow(object@samplePaths),"samples):\n" )
    cat( "  Parameter:\n" )
    print( object@paramHat )
    cat( "\n  StandardErrors (posterior std.dev. from",nrow(object@samplePaths),"samples):\n" )
    print( object@paramSe )
#    cat( "\n  Loglikelihood:\n  " )
#    print( object@loglik )
#    cat( "\n  AIC:\n  " )
#    print( object@aic )
#    cat( "\n  SamplePaths:\n  " )
#    cat( "length: ", nrow( object@samplePaths ), "\n" )

} )


# summary
setMethod( "summary", "LBInferenceMCMC", function( object ) {
  return( object )
} )


#======================================================================
# plot of an LBInferenceMCMC object -- i.e. some results and diagnostic
# atm only a plot of the beta/etaN ratio is shown
#======================================================================

setMethod("plot", signature(x="LBInferenceMCMC", y="missing"), function(x, y, which=c("beta","betabetaN"), alpha=0.05,...) {
  #args <- list(...)
  #if (!is.null(alpha))
  object <- x
  a <- object@samplePaths
  
  if (which == "beta") {
    samples <- mcmc(inf.mcmc@samplePaths)
    plot(samples[,"beta"])
    sample <- a$beta
  }

  if (which == "betabetaN") {
    #Use the sample to compute the beta/betaN ratio

    sample <- a$beta/a$betaN
    #Compute the kernel smoothed density
    d <- density(sample,from=0,to=max(sample))
     #Find density for a given z.
    d.y <- function(z) {
      #Find index of x in d closest to z
      mindist <- min(abs(d$x-z))
      #No interpolation just best value.
      return(d$y[d$x == (mindist + z) | d$x == (-mindist + z)])
    }

    par(mfcol=c(1,2))
    #Scatter plot + 2D kernel density estimation 
    d2 <- kde2d(a$beta,a$betaN,n=50) 
    kde2dplot(d2)
    points(a$beta,a$betaN,pch=".")


    #Nice colors?
    pink <- rgb(0.9960784,0.4941176,0.7960784)
    kvllightblue <- rgb(0.1843137,0.6862745,0.9254902)
    kvlblue <- rgb(0,0.2196,0.5765)
  
    #Plot kernel estimate
    par(mar=c(5,4,4,1)) 
    plot.density(d,main="",xlab=expression(beta/beta[n]),ylim=c(min(d$y)-0.005,max(d$y)))
    points(sample,numeric(length(sample)))

    #Mean
    lines(c(mean(sample),mean(sample)),c(0,d.y(mean(sample))),lwd=3,col=kvllightblue)
    #Median
    lines(c(median(sample),median(sample)),c(0,d.y(median(sample))),lwd=3,col=kvlblue,lty=2)
    #HPD credibility interval
    #ci <- quantile(sample,c(alpha/2,1-alpha/2))
    ci <- boa.hpd(sample,alpha=alpha)
    y <- -0.004
    dy <- 0.002
    lines(c(ci[1],ci[1]),c(y-dy,y+dy),lwd=3,col=pink)
    lines(c(ci[2],ci[2]),c(y-dy,y+dy),lwd=3,col=pink)
    lines(ci,c(y,y),lwd=3,col=pink)
    
    legend(max(sample)/3.8,max(d$y),
           c("Mean","Median",paste((1-alpha)*100,"% HPD",sep="")),
           lty=c(1,2,1),lwd=c(3,3,3),col=c(kvllightblue,kvlblue,pink))
    par(mfcol=c(1,1))
  }
  #Symmetric credibility interval
  ci <- quantile(sample,c(alpha/2,1-alpha/2))
  #HPD
  hpd <- boa.hpd(sample,alpha=alpha)
  names(hpd) <- c(paste("LB ",(1-alpha)*100,"% HPD",sep=""),
                  paste("UB ",(1-alpha)*100,"% HPD",sep=""))
          
  #Done
  invisible(list(mean=mean(sample),median=median(sample),symm=ci,hpd=hpd))
})

######################################################################
# R0 computations for multitype epidemic. Note: This only works for
# the model without latency time. (I'm not sure about this!)
######################################################################


setMethod("R0", "LBInferenceMCMC",
          function( object, experiment ) {
            
  #Size of the layout
  noXY <- dim( experiment@layout@S0 )

  #Create global variable
  makeNeigh(noXY)

  #get the samples
  samples <- object@samplePaths
  apply(samples,MAR=1,FUN=r0,noXY=noXY)
})

######################################################################
# non-public function
######################################################################


kde2dplot <- function(d,                # a 2d density computed by kde2D
                      ncol=50,          # the number of colors to use 
                      zlim=c(0,max(z)), # limits in z coordinates 
                      nlevels=10,       # see option nlevels in contour 
		      theta=30,         # see option theta in persp
		      phi=30) {          # see option phi in persp
  z   <- d$z
  nrz <- nrow(z) 
  ncz <- ncol(z) 
  
  couleurs  <- tail(topo.colors(trunc(1.4 * ncol)),ncol) 
  fcol      <- couleurs[trunc(z/zlim[2]*(ncol-1))+1] 
  dim(fcol) <- c(nrz,ncz) 
  fcol      <- fcol[-nrz,-ncz]
  
  #par(mfrow=c(1,2),mar=c(0.5,0.5,0.5,0.5))
  #par(mfrow=c(1,1),mar=c(0.5,0.5,0.5,0.5)) 
  #persp(d,col=fcol,zlim=zlim,theta=theta,phi=phi,zlab="density") 
  
  par(mar=c(5,4,4,1)) 
  image(d,col=couleurs,,xlab=expression(beta),ylab=expression(beta[n])) 
  contour(d,contour,nlevels=nlevels,add=T)
  #title("2D Kernel Density Estimation")
  box() 
}


######################################################################
# Function to compute R0 for a single sample from the posterior
######################################################################

r0 <- function(sample, noXY) {
  #Compute mean inf time
  meanI <- sample["gammaI"]/sample["deltaI"]
  #Total population
  #noXY <- dim( exp@layout@S0 )
  k <- prod(noXY)

  #Create matrix of expected number of contacts between all
  #pairs of individuals.
  eta <- as.matrix(rep(meanI,k))

  #Population proportions
  #pi <- t(as.matrix(N/sum(N)))

  #Create eta matrix i.e. each column corresponds to eta vector
  etaM <- array(eta,dim=rep(k,2))

  #Create pi matrix, which has each pi vector as a column
  #piM <- t(array(pi,dim=rep(length(N),2)))

  #Create contact matrix
  B <- makeLambda2(c(sample["beta"],sample["betaN"]),noXY)
  #Expected number of contacts, c.f. p.53 in Andersson2001
  #Note that their lambda matrix are intensities at rate lambda_{ij}/n
  E <-etaM * B #*sum(N)) * piM
  
  #R0 is given as the largest eigenvalue of the expected number of
  #contact matrix
  max(eigen(E)$values)
}

            

