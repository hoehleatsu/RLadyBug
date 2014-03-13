# -------------  class LBOptions  -----------------------------------------------

# initialize
setMethod( "initialize", "LBOptions",
function( .Object, seed, LBmodel, ignoreData, 
                   initBeta, initBetaN, initIncu, initInf, initDia ){
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

  return( .Object )
} )

# show
setMethod( "show", "LBOptions", function( object ){
  cat( "An object of class LBOptions\n\n" )
  cat( "LBOptions:\n" )
    cat( "  Seed:\n  " )
    print( seed( object ) )
    cat( "\n  LBModel:\n  " )
    print( LBModel( object ) )
    cat( "\n  IgnoreData:\n  " )
    print( ignoreData( object ) )
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

# seed
setReplaceMethod( "seed", "LBOptions", function( object, value ){
  object@seed <- value
  return( object )
} )

# LBModel
setReplaceMethod( "LBModel", "LBOptions", function( object, value ){
  len <- length( value )
  vectorNames <- c( "incuTimePDF", "infTimePDF", "diagTimePDF", "meanVar" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- vectorNames[1:len]
  }

  if ( len < length( vectorNames ) ) {
    old <- LBModel( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the vector elements
  object@LBmodel <- value[ vectorNames ]
  return( object )
} )

# ignoreData
setReplaceMethod( "ignoreData", "LBOptions", function( object, value ){
  len <- length( value )
  vectorNames <- c( "ignoreE", "ignoreI", "ignoreD" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- vectorNames[1:len]
  }

  if ( len < length( vectorNames ) ) {
    old <- ignoreData( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the vector elements
  object@ignoreData <- value[ vectorNames ]
  return( object )
} )

# initBeta
setReplaceMethod( "initBeta", "LBOptions", function( object, value ){
  len <- length( value )
  listNames <- c( "init", "gamma", "delta" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- listNames[1:len]
  }

  if ( len < length( listNames ) ) {
    old <- initBeta( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the list elements
  object@initBeta <- value[ listNames ]
  return( object )
} )

# initBetaN
setReplaceMethod( "initBetaN", "LBOptions", function( object, value ){
  len <- length( value )
  listNames <- c( "init", "gamma", "delta" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- listNames[1:len]
  }

  if ( len < length( listNames ) ) {
    old <- initBetaN( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the list elements
  object@initBetaN <- value[ listNames ]
  return( object )
} )

# initIncu 
setReplaceMethod( "initIncu", "LBOptions", function( object, value ){
  len <- length( value )
  listNames <- c( "asis", "const", "const.val",
                  "g", "g.gamma", "g.delta",
                  "d", "d.gamma", "d.delta" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- listNames[1:len]
  }

  if ( len < length( listNames ) ) {
    old <- initIncu( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the list elements
  object@initIncu <- value[ listNames ]
  return( object )
} )

# initInf
setReplaceMethod( "initInf", "LBOptions", function( object, value ){
  len <- length( value )
  listNames <- c( "g", "g.gamma", "g.delta",
                  "d", "d.gamma", "d.delta" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- listNames[1:len]
  }

  if ( len < length( listNames ) ) {
    old <- initInf( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the list elements
  object@initInf <- value[ listNames ]
  return( object )
} )

# initDia
setReplaceMethod( "initDia", "LBOptions", function( object, value ){
  len <- length( value )
  listNames <- c( "g", "g.gamma", "g.delta",
                  "d", "d.gamma", "d.delta" )

  if ( is.null( names( value ) ) ) {
    names( value ) <- listNames[1:len]
  }

  if ( len < length( listNames ) ) {
    old <- initDia( object )
    old[ names( value ) ] <- value
    value <- old
  }

  # the following assignement has to be like this in order to keep the right
  # order of the list elements
  object@initDia <- value[ listNames ]
  return( object )
} )

# LBOptions
setReplaceMethod( "LBOptions", "LBOptions", function( object, value ){
  val.names <- names( value )

  if( "seed"       %in% val.names ) seed( object )       <- value$seed
  if( "LBmodel"    %in% val.names ) LBModel( object )    <- value$LBmodel
  if( "ignoreData" %in% val.names ) ignoreData( object ) <- value$ignoreData

  return( object )
} )

# LBInits
setReplaceMethod( "LBInits", "LBOptions", function( object, value ){
  val.names <- names( value )

  if( "initBeta"   %in% val.names ) initBeta( object )   <- value$initBeta
  if( "initBetaN"  %in% val.names ) initBetaN( object )  <- value$initBetaN
  if( "initInf"    %in% val.names ) initInf( object )    <- value$initInf
  if( "initIncu"   %in% val.names ) initIncu( object )   <- value$initIncu
  if( "initDia"    %in% val.names ) initDia( object )    <- value$initDia

  return( object )
} )


# >>> get-Methods

# seed
setMethod( "seed", "LBOptions", function( object ) {
  return( object@seed )
} )

# LBModel
setMethod( "LBModel", "LBOptions", function( object ) {
  return( object@LBmodel )
} )

# ignoreData
setMethod( "ignoreData", "LBOptions", function( object ) {
  return( object@ignoreData )
} )

# initBeta
setMethod( "initBeta", "LBOptions", function( object ){
  return( object@initBeta )
} )

# initBetaN
setMethod( "initBetaN", "LBOptions", function( object ){
  return( object@initBetaN )
} )

# initIncu
setMethod( "initIncu", "LBOptions", function( object ){
  return( object@initIncu )
} )

# initInf
setMethod( "initInf", "LBOptions", function( object ){
  return( object@initInf )
} )

# initDia
setMethod( "initDia", "LBOptions", function( object ){
  return( object@initDia )
} )

# LBOptions
setMethod( "LBOptions", "LBOptions", function( object ){
  return( list( seed       = seed( object ),
                LBmodel    = LBModel( object ),
                ignoreData = ignoreData( object ) ) )
} )

# LBInits
setMethod( "LBInits", "LBOptions", function( object ){
  return( list( initBeta  = initBeta( object ),
                initBetaN = initBetaN( object ),
                initIncu  = initIncu( object ),
                initInf   = initInf( object ),
                initDia   = initDia( object ) ) )
} )

# optionsAsDataFrame
setMethod( "optionsAsDataFrame", "LBOptions", function( object ){
  mat <- matrix( NA, nrow=8, ncol=2 )
  df <- as.data.frame( mat )

  df[1,] <- c( "seed=", seed( object ) )

  # the java script can't handle upper cases, so we need 'tolower' here
  model <- LBModel( object )
  df[2,] <- c( "incuTimePDF=", tolower( model[ "incuTimePDF" ] ) )
  df[3,] <- c( "infTimePDF=",  tolower( model[ "infTimePDF" ] ) )
  df[4,] <- c( "diagTimePDF=", tolower( model[ "diagTimePDF" ] ) )
  df[5,] <- c( "meanVar=",     tolower( model[ "meanVar" ] ) )

  # the java script can't handle upper cases, so we need 'tolower' here
  ignoreData <- ignoreData( object )
  df[6,] <- c( "ignoreE=", tolower( as.character( ignoreData[ "ignoreE" ] ) ) )
  df[7,] <- c( "ignoreI=", tolower( as.character( ignoreData[ "ignoreI" ] ) ) )
  df[8,] <- c( "ignoreD=", tolower( as.character( ignoreData[ "ignoreD" ] ) ) )

  return( df )

} )

# initsAsDataFrame
setMethod( "initsAsDataFrame", "LBOptions", function( object ){
  mat <- matrix( NA, ncol=7, nrow=5 )
  df <- as.data.frame( mat )

  i.beta <- initBeta( object )
  df[1,1:4] <- c( "beta", i.beta$gamma, i.beta$delta,
                          paste( "(", i.beta$init, ")", sep="" ) )

  i.betaN <- initBetaN( object )
  df[2,1:4] <- c( "betan", i.betaN$gamma, i.betaN$delta,
                           paste( "(", i.betaN$init, ")", sep="" ) )

  i.E <- initIncu( object )
  vec <- vector()

  if( i.E$asis == TRUE ) {
    vec <- c( "asis", "", "", "", "", "" )
  } else if( i.E$const == TRUE ) {
    vec <- c( "constant", i.E$const.val, "", "", "", "" )
  } else {
    vec <- c( i.E$g.gamma, i.E$g.delta,
             paste( "(", i.E$g, ")", sep="" ),
             i.E$d.gamma, i.E$d.delta,
             paste( "(", i.E$d, ")", sep="" ) )
  }

  df[3,1:7] <- c( "incu", vec )

  i.I <- initInf( object )
  df[4,1:7] <- c( "inf", i.I$g.gamma, i.I$g.delta,
                         paste( "(", i.I$g, ")", sep="" ),
                         i.I$d.gamma, i.I$d.delta,
                         paste( "(", i.I$d, ")", sep="" ) )

  i.D <- initDia( object )
  df[5,1:7] <- c( "diag", i.D$g.gamma, i.D$g.delta,
                          paste( "(", i.D$g, ")", sep="" ),
                          i.D$d.gamma, i.D$d.delta,
                          paste( "(", i.D$d, ")", sep="" ) )

  # replace NAs in df by ""
  df[is.na(df)] <- ""

  return( df )
} )

# --- sim() -------------------------------------------------------------
 
setMethod("simulate", signature(object = "LBOptions"),
           function(object, nsim = 1, seed = NULL, ...) {
  #Parse arguments Can only handle nsim=1 and
  args <- list(...)
  #print(args)
  layout <- args$layout
  options <- object

  #Convert data to file
  print(getwd())
  file.data <- paste( getwd(), writeDataFileSim( options, layout ),sep="/" )
  
  #Imitate the command line arguments.
  argv <- c(file.data, "traj","e0")

  #Create an instance of the ladybug class
  sir <- .jnew("sir/sim/SimSellke")

  ######################################################################
  #Call the main method (i.e. perform an estimation)
  #In the future this rather crude interface should be refined
  #by calling the different estimation methods directly.
  #Note: no backwards compatibility with the old LadyBug2.0 main method
  #      is intended
  ######################################################################
  seed <- as.integer(seed(options))
  cat("Calling LadyBug (monitor ladybug.system.out/err for progress)...")
  cat(.jcall(sir,"S","rJava_main",argv,seed),"\n")

  #Read the redirected standard out and standard error.
  out <- readLines("ladybug.system.out", n=-1)
  unlink("ladybug.system.out") # tidy up

  err <- readLines("ladybug.system.err", n=-1)
  unlink("ladybug.system.err") # tidy up

  #Check that no errors occured. 
  if ( any( grep( "^Error:", out, perl=TRUE )) |
      any( grep( "^Error:", err, perl=TRUE )) ) {
    cat("Standard out:\n")
    print( out )
    cat("Standard error:\n")
    print (err )
    stop("look at java output above" )
  } else {
    allLines <- readLines( "foobar.data", -1 )
    skip <- grep( "//x", allLines, fixed=TRUE )
    df <- read.table( "foobar.data", skip=skip )
    
    colnames( df ) <- c( "x", "y", "E", "I", "R", "D" )
    
    file.remove( file.data, "foobar.data", "foobar.all" )
    
    return( new( "LBExperiment", data=df, T=NaN,layout=layout ) )
  }
})

# --- END of sim() ------------------------------------------------------


# >>> other methods

# summary
setMethod( "summary", "LBOptions", function( object ){
  return( object )
} )

