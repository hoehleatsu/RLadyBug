# -------------  class LBLayout  -----------------------------------------------

#setClass( "LBLayout", representation( S0 = "matrix",
#                                    E0 = "matrix" ) )


# show
setMethod( "show", "LBLayout", function( object ){
  cat( "An object of class LBLayout\n\n" )
  cat( "  S0:\n  " )
  print( object@S0 )
  cat( "\n  E0:\n  " )
  print( object@E0 )
} )


# >>> set-Methods

# setLBLayoutMatrixes
setReplaceMethod( "layoutMatrixes", "LBLayout", function( object, value ){
  val.names <- names( value )

  if( "S0"  %in% val.names ) object@S0  <- value$S0
  if( "E0"  %in% val.names ) object@E0  <- value$E0

  return( object )
} )


# >>> get-Methods

# layoutMatrixes
setMethod( "layoutMatrixes", "LBLayout", function( object ){
  return( list( S0=object@S0, E0=object@E0 ) )
} )

# layoutAsDataFrame
setMethod( "layoutAsDataFrame", "LBLayout", function( object ){
  S <- object@S0
  E <- object@E0

  if ( ncol( S ) != ncol( E ) || nrow( S ) != nrow( E ) ){
    stop( "Dimensions of S0 and E0 mustn't differ." )
  }

  mat <- matrix( NA, nrow= nrow(S) * ncol(S), ncol=5 )
  df  <- as.data.frame( mat )

  i <- 1
  for ( r in 1:nrow( S ) ) {
    for ( c in 1:ncol( S ) ) {
      df[ i, 1 ] <- "unit"
      df[ i, 2 ] <- r
      df[ i, 3 ] <- c
      df[ i, 4 ] <- S[ r, c ]
      df[ i, 5 ] <- E[ r, c ]
      i <- i+1
    }
  }
  
  names( df ) <- c( "u", "x", "y", "S", "E" )

  return( df )
} )


# >>> other methods

# summary
setMethod( "summary", "LBLayout", function( object ){
  return( object )
} )

