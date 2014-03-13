# -------------  class LBOptionsML  ---------------------------------------------

#setClass( "LBOptionsML", contains = "LBOptions" )


# show
setMethod( "show", "LBOptionsML", function( object ){
  cat( "An object of class LBOptionsML\n\n" )
  cat( "Options:\n" )
    cat( "  Seed:\n  " )
    print( seed( object ) )
    cat( "\n  LBModel:\n  " )
    print( LBModel( object ) )
    cat( "\n  IgnoreData:\n  " )
    print( ignoreData( object ) )
  cat( "InitialValues:\n" )
    cat( "  Beta:\n  " )
    print( initBeta( object ) )
    cat( "\n  BetaN:\n  " )
    print( initBetaN( object ) )
    cat( "\n  Inc:\n  " )
    print( initIncu( object ) )
    cat( "\n  Inf:\n  " )
    print( initInf( object ) )
    cat( "\n  Diag:\n  " )
    print( initDia( object ) )
} )


# >>> other Methods

# summary
setMethod( "summary", "LBOptionsML", function( object ){
  return( object )
} )

# writeOptionFile
setMethod( "writeOptionFile", "LBOptionsML",
function( object, filename="ladybug-ml.sir" ){
  df <- optionsAsDataFrame( object )

  df <- rbind( c( "(options", "" ),
               df,
               c( ")", "" ),
               c( "(method ml)", "" ) )

  write.table( df, filename, quote=FALSE, row.names=FALSE, col.names=FALSE )

  return( filename )
} )
