# --- ladybugExample() -------------------------------------------------------
ladybugExample <- function( exp.file ){
  ladybugPath <- RLadyBug.options()$ladybugPath

  if ( is.null( ladybugPath ) ) {
    stop( 'Options ladybugPath is not set. 
           [ RLadyBug.options( ladybugPath="/your/ladybug/path" ) ] ' )
  }
  else {
    return( paste( ladybugPath, "/examples/", exp.file, sep="" ) )
  }
}
# --- END of ladybugExample() ------------------------------------------------



# --- writeDataFile() --------------------------------------------------------
writeDataFile <- function( experiment, options, filename="ladybug-data.data" ){

  writeFirstPartOfDataFile( options, experiment@layout, filename )
  writeLastPartOfDataFile( experiment, filename )

  return( filename )
}
# --- END of writeDataFile() -------------------------------------------------



# --- writeDataFileSim() -----------------------------------------------------
writeDataFileSim <- function( options, layout, filename="ladybug-sim.data" ){

  writeFirstPartOfDataFile( options, layout, filename )

  # add pseudo data
  mat <- matrix( c(1,1,10, 20, 40, 30), nrow=1, ncol=6 )
  df.data <- as.data.frame( mat )
  write.table( df.data, filename, quote=FALSE, append=TRUE,
                        row.names=FALSE, col.names=FALSE )

  return( filename )
}
# --- END of writeDataFileSim() ----------------------------------------------



# --- writeFirstPartOfDataFile() ---------------------------------------------
writeFirstPartOfDataFile <- function( options, layout, filename ){
  df.unit <- layoutAsDataFrame( layout )
  df.init <- initsAsDataFrame( options )

  write.table( df.unit, filename, quote=FALSE, row.names=FALSE,
               col.names=FALSE )
  write.table( df.init, filename, append=TRUE, quote=FALSE, row.names=FALSE,
               col.names=FALSE )

  return( filename )
}
# --- END of writeFirstPartOfDataFile() --------------------------------------



# --- writeLastPartOfDataFile() ----------------------------------------------
writeLastPartOfDataFile <- function( experiment, filename ){
  #Write cease time if defined
  if (!is.nan(experiment@T)) {
    write( paste("T",experiment@T), filename, append=TRUE)
  }
  
  df.data <- experiment@data
  write.table( df.data, filename, quote=FALSE, append=TRUE,
                        row.names=FALSE, col.names=FALSE,sep="\t")

  return( filename )
}
# --- END of writeLastPartOfDataFile() ---------------------------------------



# --- estimate() -------------------------------------------------------------
seir <- function( experiment, options=NULL, debug = FALSE ){

  # do ML estimation via Klinkenberg method
  if ( missing( options ) ) {
    return( seir.klinkenberg( experiment ) )
  }
  else {  # do ML or MCMC estimation via java 
    #Which system we are running (obsolete)
    which.system <- .Platform$OS.type

    #Location of the temporary data and option file
    file.data <- paste( getwd(), writeDataFile( experiment, options ),
                        sep="/" )
    file.sir  <- paste( getwd(), writeOptionFile( options ), sep="/" )

    #Imitate the command line arguments.
    argv <- c(file.data,file.sir,"log.txt")

    #Create an instance of the ladybug class
    sir <- .jnew("sir/estimate/LadyBug")

    ######################################################################
    #Call the main method (i.e. perform an estimation)
    #In the future this rather crude interface should be refined
    #by calling the different estimation methods directly.
    #Note: no backwards compatibility with the old LadyBug2.0 main method
    #      is intended
    ######################################################################
    cat("Calling LadyBug (monitor ladybug.system.out/err for progress)...")
    cat(.jcall(sir,"S","rJava_main",argv),"\n")

    #Read the redirected standard out and standard error.
    out <- readLines("ladybug.system.out", n=-1)
    if (!debug) {
      unlink("ladybug.system.out") # tidy up
    }
    err <- readLines("ladybug.system.err", n=-1)
    if (!debug) {
      unlink("ladybug.system.err") # tidy up
    }

    #Check that no errors occured. As
    if ( any( grep( "^Error:", out, perl=TRUE )) |
         any( grep( "^Error:", err, perl=TRUE )) ) {
      cat("Standard out:\n")
      print( out )
      cat("Standard error:\n")
      print( err )
      stop("look at java output above" )
    }
    else {
      inf.obj <- NULL

      if ( is( options, "LBOptionsML" ) ){
        inf.obj <- parseOutputML( out )
      }
      else if ( is( options, "LBOptionsMCMC" ) ){
        inf.obj <- parseOutputMCMC( out )
        inf.obj@samplePaths <- read.table( "log.txt", header=TRUE )
      }

      if (!debug) {
        file.remove( file.data, file.sir, "log.txt" )
      }

      return( inf.obj )
    }
  }

}
# --- END of estimate() ------------------------------------------------------



# --- parseOutputML() --------------------------------------------------------
parseOutputML <- function( output ){

  return.list <- list()

  # --- Parameter
  params    <- numeric()
  params.se <- numeric()
  pnames    <- numeric()
  
  # number of parameters in the model
  pNoLine <- grep("NoOfModelParams", output)
  noOfModelParams <- as.numeric(output[pNoLine + 1])
  
  # look for the place the parameters can be found
  ind <- grep( "Parameter estimates", output )

  # there's one line per parameter containing the parameter's name, the
  # estimation and the standard error; so we must split this character
  # vector (by whitespace)
  p.list <- strsplit( output[ (ind+1):(ind+noOfModelParams) ], split="\\s", perl=TRUE )

  # for each parameter:
  # take the elements we are interested in and convert them to numbers,
  # save estimations and standard errors in two different vectors
  for ( i in 1:noOfModelParams ){
    p.vector <- p.list[[i]][ c( 3,5 ) ]

    p.vector.num <- as.numeric( gsub( "\\(|\\)", "", p.vector, perl=TRUE ) )

    params    <- c( params, p.vector.num[1] )
    params.se <- c( params.se, p.vector.num[2] )
    pnames    <- c( pnames, p.list[[i]][1])
  }

  #Assign names
  names( params ) <- names( params.se ) <- pnames

   # --- Convert Hesse matrix to Covariance Matrix
  cov.vector <- numeric()

  ind <- grep( "Hessian:", output )

  # there's one line per parameter containing the parameter's name, the
  # estimation and the standard error; so we must split this character
  # vector (by whitespace)
  cov.list <- strsplit( output[ (ind+1):(ind+noOfModelParams) ], split="\\s", perl=TRUE )

  # for each parameter:
  # take the elements we are interesseted in and convert them to numbers,
  # save estimations and standard errors in two different vectors
  for ( i in 1:noOfModelParams ){
    cov.vector <- c( cov.vector, as.numeric( cov.list[[i]] ) )
  }

  hesse.mat <- matrix( cov.vector, ncol=noOfModelParams )

  #Determine inverse of fisher information matrix by considering
  #which parameters have not beeen used (i.e. row in hesse all zero)
  notUsed <- apply(hesse.mat, MARGIN=1,sum) == 0
  cov.mat <- matrix(0, nrow=nrow(hesse.mat), ncol=ncol(hesse.mat))
  cov.mat[!notUsed, !notUsed] <- solve(hesse.mat[!notUsed,!notUsed])

  # Save parameter estimations and standard errors in the object
  return.list$paramHat   <- params
  return.list$paramSe    <- sqrt(diag(cov.mat))
  return.list$cov <- cov.mat


  # calcutate correlations of importance
  corr <- numeric()
  idx <- c( 1, 3, 5, 7 )
  idx <- idx[idx <= noOfModelParams]
  for ( i in idx ){
    corr <- c( corr,
               cov.mat[i,i+1] / sqrt(cov.mat[i,i] * cov.mat[(i+1), (i+1)] ) )
  }
  names( corr ) <- paste(pnames[idx], pnames[idx+1])
  

  return.list$corr <- corr


  # --- AIC
  ind <- grep( "AIC", output )

  aic.list <- strsplit( output[ ind ], split="=", perl=TRUE )
  aic <- as.numeric( aic.list[[1]][3] )
  return.list$aic <- aic


  # --- Loglik
  ind <- grep( "Loglik", output )

  loglik.list <- strsplit( output[ ind ], split="=", perl=TRUE )
  loglik <- as.numeric( loglik.list[[1]][2] )
  return.list$loglik <- loglik


  # create new inference object, set inf values and return the object
  inf <- new( "LBInferenceML" )
  infValues( inf ) <- return.list

  return( inf )
}
# --- END of parseOutputML() -------------------------------------------------



# --- parseOutputMCMC() ------------------------------------------------------
parseOutputMCMC <- function( output ){

  return.list <- list()

  # --- Parameter
  params    <- numeric()
  params.se <- numeric()

  # look for the place the parameters can be found
  ind <- grep( "Posterior", output )

  # for each parameter:
  # take the elements we are interesseted in and convert them to numbers,
  # save estimations and standard errors in two different vectors
  for ( desc in c( "beta", "betaN", "gammaE", "deltaE", "gammaI", "deltaI",
                   "gammaD", "deltaD" ) ){
    grep.for <- paste( desc, "\t", sep="" )
    line <- grep( grep.for, output[ (ind+1):(ind+8) ], value=TRUE )

    if ( length( line ) > 0 ){
      # there's one line per parameter containing the parameter's name, the
      # estimation and the standard error; so we must split this character
      # vector (by whitespace)
      v.line <- strsplit( line, split="\\s", perl=TRUE )

      p.vector <- v.line[[1]][ c( 3,5 ) ]

      p.num <- as.numeric( gsub( "\\(|\\)", "", p.vector, perl=TRUE ) )

      params[ desc ]    <- p.num[1]
      params.se[ desc ] <- p.num[2]
    }
  }

  # Save parameter estimations and standard errors in the object
  return.list$paramHat   <- params
  return.list$paramSe <- params.se


  # --- AIC
  # Be careful, there's more than one line containing AIC; we need the last one
  ind <- rev( grep( "AIC", output ) )[1]

  aic.list <- strsplit( output[ ind ], split="=", perl=TRUE )
  aic <- as.numeric( aic.list[[1]][3] )
  return.list$aic <- aic


  # --- Loglik
  # Be careful, there's more than one line containing AIC; we need the last one
  ind <- rev( grep( "Loglik", output ) )[1]

  loglik.list <- strsplit( output[ ind ], split="=", perl=TRUE )
  loglik <- as.numeric( loglik.list[[1]][2] )
  return.list$loglik <- loglik


  # create new inference object, set inf values and return the object
  inf <- new( "LBInferenceMCMC" )
  infValues( inf ) <- return.list

  return( inf )
}
# --- END of parseOutputMCMC -------------------------------------------------




# --- readSpecFile() ---------------------------------------------------------
readSpecFile <- function( options, data )
{
  #Character used in LadyBug files for commenting (actually it is //)
  comment.char <- "/"
  #Create the result objects
  opt.object <- new( "LBOptions" )
  exp.object <- new( "LBExperiment" )

  opt.skip  <- vector()
  data.skip <- vector()

  if ( ! missing( options ) ){
    opt.file <- options

    spec <- scan( opt.file, sep="=", what="char",
                            comment.char=comment.char, strip.white=TRUE,
                            quiet=T, blank.lines.skip=TRUE )

    opt <- list()

    #--- opt$seed
    opt$seed <- as.numeric( spec[ 3 ] )

    #--- opt$model
    opt$model <- c( "incuTimePDF" = spec[ 5 ],
                    "infTimePDF"  = spec[ 7 ],
                    "diagTimePDF" = spec[ 9 ],
                    "meanVar"     = as.logical( spec[ 11 ] ) )

    #--- opt$ignoreData
    opt$ignoreData <- c( "ignoreE" = as.logical( spec[ 13 ] ),
                         "ignoreI" = as.logical( spec[ 15 ] ),
                         "ignoreD" = as.logical( spec[ 17 ] ) )

    # if MCMC Options
    if( spec[ 19 ] == "(method mcmc" ){
      opt.object <- new( "LBOptionsMCMC" )

      #--- opt$algo
      opt$algo <- c( "samples" = as.numeric( spec[ 21 ] ),
                     "thin"    = as.numeric( spec[ 23 ] ),
                     "burnin"  = as.numeric( spec[ 25 ] ) )

      #--- opt$randomWalk
      opt$randomWalk <- c( "betaRWsigma"   = as.numeric( spec[ 27 ] ),
                           "betaNRWsigma"  = as.numeric( spec[ 29 ] ),
                           "gammaERWsigma" = as.numeric( spec[ 31 ] ),
                           "deltaERWsigma" = as.numeric( spec[ 33 ] ),
                           "gammaIRWsigma" = as.numeric( spec[ 35 ] ),
                           "deltaIRWsigma" = as.numeric( spec[ 37 ] ),
                           "gammaDRWsigma" = as.numeric( spec[ 39 ] ),
                           "deltaDRWsigma" = as.numeric( spec[ 41 ] ),
                           "ERWsigma"      = as.numeric( spec[ 43 ] ) )

      algo( opt.object )       <- opt$algo
      randomWalk( opt.object ) <- opt$randomWalk
    } else {
      opt.object <- new( "LBOptionsML" )
    }

    seed( opt.object )       <- opt$seed
    LBModel( opt.object )      <- opt$model
    ignoreData( opt.object ) <- opt$ignoreData
  }

  if ( ! missing( data ) ){
    data.file <- data

    l.layout <- list()
    l.inits  <- list()


    data <- scan( data.file, what="char",
                   comment.char=comment.char, strip.white=TRUE, quiet=TRUE,
                   blank.lines.skip=TRUE)#, nlines=data.skip[2]-data.skip[1],skip=data.skip[1] )
    #Remove all comments
    #inits <- sub("//.*","",inits)
    #Last line of inits part will contain a (XX)
    lastInitIdx <- max(grep("\\(.*\\)",data))
    inits <- data[1:lastInitIdx]
    i <- 1

    #--- unit declaration
    x <- vector()
    y <- vector()
    S.v <- vector()
    E.v <- vector()
    while( inits[i] == "unit" ){
      x <- c( x, as.numeric( inits[i+1] ) )
      y <- c( y, as.numeric( inits[i+2] ) )
      S.v <- c( S.v, as.numeric( inits[i+3] ) )
      E.v <- c( E.v, as.numeric( inits[i+4] ) )
      i <- i+5
    }
    S <- matrix( S.v, ncol=max(y), nrow=max(x), byrow=TRUE )
    E <- matrix( E.v, ncol=max(y), nrow=max(x), byrow=TRUE )

    layout <- new( "LBLayout", S0=S, E0=E )




    #--- init value declaration
    read.inits.1 <- function( line ){
      ret <- list()

      ret$gamma <- as.numeric( line[2] )
      ret$delta <- as.numeric( line[3] )
      # replace "(" and ")" by nothing
      ret$init <- as.numeric( gsub( "\\(|\\)", "", line[4], perl=TRUE ) )

      return( ret )
    }

    read.inits.2 <- function( line ){
      ret <- list()

      if ( line[2] == "asis" ) {
        ret$asis <- TRUE
      }
      else if ( line[2] == "constant" ) {
        ret$const <- TRUE
        ret$const.val <- as.numeric( line[3] )
      }
      else {
        ret$g.gamma <- as.numeric( line[2] )
        ret$g.delta <- as.numeric( line[3] )
        # replace "(" and ")" by nothing
        ret$g <- as.numeric( gsub( "\\(|\\)", "", line[4], perl=TRUE ) )

        ret$d.gamma <- as.numeric( line[5] )
        ret$d.delta <- as.numeric( line[6] )
        # replace "(" and ")" by nothing
        ret$d <- as.numeric( gsub( "\\(|\\)", "", line[7], perl=TRUE ) )
      }

      return( ret )
    }

    l.inits$Beta <- read.inits.1( inits[ i:(i+3) ] )
    i <- grep( "betan", inits )
    l.inits$BetaN <- read.inits.1( inits[ i:(i+3) ] )
    i <- grep( "incu", inits )
    l.inits$E <- read.inits.2( inits[ i:(i+6) ] )
    i <- grep( "inf", inits )
    l.inits$I <- read.inits.2( inits[ i:(i+6) ] )
    i <- grep( "diag", inits )
    l.inits$D <- read.inits.2( inits[ i:(i+6) ] )

    initBeta( opt.object )  <- l.inits$Beta
    initBetaN( opt.object ) <- l.inits$BetaN
    initIncu( opt.object )  <- l.inits$E
    initInf( opt.object )   <- l.inits$I
    initDia( opt.object )   <- l.inits$D

    #--- T -- cease time (handle the possibility that its not defined)
    #Read all lines
    lines <- readLines(data.file)
    i <- grep("^T", lines)
    Tvar <- strsplit(lines[i],split="\\s", perl=TRUE)
    if ((length(Tvar) == 1) && (length(Tvar[[1]]) == 2)) {
       Tvar <- as.numeric(Tvar[[1]][2])
     } else {
       Tvar <- NaN
     }
    
    #--- data
    lines <- readLines(data.file)
    #Find the line number where the data file starts (we shall assume
    #its the last line containing comments??
    data.skip <- max(grep("^//*",lines))
    #Do the reading
    mydata <- read.table( data.file, skip=data.skip, sep="\t",
                          comment.char=comment.char, strip.white=TRUE,
                          blank.lines.skip=TRUE,
                          col.names=c( "x", "y", "E", "I", "R", "D" ) )

    exp.object@data   <- mydata
    exp.object@layout <- layout
    exp.object@T      <- Tvar
  }

  return( list( options=opt.object, experiment=exp.object ) )

}
# --- END of readSpecFile() --------------------------------------------------

# --- exp2interval() ---------------------------------------------------------
######################################################################
# All unknowns are replaced by their start-values
######################################################################
exp2interval <- function(exp, intLength=2) {
  #Fetch the data
  data <- exp@data

  #Size
  layout <- exp@layout
  noX <- dim(layout@S0)[1]
  noY <- dim(layout@S0)[2]

  #In case there is censoring or unknown event times.
  #Replace all unknowns with their start values
  if (is.factor(data$E)) {
    data$E <- as.numeric(sub("\\(([0-9]*)\\)","\\1",levels(data$E)[data$E]))
  }
  if (is.factor(data$I)) {
    data$I <- as.numeric(sub("\\(([0-9]*)\\)","\\1",levels(data$I)[data$I]))
  }
  if (is.factor(data$R)) {
    data$R <- as.numeric(sub("\\(([0-9]*)\\)","\\1",levels(data$R)[data$R]))
  }
  
  #Max observed Time
  T <- max(data[,c("E","I","R")])+intLength
  
  #Partition the time axis
  tseq <- seq(0,T,by=intLength)
  dt <- diff(tseq)[1]

  #Number of time intervals
  K <- length(tseq)
  
  #Allocate Arrays
  S <- array(0,c(noX,noY,K))
  I <- array(0,c(noX,noY,K))
  C <- array(0,c(noX,noY,K))

  ##Loop over all individuals
  for (i in 1:dim(data)[1]) {
    #Fetch the individual
    indiv <- data[i,]

    #C entry (new infection = exposure)
    firstTimeIdx <- which.max(tseq-indiv$E >= 0)
    C[indiv$x,indiv$y,firstTimeIdx] <- C[indiv$x,indiv$y,firstTimeIdx] + 1

    #I-entry (first before, first after)
    firstTimeIdx <- which.min(tseq <= indiv$I)-1
    lastTimeIdx  <- which.max(tseq-indiv$R > 0)
    #Add proportions within each time interval (one for all
    #between, first and last might need special weighting.
    add <- numeric(length(firstTimeIdx:lastTimeIdx)) + 1
    add[1] <- (tseq[firstTimeIdx+1]-indiv$I)/dt
    add[length(add)] <- 1-(tseq[lastTimeIdx]-indiv$R)/dt
    #Add it to the I structure
    I[indiv$x,indiv$y,firstTimeIdx:lastTimeIdx] <-
          I[indiv$x,indiv$y,firstTimeIdx:lastTimeIdx] + add

    #Find first time greater than time of exposure
    firstTimeIdx <- which.max(tseq > indiv$E)
    #It counts as susceptible until that point
    S[indiv$x,indiv$y,1:firstTimeIdx] <-
          S[indiv$x,indiv$y,1:firstTimeIdx] + 1
  }

  #There is always someone innoculated at time 0, which is conditioned on
  C[,,1] <- matrix(0,noX,noY)
  return(list(noXY=c(noX,noY),K=K,S=S,C=C,I=I))
}
# --- END of exp2interval() --------------------------------------------------

# --- neighbours() --------------------------------------------------
######################################################################
# Compute all neighbours of a unit
#
# loc - The location of the unit c(xloc,yloc)
# noX - number of units in the x-direction of the layout
# noY - number of units in the y-direction of the layout
#
# Returns:
#  a (no of valid neighbours) x 2 matrix
######################################################################
neighbours <- function(loc,noXY) {
  #Return all neighbours
  neigh <- rbind( c(loc[1]+1,loc[2]),
                 c(loc[1]-1,loc[2]),
                 c(loc[1]  ,loc[2]+1),
                 c(loc[1]  ,loc[2]-1))
  #Only take the valid neighbours
  neigh <- neigh[(neigh[,1] >= 1)  & (neigh[,1] <= noXY[1]) &
                 (neigh[,2] >= 1)  & (neigh[,2] <= noXY[2]),,drop=FALSE]
  return(neigh)
}
# --- END of neighbours() --------------------------------------------------

# --- loc2i() --------------------------------------------------
#Location to index
loc2i <- function(loc,noXY) {
  return( (loc[,1]-1) + (loc[,2]-1)*noXY[1] + 1)
}
# --- END of loc2i() --------------------------------------------------

# --- makeNeigh() --------------------------------------------------
######################################################################
# Make neighbours -- ends up initizalizing a global variable "neigh"
#
# Params:
#  no - c(noX,noY)
######################################################################
makeNeigh <- function(noXY) {
  neigh <- list()
  i <- 1
  for (y in 1:noXY[2]) {
    for (x in 1:noXY[1]) {
      neigh[[i]] <- loc2i(neighbours(c(x,y),noXY),noXY)
      i <- i+1
    }
  }
  #hoehle 21.9 -- now this is some serious spaghetti Ulrike coded here!
  neigh <<- neigh
  #return(neigh)
}
# --- END of makeNeigh() --------------------------------------------------

# --- makeLambda2() --------------------------------------------------
######################################################################
# Create contact matrix for the setup where there is only interaction
# between N4 neighbouts.
#
# Params:
#  beta - vector (beta_within, beta_between)
#  no   - c(x-dimension,y-dimension)
# Returns:
#  (noX*noY) \times (noX*noY) matrix
######################################################################
makeLambda2 <- function(beta,noXY) {
  #hoehle 21.9.2007:
  #This is dirty fix for the (not very nice) use of the global variable "neigh"
  #as of 2.6.0 this gives a warning 
  neigh <- globalenv()$neigh
  
  noOfUnits <- noXY[1]*noXY[2]
  #Allocate contact matrix
  Lambda <- matrix(0,noOfUnits,noOfUnits)

  diag(Lambda) <- beta[1]
  for (i in 1:noOfUnits) {
    Lambda[i,neigh[[i]]] <- beta[2]
  }
  return(Lambda)
}
# --- END of makeLambda2() --------------------------------------------------

# --- loglik.klink() --------------------------------------------------
######################################################################
# Loglikelihood function of the Klinkenberg et. al paper
#
# Params:
#  beta - vector specifying the contact matrix Lambda
#  makeLambda - function to create the contact matrix
#  expint - experiment with interval times (created by exp2int)
#
# Returns:
#  The loglikelihood
######################################################################
#Data as global variables
loglik.klink <- function(beta,expint,makeLambda=makeLambda2) {
  #Sumit
  loglik <- 0
  #Create contact matrix
  Lambda <- makeLambda(beta,expint$noXY)

  #Loop over all time points
  for (k in 1:expint$K) {
    #Hazards for each pen
    lambda <- Lambda %*% expint$I[,,k] 
    #Loglik
    #print(expint(lambda))
    if (sum(lambda)>0) {
      loglik <- loglik + sum(expint$C[,,k] * log(exp(lambda)-1) - expint$S[,,k]*lambda)
    } else {
      if ((sum(expint$I[,,k]) == 0) & (sum(expint$C[,,k])>0)) {
        print(beta)
        print(k)
        print("Warning: New cases even if no infectious!")
      }
    }
  }
  #print(c(beta,loglik))
  return(loglik)
}
# --- END of loglik.klink() --------------------------------------------------

# --- estimate.klinkenberg() --------------------------------------------------
######################################################################
# EStimate as in the Klinkenberg article
######################################################################

seir.klinkenberg <- function(exp) {
  #Create the klink data structures
  expint <- exp2interval( exp, intLength=2 )
  #Create the global variable (I'm afraid).
  noXY <- dim( exp@layout@S0 )
  makeNeigh( noXY )

  #No constraints (start values are of importance)
  #ml <- optim(c(0.1,0.1),loglik,control=list(fnscale=-1),hess=T,makeLambda=makeLambda2,expint=expint)

  #Constraint optimization
  eps <- 1e-5
  ml <- optim( c(0.1,0.1), loglik.klink, lower=c(eps,eps), upper=c(2,2),
               control=list(fnscale=-1), method="L-BFGS-B", hess=TRUE,
               makeLambda=makeLambda2, expint=expint )

  #Standard errors
  se <- sqrt( diag( solve( -ml$hess ) ) )

  ######################################################################
  # Look at R0
  ######################################################################

  #R0 as largest eigenvalue of the Lambda matrix using beta_w, beta_b
  R0 <- max( eigen( makeLambda2( ml$par, expint$noXY ) )$values )

  #Maple shows that max(eigenvalue) for a 3x1 setup = R0 <- beta[w]+2^(1/2)*beta[b]
  #SE's using multivariate delta rule R0 <- g(beta[w],beta[b])
  # se(\theta) = sqrt(g'(\hat{\theta}) I(\hat{\theta})^{-1} g'(\hat{\theta}))
  grad <- function( theta ) matrix( c(1, sqrt(2)), 2, 1 )
  se.R0 <- sqrt( t( grad( ml$par ) ) %*% solve( -ml$hess ) %*% grad( ml$par ) )
  uplo <- R0 + c(1,-1) * qnorm(0.05/2) * se.R0

  return( new( "LBInferenceMLK", paramHat=c( beta=ml$par[1], betaN=ml$par[2] ),
                               paramSe=c( beta=se[1], betaN=se[2] ),
                               aic= -2 * ml$value + 2 * 2,
                               loglik=ml$value,
                               cov=ml$hessian,
                               corr=ml$hessian[1,2] / 
                                    sqrt( prod( diag( ml$hessian ) ) ),
                               r0=R0,
                               r0.ci=c( lower=uplo[1], upper=uplo[2] ) ) )  

}

#hoehle: what is the purpose of this function??
## tmp <- function(){
##   ##Show likelihood surface
##   beta1.grid <- seq( max( eps, ml$par[1]-3*se[1] ), 
##                      ml$par[1]+3*se[1], length=50)
##   beta2.grid <- seq( max( eps, ml$par[2]-3*se[2] ), 
##                      ml$par[2]+3*se[2], length=50)

##   grid <- expand.grid(beta1.grid,beta2.grid)
##   #Normalized log-likelihood
##   vals <- matrix( apply( grid, MAR=1, loglik, expint=expint,
##                          makeLambda=makeLambda2 ), 
##                   length(beta1.grid), length(beta2.grid) )
##           - loglik( ml$par, makeLambda=makeLambda2, expint=expint )

##   #Show log-likelihood
##   contour( beta1.grid, beta2.grid, exp(vals), nlevel=20, 
##            xlab=expression(beta[w]), ylab=expression(beta[b]) )
##   points( ml$par[1], ml$par[2], cex=2, pch=3, col=2)
##   #95% Joint Highest Likelihood interval
##   contour( beta1.grid, beta2.grid,vals, levels=log(0.95), col=2,
##            add=T, lty=2, lwd=2)
##  }


