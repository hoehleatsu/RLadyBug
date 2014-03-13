#source( "../test/LadyBug.R" )

# some pre definitions...
leereMatrix <- matrix( 0, ncol=0, nrow=0 )

mcmc.S0 <- matrix( 9, ncol=1, nrow=1 )
mcmc.E0 <- matrix( 1, ncol=1, nrow=1 )
mcmc.df <- as.data.frame( matrix( NA, nrow=1, ncol=5 ) )
mcmc.df[1,] <- list( "unit", 1, 1, 9, 1 )
names( mcmc.df ) <- c( "u", "x", "y", "S", "E" )
mcmc.epi <- as.data.frame( matrix( NA, nrow=3, ncol=4 ) )
mcmc.epi[1,] <- list( 1, 1, 1, "E" )
mcmc.epi[2,] <- list( 1, 1, 1, "I" )
mcmc.epi[3,] <- list( 1, 1, 1, "R" )
names( mcmc.epi ) <- c( "x", "y", "t", "type" )

ml.S0   <- matrix( c( 14, 14 ), ncol=2, nrow=1 )
ml.E0   <- matrix( c( 0, 1 ), ncol=2, nrow=1 )
ml.df <- as.data.frame( matrix( NA, nrow=2, ncol=5 ) )
ml.df[1,] <- list( "unit", 1, 1, 14, 0 )
ml.df[2,] <- list( "unit", 1, 2, 14, 1 )
names( ml.df ) <- c( "u", "x", "y", "S", "E" )
ml.t.df <- as.data.frame( matrix( NA, nrow=2, ncol=5 ) )
ml.t.df[1,] <- list( "unit", 1, 1, 14, 0 )
ml.t.df[2,] <- list( "unit", 2, 1, 14, 1 )
names( ml.t.df ) <- c( "u", "x", "y", "S", "E" )
ml.double.df <- as.data.frame( matrix( NA, nrow=2, ncol=5 ) )
ml.double.df[1,] <- list( "unit", 1, 1, 14, 0 )
ml.double.df[2,] <- list( "unit", 1, 2, 14, 1 )
ml.double.df[3,] <- list( "unit", 2, 1, 14, 0 )
ml.double.df[4,] <- list( "unit", 2, 2, 14, 1 )
names( ml.double.df ) <- c( "u", "x", "y", "S", "E" )

initial.seed <- 2006
initial.model <- c( incuTimePDF="gamma",
                    infTimePDF="gamma",
                    diagTimePDF="gamma",
                    meanVar="false" )
initial.ignoreData <- c( ignoreE=FALSE,
                         ignoreI=FALSE,
                         ignoreD=FALSE )
initial.Beta <- list( init=NA, gamma=0.001, delta=0.001 )
initial.BetaN <- list( init=NA, gamma=0.001, delta=0.001 )
initial.E <- list( asis=FALSE, const=FALSE, const.val=NA,
                   g=NA, g.gamma=0.001, g.delta=0.001,
                   d=NA, d.gamma=0.001, d.delta=0.001 )
initial.I <- list( g=NA, g.gamma=0.001, g.delta=0.001,
                   d=NA, d.gamma=0.001, d.delta=0.001 )
initial.D <- list( g=10, g.gamma=0.001, g.delta=0.001,
                   d=10, d.gamma=0.001, d.delta=0.001 )
initial.options <- list( seed=initial.seed, LBmodel=initial.model,
                         ignoreData=initial.ignoreData )
initial.inits   <- list( initBeta=initial.Beta, initBetaN=initial.BetaN,
                         initIncu=initial.E, initInf=initial.I, initDia=initial.D )
initial.algo <- c( samples=2500, thin=10, burnin=10000 )
initial.randomWalk <- c( betaRWsigma=NA,
                         betaNRWsigma=NA,
                         gammaERWsigma=NA,
                         deltaERWsigma=NA,
                         gammaIRWsigma=NA,
                         deltaIRWsigma=NA,
                         gammaDRWsigma=NA,
                         deltaDRWsigma=NA,
                         ERWsigma=NA )
options.df <- as.data.frame( matrix( NA, nrow=8, ncol=2 ) )
options.df[1,] <- list( "seed=", 2006 )
options.df[2,] <- list( "incuTimePDF=", "gamma" )
options.df[3,] <- list( "infTimePDF=", "gamma" )
options.df[4,] <- list( "diagTimePDF=", "gamma" )
options.df[5,] <- list( "meanVar=", "false" )
options.df[6,] <- list( "ignoreE=", "false" )
options.df[7,] <- list( "ignoreI=", "false" )
options.df[8,] <- list( "ignoreD=", "false" )

options.mcmc.df <- as.data.frame( matrix( NA, nrow=12, ncol=2 ) )
options.mcmc.df[1,]  <- list( "samples=", 2500)
options.mcmc.df[2,]  <- list( "thin=", 10 )
options.mcmc.df[3,]  <- list( "burnin=", 10000 )
options.mcmc.df[4,]  <- c( "betaRWsigma=", NA )
options.mcmc.df[5,]  <- c( "betaNRWsigma=", NA )
options.mcmc.df[6,]  <- c( "gammaERWsigma=", NA )
options.mcmc.df[7,]  <- c( "deltaERWsigma=", NA )
options.mcmc.df[8,]  <- c( "gammaIRWsigma=", NA )
options.mcmc.df[9,]  <- c( "deltaIRWsigma=", NA )
options.mcmc.df[10,] <- c( "gammaDRWsigma=", NA )
options.mcmc.df[11,] <- c( "deltaDRWsigma=", NA )
options.mcmc.df[12,] <- c( "ERWsigma=", NA )

inits.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
inits.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
inits.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
inits.df[3,] <- c( "incu", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
inits.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
inits.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )


ml.layout <- new( "LBLayout", S0=matrix( c( 14, 14 ), ncol=2 ),
                            E0=matrix( c( 0, 1 ),   ncol=2 ) )
x <- rep( 1, 29 )
y <- c( rep( 1, 14 ), rep( 2, 15 ) )
E <- c( 19, 19, 26, 23, 23, 19, 25, 17, 25, 17, 25, 21, 23, 23, 15, 0,
       7, 17, 7, 9, 7, 7, 7, 9, 15, 13, 17, 9, 13 )
I <- c( 25, 25, 32, 29, 29, 25, 31, 23, 31, 23, 31, 27, 29, 29, 21, 3,
       13, 23, 13, 15, 13, 13, 13, 15, 21, 19, 23, 15, 19 )
R <- c( 50, 61, 33, 51, 35, 44, 61, 27, 48, 28, 39, 46, 35, 31, 40, 9,
       41, 27, 15, 19, 21, 21, 21, 32, 46, 27, 50, 40, 45 )
D <- as.factor( c( 31, 33, "CE", 35, 35, 35, 43, 27, "CE", "CE", 39,
                  41, 35, 35, 31, 11, 23, 31, 19, 21, 27, 21, 23, 25,
                  39, 25, 31, 27, 31 ) )

ml.exp  <- new( "LBExperiment", data=data.frame( x, y, E, I, R, D ),
                              layout=ml.layout )
ml.opts <- new( "LBOptionsML", seed=2003,
                             LBmodel=c( "constant", "gamma", "gamma", FALSE ),
                             ignoreData=c( FALSE, FALSE, FALSE ),
                             initBeta =list( init=0.4,
                                             gamma=0.001, delta=0.001 ),
                             initBetaN=list( init=0.005,
                                             gamma=0.001, delta=0.001 ),
                             initIncu=list( asis=TRUE ),
                             initInf=list( 1, 0.001, 0.001, 0.11, 0.001, 0.001 ),
                             initDia=list( 8, 0.001, 0.001,  0.8, 0.001, 0.001 ) )



layout <- new( "LBLayout", S0=matrix( 9, ncol=1 ),
                         E0=matrix( 1, ncol=1 ) )
x <- rep( 1, 5 )
y <- rep( 1, 5 )
E <- rep( 0, 5 )
I <- as.factor( c( "(-2)", rep( "(-1)", 4 ) ) )
R <- c( 0, 1.52292, 1.55004, 1.93064, 2.67492 )
D <- rep( 10, 5 )

mcmc.exp  <- new( "LBExperiment", data=data.frame( x, y, E, I, R, D ),
                                layout=layout )
mcmc.opts <- new( "LBOptionsMCMC", seed=2004,
                                 LBmodel=c( "constant", "exp", "none", FALSE ),
                                 ignoreData=c( FALSE, FALSE, TRUE ),
                                 algo=c( 2500, 10, 10000 ),
                                 randomWalk=c( 0.1, 0.1, 3, 1, 1, 1,
                                               3, 1, 6 ),
                                 initBeta =list( init=0.1,
                                             gamma=0.1, delta=1 ),
                                 initBetaN=list( init=0.005,
                                             gamma=0.001, delta=0.001 ),
                                 initIncu=list( asis=FALSE, const=TRUE,
                                         const.val=1e-05 ),
                                 initInf=list( 1, 1, 1, 0.1, 0.1, 0.1 ),
                                 initDia=list( 1, 1, 1, 1, 1, 1 ) )


sim.layout <- new( "LBLayout", S0=matrix( c( 13, rep( 14, 7 ) ), ncol=4 ),
                             E0=matrix( c(  1, rep(  0, 7 ) ), ncol=4 ) )
sim.opts <- new( "LBOptions", seed=2006,
                            LBmodel=c( "gamma", "gamma", "gamma", FALSE ),
                            ignoreData=c( FALSE, FALSE, FALSE ),
                            initBeta =list( init=0.125,
                                        gamma=0.001, delta=0.001 ),
                            initBetaN=list( init=0.018,
                                        gamma=0.001, delta=0.001 ),
                            initIncu=list( asis=FALSE, const=FALSE,
                                    g=6.697, g.gamma=0.001, g.delta=0.001,
                                    d=0.84, d.gamma=0.001,d.delta=0.001 ),
                            initInf=list( 1.772, 0.001, 0.001, 0.123, 0.001, 0.001 ),
                            initDia=list( 149.126, 0.001, 0.001,
                                    8.737, 0.001, 0.001 ) )



# #####     test of class Layout     ##########################################

testRUnit.Layout.newLayout <- function() {
  layout <- new( "LBLayout" )
  checkTrue( is( layout, "LBLayout" ) )
  checkTrue( is.matrix( layout@S0 ) )
  checkTrue( is.matrix( layout@E0 ) )
  checkEquals( layout@S0, leereMatrix )
  checkEquals( layout@E0, leereMatrix )
  rm( layout )

  layout <- new( "LBLayout", S0=mcmc.S0 )
  checkTrue( is( layout, "LBLayout" ) )
  checkTrue( is.matrix( layout@S0 ) )
  checkTrue( is.matrix( layout@E0 ) )
  checkEquals( layout@S0, mcmc.S0 )
  checkEquals( layout@E0, leereMatrix )
  rm( layout )

  layout <- new( "LBLayout", E0=mcmc.E0 )
  checkTrue( is( layout, "LBLayout" ) )
  checkTrue( is.matrix( layout@S0 ) )
  checkTrue( is.matrix( layout@E0 ) )
  checkEquals( layout@S0, leereMatrix )
  checkEquals( layout@E0, mcmc.E0 )
  rm( layout )

  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  checkTrue( is( layout, "LBLayout" ) )
  checkTrue( is.matrix( layout@S0 ) )
  checkTrue( is.matrix( layout@E0 ) )
  checkEquals( layout@S0, mcmc.S0 )
  checkEquals( layout@E0, mcmc.E0 )
  rm( layout )  
}


testRUnit.Layout.setLayoutMatrixes <- function() {
  # set both matrices
    # there has been no matrix before...
    layout <- new( "LBLayout" )
    layoutMatrixes( layout ) <- list( S0=mcmc.S0, E0=mcmc.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) ) 
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, mcmc.S0 )
    checkEquals( layout@E0, mcmc.E0 )
    rm( layout )  

    # there hast been only S0 before...
    layout <- new( "LBLayout", S0=mcmc.S0 )
    layoutMatrixes( layout ) <- list( S0=ml.S0, E0=ml.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, ml.S0 )
    checkEquals( layout@E0, ml.E0 )
    rm( layout )  

    # there has been only E0 before...
    layout <- new( "LBLayout", E0=mcmc.E0 )
    layoutMatrixes( layout ) <- list( S0=ml.S0, E0=ml.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, ml.S0 )
    checkEquals( layout@E0, ml.E0 )
    rm( layout )  

    # there have been both matrices before...
    layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
    layoutMatrixes( layout ) <- list( S0=ml.S0, E0=ml.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, ml.S0 )
    checkEquals( layout@E0, ml.E0 )
    rm( layout )  

  # set only S0 matrix
    # there has been no matrix before...
    layout <- new( "LBLayout" )
    layoutMatrixes( layout ) <- list( S0=mcmc.S0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) ) 
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, mcmc.S0 )
    checkEquals( layout@E0, leereMatrix )
    rm( layout )  

    # there hast been only S0 before...
    layout <- new( "LBLayout", S0=mcmc.S0 )
    layoutMatrixes( layout ) <- list( S0=ml.S0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, ml.S0 )
    checkEquals( layout@E0, leereMatrix )
    rm( layout )  

    # there has been only E0 before...
    layout <- new( "LBLayout", E0=mcmc.E0 )
    layoutMatrixes( layout ) <- list( S0=ml.S0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, ml.S0 )
    checkEquals( layout@E0, mcmc.E0 )
    rm( layout )  

    # there have been both matrices before...
    layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
    layoutMatrixes( layout ) <- list( S0=ml.S0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, ml.S0 )
    checkEquals( layout@E0, mcmc.E0 )
    rm( layout )
    
  # set only E0 matrix
    # there has been no matrix before...
    layout <- new( "LBLayout" )
    layoutMatrixes( layout ) <- list( E0=mcmc.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) ) 
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, leereMatrix )
    checkEquals( layout@E0, mcmc.E0 )
    rm( layout )  

    # there hast been only S0 before...
    layout <- new( "LBLayout", S0=mcmc.S0 )
    layoutMatrixes( layout ) <- list( E0=ml.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, mcmc.S0 )
    checkEquals( layout@E0, ml.E0 )
    rm( layout )  

    # there has been only E0 before...
    layout <- new( "LBLayout", E0=mcmc.E0 )
    layoutMatrixes( layout ) <- list( E0=ml.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, leereMatrix )
    checkEquals( layout@E0, ml.E0 )
    rm( layout )  

    # there have been both matrices before...
    layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
    layoutMatrixes( layout ) <- list( E0=ml.E0 )
    checkTrue( is( layout, "LBLayout" ) )
    checkTrue( is.matrix( layout@S0 ) )
    checkTrue( is.matrix( layout@E0 ) )
    checkEquals( layout@S0, mcmc.S0 )
    checkEquals( layout@E0, ml.E0 )
    rm( layout )  
}


testRUnit.Layout.getLayoutMatrixes <- function() {
  # there is no matrix...
  layout <- new( "LBLayout" )
  m.list <- layoutMatrixes( layout )
  checkTrue( is.matrix( m.list$S0 ) )
  checkTrue( is.matrix( m.list$E0 ) )
  checkEquals( m.list$S0, leereMatrix )
  checkEquals( m.list$E0, leereMatrix )
  rm( m.list, layout )

  # there is only S0...
  layout <- new( "LBLayout", S0=mcmc.S0 )
  m.list <- layoutMatrixes( layout )
  checkTrue( is.matrix( m.list$S0 ) )
  checkTrue( is.matrix( m.list$E0 ) )
  checkEquals( m.list$S0, mcmc.S0 )
  checkEquals( m.list$E0, leereMatrix )
  rm( m.list, layout )

  # there is only E0...
  layout <- new( "LBLayout", E0=mcmc.E0 )
  m.list <- layoutMatrixes( layout )
  checkTrue( is.matrix( m.list$S0 ) )
  checkTrue( is.matrix( m.list$E0 ) )
  checkEquals( m.list$S0, leereMatrix )
  checkEquals( m.list$E0, mcmc.E0 )
  rm( m.list, layout )

  # there are both matrices...
  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  m.list <- layoutMatrixes( layout )
  checkTrue( is.matrix( m.list$S0 ) )
  checkTrue( is.matrix( m.list$E0 ) )
  checkEquals( m.list$S0, mcmc.S0 )
  checkEquals( m.list$E0, mcmc.E0 )
  rm( m.list, layout )
}


testRUnit.Layout.layoutAsDataFrame <- function() {
  # one row, one column
  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  df <- layoutAsDataFrame( layout )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, mcmc.df )
  rm( df, layout )

  # several rows, one column
  layout <- new( "LBLayout", S0=t( ml.S0 ), E0=t( ml.E0 ) )
  df <- layoutAsDataFrame( layout )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, ml.t.df )
  rm( df, layout )
  
  # one row, several columns
  layout <- new( "LBLayout", S0=ml.S0, E0=ml.E0 )
  df <- layoutAsDataFrame( layout )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, ml.df )
  rm( df, layout )

  # several rows, several columns
  layout <- new( "LBLayout", S0=rbind( ml.S0, ml.S0 ),
                           E0=rbind( ml.E0, ml.E0 ) )
  df <- layoutAsDataFrame( layout )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, ml.double.df )
  rm( df, layout )
  
  # only one matrix
  # -> should cause an error
  layout <- new( "LBLayout", S0=ml.S0 )
  checkException( layoutAsDataFrame( layout ), silent=TRUE )
  rm( layout )
  
  layout <- new( "LBLayout", E0=ml.E0 )
  checkException( layoutAsDataFrame( layout ), silent=TRUE )
  rm( layout )
  
  # differing dimensions
  # -> should cause an error
  layout <- new( "LBLayout", S0=mcmc.S0, E0=ml.E0 )
  checkException( layoutAsDataFrame( layout ), silent=TRUE )
  rm( layout )
  
  layout <- new( "LBLayout", S0=ml.S0, E0=mcmc.E0 )
  checkException( layoutAsDataFrame( layout ), silent=TRUE )
  rm( layout )
}


testRUnit.Layout.summary <- function() {
  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  my.summary <- summary( layout )
  checkTrue( is( my.summary, "LBLayout" ) )
  checkEquals( my.summary, layout )
  rm( layout, my.summary )
}



# #####     test of class Experiment     ######################################

testRUnit.Experiment.newExperiment <- function() {
  exp <- new( "LBExperiment" )
  checkTrue( is( exp@layout, "LBLayout" ) )
  checkTrue( is.data.frame( exp@data ) )
  checkEquals( exp@layout@S0, leereMatrix )
  checkEquals( exp@layout@E0, leereMatrix )
  rm( exp )
  
  exp <- new( "LBExperiment", data=mcmc.df )
  checkTrue( is( exp@layout, "LBLayout" ) )
  checkTrue( is.data.frame( exp@data ) )
  checkEquals( exp@layout@S0, leereMatrix )
  checkEquals( exp@layout@E0, leereMatrix )
  checkEquals( exp@data, mcmc.df )
  rm( exp )

  layout <- new( "LBLayout" )
  exp <- new("LBExperiment", layout=layout )
  checkTrue( is( exp@layout, "LBLayout" ) )
  checkTrue( is.data.frame( exp@data ) )
  checkEquals( exp@layout@S0, leereMatrix )
  checkEquals( exp@layout@E0, leereMatrix )
  rm( layout )

  layout <- new( "LBLayout" )
  exp <- new( "LBExperiment", data=mcmc.df, layout=layout )
  checkTrue( is( exp@layout, "LBLayout" ) )
  checkTrue( is.data.frame( exp@data ) )
  checkEquals( exp@layout@S0, leereMatrix )
  checkEquals( exp@layout@E0, leereMatrix )
  checkEquals( exp@data, mcmc.df )
  rm( exp, layout )

  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  exp <- new( "LBExperiment", data=mcmc.df, layout=layout )
  checkTrue( is( exp@layout, "LBLayout" ) )
  checkTrue( is.data.frame( exp@data ) )
  checkEquals( exp@layout@S0, mcmc.S0 )
  checkEquals( exp@layout@E0, mcmc.E0 )
  checkEquals( exp@data, mcmc.df )
  rm( exp, layout )
}


testRUnit.Experiment.data2events <- function() {  
  # there is neither data nor layout
  # -> should cause an error
  exp <- new( "LBExperiment" )
  checkException( data2events( exp ), silent=TRUE )
  rm( exp )

  # there are only data (no layout)
  exp <- new( "LBExperiment", data=mcmc.df )
  epi <- data2events( exp )
  checkTrue( is.data.frame( epi ) )
  checkEquals( epi, mcmc.epi )
  rm( exp, epi )

  # there is only layout (no data)
  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  exp <- new( "LBExperiment", layout=layout )
  checkException( data2events( exp ), silent=TRUE )
  rm( exp, layout )

  # there are data and layout
  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  exp <- new( "LBExperiment", data=mcmc.df, layout=layout )
  epi <- data2events( exp )
  checkTrue( is.data.frame( epi ) )
  checkEquals( epi, mcmc.epi )
  rm( epi, exp, layout )
}

testRUnit.Experiment.summary <- function() {
  layout <- new( "LBLayout", S0=mcmc.S0, E0=mcmc.E0 )
  exp <- new( "LBExperiment", data=mcmc.df, layout=layout )
  my.summary <- summary( exp )
  checkTrue( is( my.summary, "LBExperiment" ) )
  checkEquals( my.summary, exp )
  rm( exp, my.summary )
}


# #####     test of class Options     #########################################

testRUnit.Options.newOptions <- function() {
  opts <- new( "LBOptions" )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
  

  opts <- new( "LBOptions", seed=999,
                          LBmodel=c( "exp", "gamma", "exp", TRUE ),
                          ignoreData=c( FALSE, TRUE, TRUE ),
                          initBeta=list( 0.4, 0.01, 0.01 ),
                          initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ),
                          initIncu=list( const=TRUE, const.val=5 ),
                          initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                          initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 999 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE  ) )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE, ignoreI=TRUE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, list( init=0.4,
                                gamma=0.01,
                                delta=0.01 ) )
  checkEquals( opts@initBetaN, list( init=0.4,
                                 gamma=0.01,
                                 delta=0.01 ) )
  checkEquals( opts@initIncu, list( asis=FALSE,
                             const=TRUE,
                             const.val=5,
                             g=NA,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=NA,
                             d.gamma=0.001,
                             d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  rm( opts )

  
  opts <- new( "LBOptions", seed=999,
                          LBmodel=c( "exp", "gamma", "exp", TRUE ),
                          initIncu=list( const=TRUE, const.val=5 ),
                          initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                          initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 999 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE  ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE,
                             const=TRUE,
                             const.val=5,
                             g=NA,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=NA,
                             d.gamma=0.001,
                             d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  rm( opts )


  opts <- new( "LBOptions", seed=3422 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 3422 )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", LBmodel=c( incuTimePDF="exp", infTimePDF="gamma",
                                   diagTimePDF="exp", meanVar=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", LBmodel=c( incuTimePDF="gamma", infTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", LBmodel=c( diagTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", LBmodel=c( diagTimePDF="exp", incuTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", LBmodel=c( "exp", "exp", "gamma", TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", LBmodel=c( "exp", "exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", ignoreData=c( ignoreE=TRUE, ignoreI=FALSE,
                                        ignoreD=TRUE) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", ignoreData=c( ignoreE=FALSE, ignoreI=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", ignoreData=c( ignoreI=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", ignoreData=c( ignoreD=TRUE, ignoreE=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", ignoreData=c( TRUE, FALSE, TRUE) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", ignoreData=c( TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", initBeta=list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", initBeta=list( init=0.4, gamma=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBeta=list( delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBeta=list( delta=0.01, gamma=0.01, init=0.4 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBeta=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBeta=list( 0.4, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions", initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBetaN=list( init=0.4, gamma=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBetaN=list( delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initBetaN=list( delta=0.01, gamma=0.01, init=0.4 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBetaN=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initBetaN=list( 0.4, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initIncu=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                  d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initIncu=list( g.gamma=0.01, g.delta=0.01,d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initIncu=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initIncu=list( FALSE, FALSE, NA, 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initInf=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                  d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initInf=list( g.gamma=0.01, g.delta=0.01,d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initInf=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initInf=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions", initDia=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                  d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  rm( opts )


  opts <- new( "LBOptions", initDia=list( g.gamma=0.01, g.delta=0.01, d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )

  
  opts <- new( "LBOptions", initDia=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )

   
  opts <- new( "LBOptions", initDia=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=10, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )
}


testRUnit.Options.seed <- function() {
  # there is always a seed value before...
  # (2006)
  opts <- new( "LBOptions" )
  seed( opts ) <- 5432
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 5432 )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.LBModel <- function() {
  # there is always a model before...
  # (gamma, gamma, gamma, FALSE)
  opts <- new( "LBOptions" )
  LBModel( opts ) <- c( incuTimePDF="exp", infTimePDF="gamma",
                         diagTimePDF="exp", meanVar=TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions" )
  LBModel( opts ) <- c( incuTimePDF="gamma", infTimePDF="exp" )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions" )
  LBModel( opts ) <- c( diagTimePDF="exp" )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions" )
  LBModel( opts ) <- c( diagTimePDF="exp", incuTimePDF="exp" )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  LBModel( opts ) <- c( "exp", "exp", "gamma", TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  LBModel( opts ) <- c( "exp", "exp" )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.setIgnoreData <- function() {
  # there are always default values
  # (FALSE, FALSE, FALSE)
  opts <- new( "LBOptions" )
  ignoreData( opts ) <- c( ignoreE=TRUE, ignoreI=TRUE, ignoreD=TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=TRUE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  ignoreData( opts ) <- c( ignoreE=FALSE, ignoreI=TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  ignoreData( opts ) <- c( ignoreD=TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  ignoreData( opts ) <- c( ignoreD=TRUE, ignoreE=TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  ignoreData( opts ) <- c( TRUE, FALSE, TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  ignoreData( opts ) <- c( TRUE, TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.setInitBeta <- function() {  
  # there are always init values before...
  # ( init=NA, gamma=0.001, delta=0.001 )
  opts <- new( "LBOptions" )
  initBeta( opts ) <- list( init=0.4, gamma=0.01, delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions" )
  initBeta( opts ) <- list( init=0.4, gamma=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  initBeta( opts ) <- list( delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  initBeta( opts ) <- list( delta=0.01, gamma=0.01, init=0.4 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  initBeta( opts ) <- list( 0.4, 0.01, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptions" )
  initBeta( opts ) <- list( 0.4, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.setInitBetaN <- function() {  
  # there are always init values before...
  # ( init=NA, gamma=0.001, delta=0.001 )
  opts <- new( "LBOptions" )
  initBetaN( opts )=list( init=0.4, gamma=0.01, delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initBetaN( opts ) <- list( init=0.4, gamma=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initBetaN( opts ) <- list( delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initBetaN( opts ) <- list( delta=0.01, gamma=0.01, init=0.4 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initBetaN( opts ) <- list( 0.4, 0.01, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initBetaN( opts ) <- list( 0.4, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.setIncu <- function() {    
  # there are always init values before...
  # ( asis=FALSE, const=FALSE, const.val=NA,
  #   g=NA, g.gamma=0.001, g.delta=0.001, d=NA, d.gamma=0.001, d.delta=0.001 )
  opts <- new( "LBOptions" )
  initIncu( opts ) <- list( g=0.4, g.gamma=0.01, g.delta=0.01,
                        d=0.9, d.gamma=0.05, d.delta=0.05 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initIncu( opts ) <- list( g.gamma=0.01, g.delta=0.01, d=0.9 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initIncu( opts ) <- list( d=0.4, g.gamma=0.01, g.delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initIncu( opts ) <- list( FALSE, FALSE, NA, 0.4, 0.01, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initIncu( opts ) <- list( asis=TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initIncu( opts ) <- list( const=TRUE, const.val=1 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
  
  # there has been init value "asis=TRUE" before...
  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  initIncu( opts ) <- list( g=0.4, g.gamma=0.01, g.delta=0.01,
                        d=0.9, d.gamma=0.05, d.delta=0.05 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  initIncu( opts ) <- list( asis=FALSE, g.gamma=0.01, g.delta=0.01, d=0.9 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  initIncu( opts ) <- list( d=0.4, g.gamma=0.01, g.delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  initIncu( opts ) <- list( FALSE, FALSE, NA, 0.4, 0.01, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  initIncu( opts ) <- list( asis=FALSE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  initIncu( opts ) <- list( const=TRUE, const.val=1 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  initIncu( opts ) <- list( asis=FALSE, const=TRUE, const.val=1 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  # there has been init value "const=TRUE" before...
  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list( g=0.4, g.gamma=0.01, g.delta=0.01,
                        d=0.9, d.gamma=0.05, d.delta=0.05 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=1,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list(  const=FALSE, g.gamma=0.01, g.delta=0.01, d=0.9 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=1,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list( d=0.4, g.gamma=0.01, g.delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list( FALSE, FALSE, NA, 0.4, 0.01, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list( const=FALSE, const.val=NA )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list( const.val=5 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=5,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list( asis=TRUE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=1 ) )
  initIncu( opts ) <- list( asis=TRUE, const=FALSE )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=FALSE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.setInf <- function() {    
  # there are always init values before...
  # ( g=NA, g.gamma=0.001, g.delta=0.001, d=NA, d.gamma=0.001, d.delta=0.001 )
  opts <- new( "LBOptions" )
  initInf( opts ) <- list( g=0.4, g.gamma=0.01, g.delta=0.01,
                        d=0.9, d.gamma=0.05, d.delta=0.05 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initInf( opts ) <- list( g.gamma=0.01, g.delta=0.01,d=0.9 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initInf( opts ) <- list( d=0.4, g.gamma=0.01, g.delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  initInf( opts ) <- list( 0.4, 0.01, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.setDia <- function() {    
  # there are always init values before...
  # ( g=10, g.gamma=0.001, g.delta=0.001, d=10, d.gamma=0.001, d.delta=0.001 )
  opts <- new( "LBOptions" )
  initDia( opts ) <- list( g=0.4, g.gamma=0.01, g.delta=0.01,
                        d=0.9, d.gamma=0.05, d.delta=0.05 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  rm( opts )

  opts <- new( "LBOptions" )
  initDia( opts ) <- list( g.gamma=0.01, g.delta=0.01, d=0.9 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )

  opts <- new( "LBOptions" )
  initDia( opts ) <- list( d=0.4, g.gamma=0.01, g.delta=0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )

  opts <- new( "LBOptions" )
  initDia( opts ) <- list( 0.4, 0.01, 0.01 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=10, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )
}


testRUnit.Options.LBOptions <- function() {    
  # there are always options before...
  opts <- new( "LBOptions" )
  LBOptions( opts ) <- list( seed=3457,
                             LBmodel=c( "exp", "gamma", "exp", TRUE ),
                             ignoreData=c( TRUE, TRUE, FALSE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 3457 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  opts <- new( "LBOptions" )
  LBOptions( opts ) <- list( ignoreData=c( TRUE, TRUE, FALSE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptions" )
  LBOptions( opts ) <- list( LBmodel=c( "exp", "gamma", "exp", TRUE ),
                             ignoreData=c( TRUE, TRUE, FALSE ), seed=5433 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 5433 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.setLBInits <- function() {    
# there are always init values before...
  opts <- new( "LBOptions" )
  LBInits( opts ) <- list( initBeta=list( 0.4, 0.01, 0.01 ),
                           initBetaN=list( 0.9, 0.05, 0.05 ),
                           initIncu=list( const=TRUE, const.val=4 ),
                           initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                           initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, list( init=0.9, gamma=0.05, delta=0.05 ) )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=4,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  rm( opts )

  opts <- new( "LBOptions" )
  LBInits( opts ) <- list( initBeta=list( 0.4, 0.01, 0.01 ),
                           initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                           initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  rm( opts )

  
  opts <- new( "LBOptions" )
  LBInits( opts ) <- list( initBeta=list( 0.4, 0.01, 0.01 ),
                           initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                           initBetaN=list( 0.9, 0.05, 0.05 ),
                           initIncu=list( const=TRUE, const.val=4 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, list( init=0.9, gamma=0.05, delta=0.05 ) )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=4,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
}


testRUnit.Options.getSeed <- function() {    
  # there is always a seed value...
  opts <- new( "LBOptions", seed=999 )
  seed <- seed( opts )
  checkTrue( is.numeric( seed ) )
  checkEquals( opts@seed, seed )
  rm( seed, opts )
}
  

testRUnit.Options.getLBModel <- function() {    
  # there is always a model...
  opts <- new( "LBOptions", LBmodel=c( "exp", "gamma", "exp", TRUE ) )
  model <- LBModel( opts )
  checkTrue( is.vector( model ) )
  checkIdentical( model, opts@LBmodel )
  rm( model, opts )
}


testRUnit.Options.getIgnoreData <- function() {    
  # there are always ignoreData values...
  opts <- new( "LBOptions", ignoreData=c( TRUE, FALSE, TRUE ) )
  ign.data <- ignoreData( opts )
  checkTrue( is.vector( ign.data ) )
  checkIdentical( ign.data, opts@ignoreData )
  rm( ign.data, opts )
}


testRUnit.Options.getInitBeta <- function() {    
  # there are always init values...
  opts <- new( "LBOptions", initBeta=list( 0.4, 0.001, 0.001 ) )
  initBeta <- initBeta( opts )
  checkTrue( is.list( initBeta ) )
  checkEquals( initBeta, opts@initBeta )
  rm( initBeta, opts )
}
  

testRUnit.Options.getBetaN <- function() {    
  # there are always init values...
  opts <- new( "LBOptions", initBetaN=list( 0.4, 0.001, 0.001 ) )
  beta.n <- initBetaN( opts )
  checkTrue( is.list( beta.n ) )
  checkEquals( beta.n, opts@initBetaN )
  rm( beta.n, opts )
}


testRUnit.Options.getIncu <- function() {    
  # there are always init values...
  opts <- new( "LBOptions", initIncu=list( TRUE ) )
  e <- initIncu( opts )
  checkTrue( is.list( e ) )
  checkEquals( e, opts@initIncu )
  rm( e, opts )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=3 ) )
  e <- initIncu( opts )
  checkTrue( is.list( e ) )
  checkEquals( e, opts@initIncu )
  rm( e, opts )

  opts <- new( "LBOptions", initIncu=list( F, F, NA, 0.4, 0.001, 0.001,
                                            0.9, 0.05, 0.05 ) )
  e <- initIncu( opts )
  checkTrue( is.list( e ) )
  checkEquals( e, opts@initIncu )
  rm( e, opts )

  opts <- new( "LBOptions", initIncu=list( g.gamma=0.001, g.delta=0.001 ) )
  e <- initIncu( opts )
  checkTrue( is.list( e ) )
  checkEquals( e, opts@initIncu )
  rm( e, opts )
}


testRUnit.Options.getInf <- function() {    
  # there are always init values...
  opts <- new( "LBOptions", initInf=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ) )
  i <- initInf( opts )
  checkTrue( is.list( i ) )
  checkEquals( i, opts@initInf )
  rm( i, opts )

  opts <- new( "LBOptions", initInf=list( g.gamma=0.001, g.delta=0.001 ) )
  i <- initInf( opts )
  checkTrue( is.list( i ) )
  checkEquals( i, opts@initInf )
  rm( i, opts )
}


testRUnit.Options.getDiag <- function() {    
  # there are always init values...
  opts <- new( "LBOptions", initDia=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ) )
  d <- initDia( opts )
  checkTrue( is.list( d ) )
  checkEquals( d, opts@initDia )
  rm( d, opts )

  opts <- new( "LBOptions", initDia=list( g.gamma=0.001, g.delta=0.001 ) )
  d <- initDia( opts )
  checkTrue( is.list( d ) )
  checkEquals( d, opts@initDia )
  rm( d, opts )
}


testRUnit.Options.LBOptions <- function() {    
  # there are always options...
  opts <- new( "LBOptions" )
  my.opts <- LBOptions( opts )
  checkTrue( is.list( my.opts ) )
  checkEquals( my.opts, initial.options )
  rm( opts, my.opts )


  opts <- new( "LBOptions", seed=999, LBmodel=c( "exp", "gamma", "exp", TRUE ),
                          ignoreData=c( FALSE, TRUE, TRUE ) )
  my.opts <- LBOptions( opts )
  checkTrue( is.list( my.opts ) )
  checkEquals( my.opts, list( seed=999,
                              LBmodel=c( incuTimePDF="exp",
                                       infTimePDF="gamma",
                                       diagTimePDF="exp",
                                       meanVar=TRUE ),
                              ignoreData=c( ignoreE=FALSE,
                                            ignoreI=TRUE,
                                            ignoreD=TRUE ) ) )
  rm( opts, my.opts )
}


testRUnit.Options.LBInits <- function() {    
  # there are always init values...
  opts <- new( "LBOptions" )
  my.inits <- LBInits( opts )
  checkTrue( is.list( my.inits ) )
  checkEquals( my.inits, initial.inits )
  rm( opts, my.inits )


  opts <- new( "LBOptions", initBeta=list( 0.4, 0.01, 0.01 ),
                          initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                          initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  my.inits <- LBInits( opts )
  checkTrue( is.list( my.inits ) )
  checkEquals( my.inits, list( initBeta =list( init=0.4, gamma=0.01, delta=0.01 ),
                               initBetaN=list( init=NA, gamma=0.001, delta=0.001 ),
                               initIncu=list( asis=FALSE, const=FALSE, const.val=NA,
                                       g=NA, g.gamma=0.001, g.delta=0.001,
                                       d=NA, d.gamma=0.001, d.delta=0.001 ),
                               initInf=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                       d=0.9, d.gamma=0.05, d.delta=0.05 ),
                               initDia=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                       d=0.9, d.gamma=0.05, d.delta=0.05 ) ) )
  rm( opts, my.inits )


  opts <- new( "LBOptions", initBeta=list( 0.4, 0.01, 0.01 ),
                          initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ),
                          initIncu=list( const=TRUE, const.val=5 ),
                          initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                          initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  my.inits <- LBInits( opts )
  checkTrue( is.list( my.inits ) )
  checkEquals( my.inits, list( initBeta =list( init=0.4, gamma=0.01, delta=0.01 ),
                               initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ),
                               initIncu=list( asis=FALSE, const=TRUE, const.val=5,
                                       g=NA, g.gamma=0.001, g.delta=0.001,
                                       d=NA, d.gamma=0.001, d.delta=0.001 ),
                               initInf=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                       d=0.9, d.gamma=0.05, d.delta=0.05 ),
                               initDia=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                       d=0.9, d.gamma=0.05, d.delta=0.05 ) ) )
  rm( opts, my.inits )
}


testRUnit.Options.optionsAsDataFrame <- function() {    
  # there are always options...
  opts <- new( "LBOptions" )
  df <- optionsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, options.df )
  rm( opts, df )


  compare.df <- as.data.frame( matrix( NA, nrow=8, ncol=2 ) )
  compare.df[1,] <- list( "seed=", 999 )
  compare.df[2,] <- list( "incuTimePDF=", "exp" )
  compare.df[3,] <- list( "infTimePDF=", "gamma" )
  compare.df[4,] <- list( "diagTimePDF=", "exp" )
  compare.df[5,] <- list( "meanVar=", "true" )
  compare.df[6,] <- list( "ignoreE=", "false" )
  compare.df[7,] <- list( "ignoreI=", "true" )
  compare.df[8,] <- list( "ignoreD=", "true" )

  opts <- new( "LBOptions", seed=999,
                          LBmodel=c( incuTimePDF="exp", infTimePDF="gamma",
                                   diagTimePDF="exp", meanVar=TRUE ),
                          ignoreData=c( ignoreE=FALSE, ignoreI=TRUE,
                                        ignoreD=TRUE ) )
  df <- optionsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( compare.df, opts, df )
}


testRUnit.Options.initsAsDataFrame <- function() {    
  # there are always init values...
  opts <- new( "LBOptions" )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, inits.df )
  rm( df, opts )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.01, 0.01, "(0.4)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[4,] <- c( "inf", 0.01, 0.01, "(0.4)", 0.05, 0.05, "(0.9)" )
  compare.df[5,] <- c( "diag", 0.01, 0.01, "(0.4)", 0.05, 0.05, "(0.9)" )

  opts <- new( "LBOptions", initBeta=list( 0.4, 0.01, 0.01 ),
                          initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                          initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.01, 0.01, "(0.4)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.01, 0.01, "(0.4)", "", "", "" )
  compare.df[3,] <- c( "incu", "constant", 5, "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.01, 0.01, "(0.4)", 0.05, 0.05, "(0.9)" )
  compare.df[5,] <- c( "diag", 0.01, 0.01, "(0.4)", 0.05, 0.05, "(0.9)" )
  
  opts <- new( "LBOptions", initBeta=list( 0.4, 0.01, 0.01 ),
                          initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ),
                          initIncu=list( const=TRUE, const.val=5 ),
                          initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                          initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )

  
  # have a look at E:
  # if "asis=TRUE"...
  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "asis", "", "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )
  
  opts <- new( "LBOptions", initIncu=list( asis=TRUE ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )

  
  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "asis", "", "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )
  
  opts <- new( "LBOptions", initIncu=list( asis=TRUE, const=TRUE ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "asis", "", "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )
  
  opts <- new( "LBOptions", initIncu=list( asis=TRUE, const=TRUE, const.val=4 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "asis", "", "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE, const=FALSE, const.val=NA,
                                  0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "asis", "", "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )

  opts <- new( "LBOptions", initIncu=list( asis=TRUE, const=TRUE, const.val=4,
                                  0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )

  
  # if "asis=FALSE", "const=TRUE"...
  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "constant", "", "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )

  opts <- new( "LBOptions", initIncu=list( const=TRUE ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "constant", 4, "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=4 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", "constant", 4, "", "", "", "" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )

  opts <- new( "LBOptions", initIncu=list( const=TRUE, const.val=4,
                                  g=0.4, g.gamma=0.01, g.delta=0.01,
                                  d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  # if "asis=FALSE", "const=FALSE"...
  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )

  opts <- new( "LBOptions", initIncu=list( const.val=4 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", 0.01, 0.01, "(0.4)", 0.05, 0.05, "(0.9)" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )
  
  opts <- new( "LBOptions", initIncu=list( const.val=4,
                                  g=0.4, g.gamma=0.01, g.delta=0.01,
                                  d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )


  compare.df <- as.data.frame( matrix( NA, nrow=5, ncol=7 ) )
  compare.df[1,] <- c( "beta", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[2,] <- c( "betan", 0.001, 0.001, "(NA)", "", "", "" )
  compare.df[3,] <- c( "incu", 0.01, 0.01, "(0.4)", 0.05, 0.05, "(0.9)" )
  compare.df[4,] <- c( "inf", 0.001, 0.001, "(NA)", 0.001, 0.001, "(NA)" )
  compare.df[5,] <- c( "diag", 0.001, 0.001, "(10)", 0.001, 0.001, "(10)" )
  
  opts <- new( "LBOptions", initIncu=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                  d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  df <- initsAsDataFrame( opts )
  checkTrue( is.data.frame( df ) )
  checkEquals( df, compare.df )
  rm( df, opts, compare.df )
}


testRUnit.Options.summary <- function() {
  opts <- new( "LBOptions", seed=999,
                          LBmodel=c( "exp", "gamma", "exp", TRUE ),
                          ignoreData=c( FALSE, TRUE, TRUE ),
                          initBeta=list( 0.4, 0.01, 0.01 ),
                          initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ),
                          initIncu=list( const=TRUE, const.val=5 ),
                          initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                          initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  my.summary <- summary( opts )
  checkTrue( is( my.summary, "LBOptions" ) )
  checkEquals( my.summary, opts )
  rm( opts, my.summary )
}



######     test of class OptionsML     #########################################
testRUnit.OptionsML.newOptionsML <- function() {
  opts <- new( "LBOptionsML" )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )
  

  opts <- new( "LBOptionsML", seed=999,
                            LBmodel=c( "exp", "gamma", "exp", TRUE ),
                            ignoreData=c( FALSE, TRUE, TRUE ),
                            initBeta=list( 0.4, 0.01, 0.01 ),
                            initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ),
                            initIncu=list( const=TRUE, const.val=5 ),
                            initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                            initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 999 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE  ) )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE, ignoreI=TRUE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, list( init=0.4,
                                gamma=0.01,
                                delta=0.01 ) )
  checkEquals( opts@initBetaN, list( init=0.4,
                                 gamma=0.01,
                                 delta=0.01 ) )
  checkEquals( opts@initIncu, list( asis=FALSE,
                             const=TRUE,
                             const.val=5,
                             g=NA,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=NA,
                             d.gamma=0.001,
                             d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  rm( opts )

  
  opts <- new( "LBOptionsML", seed=999,
                            LBmodel=c( "exp", "gamma", "exp", TRUE ),
                            initIncu=list( const=TRUE, const.val=5 ),
                            initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                            initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 999 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE  ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE,
                             const=TRUE,
                             const.val=5,
                             g=NA,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=NA,
                             d.gamma=0.001,
                             d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  rm( opts )


  opts <- new( "LBOptionsML", seed=3422 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, 3422 )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", LBmodel=c( incuTimePDF="exp", infTimePDF="gamma",
                                     diagTimePDF="exp", meanVar=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", LBmodel=c( incuTimePDF="gamma", infTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", LBmodel=c( diagTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", LBmodel=c( diagTimePDF="exp", incuTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", LBmodel=c( "exp", "exp", "gamma", TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", LBmodel=c( "exp", "exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", ignoreData=c( ignoreE=TRUE, ignoreI=FALSE,
                                          ignoreD=TRUE) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", ignoreData=c( ignoreE=FALSE, ignoreI=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", ignoreData=c( ignoreI=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", ignoreData=c( ignoreD=TRUE, ignoreE=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", ignoreData=c( TRUE, FALSE, TRUE) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", ignoreData=c( TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", initBeta=list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", initBeta=list( init=0.4, gamma=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBeta=list( delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBeta=list( delta=0.01, gamma=0.01, init=0.4 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBeta=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBeta=list( 0.4, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBetaN=list( init=0.4, gamma=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBetaN=list( delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )

  
  opts <- new( "LBOptionsML", initBetaN=list( delta=0.01, gamma=0.01, init=0.4 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBetaN=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initBetaN=list( 0.4, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initIncu=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                    d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initIncu=list( g.gamma=0.01, g.delta=0.01,d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initIncu=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initIncu=list( FALSE, FALSE, NA, 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initIncu=list( asis=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initIncu=list( const=TRUE, const.val=1 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initInf=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                    d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initInf=list( g.gamma=0.01, g.delta=0.01,d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initInf=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initInf=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  rm( opts )


  opts <- new( "LBOptionsML", initDia=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                    d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  rm( opts )


  opts <- new( "LBOptionsML", initDia=list( g.gamma=0.01, g.delta=0.01,d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )

  
  opts <- new( "LBOptionsML", initDia=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )

   
  opts <- new( "LBOptionsML", initDia=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=10, d.gamma=0.001, d.delta=0.001 ) )
  rm( opts )
}


testRUnit.OptionsML.summary <- function() {
  opts <- new( "LBOptionsML", seed=999,
                            LBmodel=c( "exp", "gamma", "exp", TRUE ),
                            ignoreData=c( FALSE, TRUE, TRUE ),
                            initBeta=list( 0.4, 0.01, 0.01 ),
                            initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ),
                            initIncu=list( const=TRUE, const.val=5 ),
                            initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                            initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ) )
  my.summary <- summary( opts )
  checkTrue( is( my.summary, "LBOptionsML" ) )
  checkEquals( my.summary, opts )
  rm( opts, my.summary )
}


######     test of class OptionsMCMC     ####################################

testRUnit.OptionsMCMC.newOptionsMCMC <- function() {
  opts <- new( "LBOptionsMCMC" )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkEquals( opts@algo, initial.algo )
  checkEquals( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", seed=999, LBmodel=c( "exp", "gamma", "exp", TRUE ),
                              ignoreData=c( FALSE, TRUE, TRUE ),
                              initBeta=list( 0.4, 0.001, 0.001 ),
                              initBetaN=list( init=0.4, gamma=0.001, delta=0.001 ),
                              initIncu=list( const=TRUE, const.val=5 ),
                              initInf=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ),
                              initDia=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ),
                              algo=c( samples=10000, thin=20, burnin=2000 ),
                              randomWalk=c( "betaRWsigma"=0.1,
                                            "betaNRWsigma"=0.1,
                                            "gammaERWsigma"=0.1,
                                            "deltaERWsigma"=0.1,
                                            "gammaIRWsigma"=0.1,
                                            "deltaIRWsigma"=0.1,
                                            "gammaDRWsigma"=0.1,
                                            "deltaDRWsigma"=0.1,
                                            "ERWsigma"=0.1 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, 999 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE  ) )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE, ignoreI=TRUE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, list( init=0.4,
                                gamma=0.001,
                                delta=0.001 ) )
  checkEquals( opts@initBetaN, list( init=0.4,
                                 gamma=0.001,
                                 delta=0.001 ) )
  checkEquals( opts@initIncu, list( asis=FALSE,
                             const=TRUE,
                             const.val=5,
                             g=NA,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=NA,
                             d.gamma=0.001,
                             d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkIdentical( opts@algo, c( samples=10000, thin=20, burnin=2000 ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.1,
                                      "deltaERWsigma"=0.1,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=0.1,
                                      "deltaDRWsigma"=0.1,
                                      "ERWsigma"=0.1 ) )
  rm( opts )


  opts <- new( "LBOptionsMCMC", seed=999, LBmodel=c( "exp", "gamma", "exp", TRUE ),
                              initIncu=list( const=TRUE, const.val=5 ),
                              initInf=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                              initDia=list( 0.4, 0.01, 0.01, 0.9, 0.05, 0.05 ),
                              algo=c( samples=10000, thin=20, burnin=2000 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, 999 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE  ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE,
                             const=TRUE,
                             const.val=5,
                             g=NA,
                             g.gamma=0.001,
                             g.delta=0.001,
                             d=NA,
                             d.gamma=0.001,
                             d.delta=0.001 ) )
  checkEquals( opts@initInf, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkEquals( opts@initDia, list( g=0.4,
                             g.gamma=0.01,
                             g.delta=0.01,
                             d=0.9,
                             d.gamma=0.05,
                             d.delta=0.05 ) )
  checkIdentical( opts@algo, c( samples=10000, thin=20, burnin=2000 ) )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", seed=3422 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, 3422 )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", LBmodel=c( incuTimePDF="exp", infTimePDF="gamma",
                                       diagTimePDF="exp", meanVar=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", LBmodel=c( incuTimePDF="gamma", infTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", LBmodel=c( diagTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="gamma",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", LBmodel=c( diagTimePDF="exp", incuTimePDF="exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", LBmodel=c( "exp", "exp", "gamma", TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", LBmodel=c( "exp", "exp" ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="exp",
                                 diagTimePDF="gamma",
                                 meanVar="false" ) )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", ignoreData=c( ignoreE=FALSE, ignoreI=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", ignoreData=c( ignoreI=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE,
                                      ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", ignoreData=c( ignoreD=TRUE, ignoreE=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", ignoreData=c( TRUE, FALSE, TRUE) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", ignoreData=c( TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE,
                                      ignoreI=FALSE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBeta=list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBeta=list( init=0.4, gamma=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBeta=list( delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBeta=list( delta=0.01, gamma=0.01, init=0.4 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBeta=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBeta=list( 0.4, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBetaN=list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBetaN=list( init=0.4, gamma=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBetaN=list( delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=NA, gamma=0.001, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBetaN=list( delta=0.01, gamma=0.01, init=0.4 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBetaN=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.01 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initBetaN=list( 0.4, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, list( init=0.4, gamma=0.01, delta=0.001 ) )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initIncu=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                      d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initIncu=list( g.gamma=0.01, g.delta=0.01,d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initIncu=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initIncu=list( FALSE, FALSE, NA, 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=FALSE, const.val=NA,
                             g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initIncu=list( asis=TRUE ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=TRUE, const=FALSE, const.val=NA,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initIncu=list( const=TRUE, const.val=1 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, list( asis=FALSE, const=TRUE, const.val=1,
                             g=NA, g.gamma=0.001, g.delta=0.001,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initInf=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                      d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initInf=list( g.gamma=0.01, g.delta=0.01, d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initInf=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=NA, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initInf=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=NA, d.gamma=0.001, d.delta=0.001 ) )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initDia=list( g=0.4, g.gamma=0.01, g.delta=0.01,
                                      d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.05, d.delta=0.05 ) )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initDia=list( g.gamma=0.01, g.delta=0.01, d=0.9 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.9, d.gamma=0.001, d.delta=0.001 ) )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initDia=list( d=0.4, g.gamma=0.01, g.delta=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=10, g.gamma=0.01, g.delta=0.01,
                             d=0.4, d.gamma=0.001, d.delta=0.001 ) )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", initDia=list( 0.4, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, list( g=0.4, g.gamma=0.01, g.delta=0.01,
                             d=10, d.gamma=0.001, d.delta=0.001 ) )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC", algo=c( samples=3000, thin=50, burnin=2000 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, c( samples=3000, thin=50, burnin=2000 ) )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", algo=c( thin=50, samples=3000 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, c( samples=3000, thin=50, burnin=10000 ) )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", algo=c( 3000, 50, 2000 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, c( samples=3000, thin=50, burnin=2000 ) )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )


  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.01,
                                            "betaNRWsigma"=0.01,
                                            "gammaERWsigma"=0.01,
                                            "deltaERWsigma"=0.01,
                                            "gammaIRWsigma"=0.01,
                                            "deltaIRWsigma"=0.01,
                                            "gammaDRWsigma"=0.01,
                                            "deltaDRWsigma"=0.01,
                                            "ERWsigma"=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.01,
                                      "betaNRWsigma"=0.01,
                                      "gammaERWsigma"=0.01,
                                      "deltaERWsigma"=0.01,
                                      "gammaIRWsigma"=0.01,
                                      "deltaIRWsigma"=0.01,
                                      "gammaDRWsigma"=0.01,
                                      "deltaDRWsigma"=0.01,
                                      "ERWsigma"=0.01 ) )
  rm( opts )


  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.01,
                                            "betaNRWsigma"=0.01,
                                            "deltaERWsigma"=0.01,
                                            "gammaIRWsigma"=0.01,
                                            "deltaIRWsigma"=0.01,
                                            "gammaDRWsigma"=0.01,
                                            "ERWsigma"=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.01,
                                      "betaNRWsigma"=0.01,
                                      "gammaERWsigma"=NA,
                                      "deltaERWsigma"=0.01,
                                      "gammaIRWsigma"=0.01,
                                      "deltaIRWsigma"=0.01,
                                      "gammaDRWsigma"=0.01,
                                      "deltaDRWsigma"=NA,
                                      "ERWsigma"=0.01 ) )
  rm( opts )


  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.01,
                                            "gammaDRWsigma"=0.01,
                                            "deltaERWsigma"=0.01,
                                            "gammaIRWsigma"=0.01,
                                            "deltaDRWsigma"=0.01,
                                            "deltaIRWsigma"=0.01,
                                            "ERWsigma"=0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.01,
                                      "betaNRWsigma"=NA,
                                      "gammaERWsigma"=NA,
                                      "deltaERWsigma"=0.01,
                                      "gammaIRWsigma"=0.01,
                                      "deltaIRWsigma"=0.01,
                                      "gammaDRWsigma"=0.01,
                                      "deltaDRWsigma"=0.01,
                                      "ERWsigma"=0.01 ) )
  rm( opts )


  opts <- new( "LBOptionsMCMC", randomWalk=c( 0.01, 0.01, 0.01, 0.01 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, initial.ignoreData )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.01,
                                      "betaNRWsigma"=0.01,
                                      "gammaERWsigma"=0.01,
                                      "deltaERWsigma"=0.01,
                                      "gammaIRWsigma"=NA,
                                      "deltaIRWsigma"=NA,
                                      "gammaDRWsigma"=NA,
                                      "deltaDRWsigma"=NA,
                                      "ERWsigma"=NA ) )
  rm( opts )
}


testRUnit.OptionsMCMC.setAlgo <- function() {
  # there are always algo values before...
  opts <- new( "LBOptionsMCMC", algo=c( samples=10000, thin=10, burnin=100 ) )
  algo( opts ) <- c( samples=23000, thin=90, burnin=2000 )
  checkTrue( is.vector( opts@algo ) )
  checkIdentical( opts@algo, c( samples=23000, thin=90, burnin=2000 ) )
  rm( opts )

  opts <- new( "LBOptionsMCMC", algo=c( samples=10000, thin=10, burnin=100 ) )
  algo( opts ) <- c( burnin=2000, thin=90 )
  checkTrue( is.vector( opts@algo ) )
  checkIdentical( opts@algo, c( samples=10000, thin=90, burnin=2000 ) )
  rm( opts )
  
  opts <- new( "LBOptionsMCMC", algo=c( samples=10000, thin=10, burnin=100 ) )
  algo( opts ) <- c( 23000, 90 )
  checkTrue( is.vector( opts@algo ) )
  checkIdentical( opts@algo, c( samples=23000, thin=90, burnin=100 ) )
  rm( opts )
}


testRUnit.OptionsMCMC.setRandomWalk <- function() {
  # there haven't been random walk values before...
  opts <- new( "LBOptionsMCMC" )
  randomWalk( opts ) <- c( "betaRWsigma"=0.1,
                           "betaNRWsigma"=0.1,
                           "gammaERWsigma"=0.1,
                           "deltaERWsigma"=0.1,
                           "gammaIRWsigma"=0.1,
                           "deltaIRWsigma"=0.1,
                           "gammaDRWsigma"=0.1,
                           "deltaDRWsigma"=0.1,
                           "ERWsigma"=0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.1,
                                      "deltaERWsigma"=0.1,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=0.1,
                                      "deltaDRWsigma"=0.1,
                                      "ERWsigma"=0.1 ) )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC" )
  randomWalk( opts ) <- c( "betaRWsigma"=0.1,
                           "betaNRWsigma"=0.1,
                           "gammaIRWsigma"=0.1,
                           "deltaIRWsigma"=0.1,
                           "gammaDRWsigma"=0.1,
                           "ERWsigma"=0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=NA,
                                      "deltaERWsigma"=NA,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=0.1,
                                      "deltaDRWsigma"=NA,
                                      "ERWsigma"=0.1 ) )
  rm( opts )


  opts <- new( "LBOptionsMCMC" )
  randomWalk( opts ) <- c( "betaRWsigma"=0.1,
                           "gammaIRWsigma"=0.1,
                           "deltaIRWsigma"=0.1,
                           "betaNRWsigma"=0.1,
                           "gammaERWsigma"=0.1,
                           "deltaERWsigma"=0.1,
                           "ERWsigma"=0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.1,
                                      "deltaERWsigma"=0.1,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=NA,
                                      "deltaDRWsigma"=NA,
                                      "ERWsigma"=0.1 ) )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC" )
  randomWalk( opts ) <- c( 0.1, 0.1, 0.1, 0.1, 0.1, 0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.1,
                                      "deltaERWsigma"=0.1,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=NA,
                                      "deltaDRWsigma"=NA,
                                      "ERWsigma"=NA ) )
  rm( opts )

  
  # there have been algo values before...
  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaERWsigma"=0.2,
                                            "deltaERWsigma"=0.2,
                                            "gammaIRWsigma"=0.2,
                                            "deltaIRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ))
  randomWalk( opts ) <- c( "betaRWsigma"=0.1,
                           "betaNRWsigma"=0.1,
                           "gammaERWsigma"=0.1,
                           "deltaERWsigma"=0.1,
                           "gammaIRWsigma"=0.1,
                           "deltaIRWsigma"=0.1,
                           "gammaDRWsigma"=0.1,
                           "deltaDRWsigma"=0.1,
                           "ERWsigma"=0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.1,
                                      "deltaERWsigma"=0.1,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=0.1,
                                      "deltaDRWsigma"=0.1,
                                      "ERWsigma"=0.1 ) )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaERWsigma"=0.2,
                                            "deltaERWsigma"=0.2,
                                            "gammaIRWsigma"=0.2,
                                            "deltaIRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ))
  randomWalk( opts ) <- c( "betaRWsigma"=0.1,
                           "betaNRWsigma"=0.1,
                           "gammaIRWsigma"=0.1,
                           "deltaIRWsigma"=0.1,
                           "gammaDRWsigma"=0.1,
                           "ERWsigma"=0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.2,
                                      "deltaERWsigma"=0.2,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=0.1,
                                      "deltaDRWsigma"=0.2,
                                      "ERWsigma"=0.1 ) )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaERWsigma"=0.2,
                                            "deltaERWsigma"=0.2,
                                            "gammaIRWsigma"=0.2,
                                            "deltaIRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ))
  randomWalk( opts ) <- c( "betaRWsigma"=0.1,
                           "gammaIRWsigma"=0.1,
                           "deltaIRWsigma"=0.1,
                           "betaNRWsigma"=0.1,
                           "gammaERWsigma"=0.1,
                           "deltaERWsigma"=0.1,
                           "ERWsigma"=0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.1,
                                      "deltaERWsigma"=0.1,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=0.2,
                                      "deltaDRWsigma"=0.2,
                                      "ERWsigma"=0.1 ) )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaERWsigma"=0.2,
                                            "deltaERWsigma"=0.2,
                                            "gammaIRWsigma"=0.2,
                                            "deltaIRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ))
  randomWalk( opts ) <- c( 0.1, 0.1, 0.1, 0.1, 0.1, 0.1 )
  checkTrue( is.vector( opts@randomWalk ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.1,
                                      "betaNRWsigma"=0.1,
                                      "gammaERWsigma"=0.1,
                                      "deltaERWsigma"=0.1,
                                      "gammaIRWsigma"=0.1,
                                      "deltaIRWsigma"=0.1,
                                      "gammaDRWsigma"=0.2,
                                      "deltaDRWsigma"=0.2,
                                      "ERWsigma"=0.2 ) )
  rm( opts )
}
  

testRUnit.OptionsMCMC.LBOptions <- function() {
  # there are always options before...
  opts <- new( "LBOptionsMCMC" )
  LBOptions( opts ) <- list( seed=3457,
                             LBmodel=c( "exp", "gamma", "exp", TRUE ),
                             ignoreData=c( TRUE, TRUE, FALSE ),
                             algo=c( samples=250000, thin=20, burnin=2000 ),
                             randomWalk=c( "betaRWsigma"=0.2,
                                           "betaNRWsigma"=0.2,
                                           "gammaERWsigma"=0.2,
                                           "deltaERWsigma"=0.2,
                                           "gammaIRWsigma"=0.2,
                                           "deltaIRWsigma"=0.2,
                                           "gammaDRWsigma"=0.2,
                                           "deltaDRWsigma"=0.2,
                                           "ERWsigma"=0.2 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, 3457 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE, ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, c( samples=250000, thin=20, burnin=2000 ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.2,
                                      "betaNRWsigma"=0.2,
                                      "gammaERWsigma"=0.2,
                                      "deltaERWsigma"=0.2,
                                      "gammaIRWsigma"=0.2,
                                      "deltaIRWsigma"=0.2,
                                      "gammaDRWsigma"=0.2,
                                      "deltaDRWsigma"=0.2,
                                      "ERWsigma"=0.2 ) )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC" )
  LBOptions( opts ) <- list( ignoreData=c( TRUE, TRUE, FALSE ),
                             randomWalk=c( "betaRWsigma"=0.2,
                                           "betaNRWsigma"=0.2,
                                           "gammaERWsigma"=0.2,
                                           "deltaERWsigma"=0.2,
                                           "gammaIRWsigma"=0.2,
                                           "deltaIRWsigma"=0.2,
                                           "gammaDRWsigma"=0.2,
                                           "deltaDRWsigma"=0.2,
                                           "ERWsigma"=0.2 ) )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, initial.seed )
  checkIdentical( opts@LBmodel, initial.model )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE, ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, initial.algo )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.2,
                                      "betaNRWsigma"=0.2,
                                      "gammaERWsigma"=0.2,
                                      "deltaERWsigma"=0.2,
                                      "gammaIRWsigma"=0.2,
                                      "deltaIRWsigma"=0.2,
                                      "gammaDRWsigma"=0.2,
                                      "deltaDRWsigma"=0.2,
                                      "ERWsigma"=0.2 ) )
  rm( opts )

  
  opts <- new( "LBOptionsMCMC" )
  LBOptions( opts ) <- list( algo=c( samples=250000, thin=20, burnin=2000 ),
                             LBmodel=c( "exp", "gamma", "exp", TRUE ),
                             ignoreData=c( TRUE, TRUE, FALSE ),
                             seed=5433 )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, 5433 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, c( ignoreE=TRUE, ignoreI=TRUE,
                                      ignoreD=FALSE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, c( samples=250000, thin=20, burnin=2000 ) )
  checkIdentical( opts@randomWalk, initial.randomWalk )
  rm( opts )
}


testRUnit.OptionsMCMC.getAlgo <- function() {
  # there are always algo values...
  opts <- new( "LBOptionsMCMC" )
  my.algo <- algo( opts )
  is.vector( my.algo )
  checkIdentical( my.algo, initial.algo )
  rm( opts, my.algo )


  opts <- new( "LBOptionsMCMC", algo=c( samples=250000, thin=20, burnin=2000 ) )
  my.algo <- algo( opts )
  is.vector( my.algo )
  checkIdentical( my.algo, c( samples=250000, thin=20, burnin=2000 ) )
  rm( opts, my.algo )
}


testRUnit.OptionsMCMC.getRandomWalk <- function() {
  # there are no random walk values...
  opts <- new( "LBOptionsMCMC" )
  my.randomWalk <- randomWalk( opts )
  is.vector( my.randomWalk )
  checkIdentical( my.randomWalk, initial.randomWalk )
  rm( opts, my.randomWalk )
  
  # there are some random walk values...
  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ) )
  my.randomWalk <- randomWalk( opts )
  is.vector( my.randomWalk )
  checkIdentical( my.randomWalk, c( betaRWsigma   = 0.2,
                                    betaNRWsigma  = 0.2,
                                    gammaERWsigma = NA,
                                    deltaERWsigma = NA,
                                    gammaIRWsigma = NA,
                                    deltaIRWsigma = NA,
                                    gammaDRWsigma = 0.2,
                                    deltaDRWsigma = 0.2,
                                    ERWsigma      = 0.2 ) )
  rm( opts, my.randomWalk )
  

  # there are all random walk values...
  opts <- new( "LBOptionsMCMC", randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaERWsigma"=0.2,
                                            "deltaERWsigma"=0.2,
                                            "gammaIRWsigma"=0.2,
                                            "deltaIRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ) )
  my.randomWalk <- randomWalk( opts )
  is.vector( my.randomWalk )
  checkIdentical( my.randomWalk, c( betaRWsigma   = 0.2,
                                    betaNRWsigma  = 0.2,
                                    gammaERWsigma = 0.2,
                                    deltaERWsigma = 0.2,
                                    gammaIRWsigma = 0.2,
                                    deltaIRWsigma = 0.2,
                                    gammaDRWsigma = 0.2,
                                    deltaDRWsigma = 0.2,
                                    ERWsigma      = 0.2 ) )
  rm( opts, my.randomWalk )
}

  
testRUnit.OptionsMCMC.LBOptions <- function() {
  # there are always options...
  opts <- new( "LBOptionsMCMC", seed=999,
                              LBmodel=c( "exp", "gamma", "exp", TRUE ),
                              ignoreData=c( FALSE, TRUE, TRUE ),
                              algo=c( samples=250000, thin=20, burnin=2000 ),
                              randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaERWsigma"=0.2,
                                            "deltaERWsigma"=0.2,
                                            "gammaIRWsigma"=0.2,
                                            "deltaIRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ) )
  LBOptions( opts )
  checkTrue( is.numeric( opts@seed ) )
  checkTrue( is.vector( opts@LBmodel ) )
  checkTrue( is.vector( opts@ignoreData ) )
  checkTrue( is.list( opts@initBeta ) )
  checkTrue( is.list( opts@initBetaN ) )
  checkTrue( is.list( opts@initIncu ) )
  checkTrue( is.list( opts@initInf ) )
  checkTrue( is.list( opts@initDia ) )
  checkTrue( is.vector( opts@algo ) )
  checkTrue( is.vector( opts@randomWalk ) )
  checkEqualsNumeric( opts@seed, 999 )
  checkIdentical( opts@LBmodel, c( incuTimePDF="exp",
                                 infTimePDF="gamma",
                                 diagTimePDF="exp",
                                 meanVar=TRUE ) )
  checkIdentical( opts@ignoreData, c( ignoreE=FALSE, ignoreI=TRUE,
                                      ignoreD=TRUE ) )
  checkEquals( opts@initBeta, initial.Beta )
  checkEquals( opts@initBetaN, initial.BetaN )
  checkEquals( opts@initIncu, initial.E )
  checkEquals( opts@initInf, initial.I )
  checkEquals( opts@initDia, initial.D )
  checkIdentical( opts@algo, c( samples=250000, thin=20, burnin=2000 ) )
  checkIdentical( opts@randomWalk, c( "betaRWsigma"=0.2,
                                      "betaNRWsigma"=0.2,
                                      "gammaERWsigma"=0.2,
                                      "deltaERWsigma"=0.2,
                                      "gammaIRWsigma"=0.2,
                                      "deltaIRWsigma"=0.2,
                                      "gammaDRWsigma"=0.2,
                                      "deltaDRWsigma"=0.2,
                                      "ERWsigma"=0.2 ) )
  rm( opts )
}


testRUnit.OptionsMCMC.optionsAsDataFrame <- function() {
  # there are always options...
  opts <- new( "LBOptionsMCMC" )
  my.df.list <- optionsAsDataFrame( opts )
  is.list( my.df.list )
  my.df.1 <- my.df.list[[1]]
  is.data.frame( my.df.1 )
  checkEquals( my.df.1, options.df )
  my.df.2 <- my.df.list[[2]]
  is.data.frame( my.df.2 )
  checkEquals( my.df.2, options.mcmc.df )
  rm( opts, my.df.list, my.df.1, my.df.2 )


  compare.df.1 <- as.data.frame( matrix( NA, nrow=8, ncol=2 ) )
  compare.df.1[1,] <- list( "seed=", 999 )
  compare.df.1[2,] <- list( "incuTimePDF=", "exp" )
  compare.df.1[3,] <- list( "infTimePDF=", "gamma" )
  compare.df.1[4,] <- list( "diagTimePDF=", "exp" )
  compare.df.1[5,] <- list( "meanVar=", "true" )
  compare.df.1[6,] <- list( "ignoreE=", "false" )
  compare.df.1[7,] <- list( "ignoreI=", "true" )
  compare.df.1[8,] <- list( "ignoreD=", "true" )

  compare.df.2 <- as.data.frame( matrix( NA, nrow=12, ncol=2 ) )
  compare.df.2[1,]  <- list( "samples=", 250000)
  compare.df.2[2,]  <- list( "thin=", 20 )
  compare.df.2[3,]  <- list( "burnin=", 2000 )
  compare.df.2[4,]  <- c( "betaRWsigma=", 0.2 )
  compare.df.2[5,]  <- c( "betaNRWsigma=", 0.2 )
  compare.df.2[6,]  <- c( "gammaERWsigma=", 0.2 )
  compare.df.2[7,]  <- c( "deltaERWsigma=", 0.2 )
  compare.df.2[8,]  <- c( "gammaIRWsigma=", 0.2 )
  compare.df.2[9,]  <- c( "deltaIRWsigma=", 0.2 )
  compare.df.2[10,]  <- c( "gammaDRWsigma=", 0.2 )
  compare.df.2[11,]  <- c( "deltaDRWsigma=", 0.2 )
  compare.df.2[12,]  <- c( "ERWsigma=", 0.2 )

  opts <- new( "LBOptionsMCMC", seed=999,
                              LBmodel=c( incuTimePDF="exp", infTimePDF="gamma",
                                       diagTimePDF="exp", meanVar=TRUE ),
                              ignoreData=c( ignoreE=FALSE,
                                            ignoreI=TRUE,
                                            ignoreD=TRUE ),
                              algo=c( samples=250000, thin=20, burnin=2000 ),
                              randomWalk=c( "betaRWsigma"=0.2,
                                            "betaNRWsigma"=0.2,
                                            "gammaERWsigma"=0.2,
                                            "deltaERWsigma"=0.2,
                                            "gammaIRWsigma"=0.2,
                                            "deltaIRWsigma"=0.2,
                                            "gammaDRWsigma"=0.2,
                                            "deltaDRWsigma"=0.2,
                                            "ERWsigma"=0.2 ) )
  my.df.list <- optionsAsDataFrame( opts )
  is.list( my.df.list )
  my.df.1 <- my.df.list[[1]]
  is.data.frame( my.df.1 )
  checkEquals( my.df.1, compare.df.1 )
  my.df.2 <- my.df.list[[2]]
  is.data.frame( my.df.2 )
  checkEquals( my.df.2, compare.df.2 )
  rm( opts, my.df.list, my.df.1, my.df.2 )
}


testRUnit.OptionsMCMC.summary <- function() {
  opts <- new( "LBOptionsMCMC", seed=999, LBmodel=c( "exp", "gamma", "exp", TRUE ),
                              ignoreData=c( FALSE, TRUE, TRUE ),
                              initBeta=list( 0.4, 0.001, 0.001 ),
                              initBetaN=list( init=0.4, gamma=0.001, delta=0.001 ),
                              initIncu=list( const=TRUE, const.val=5 ),
                              initInf=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ),
                              initDia=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ),
                              algo=c( samples=10000, thin=20, burnin=2000 ),
                              randomWalk=c( "betaRWsigma"=0.1,
                                            "betaNRWsigma"=0.1,
                                            "gammaERWsigma"=0.1,
                                            "deltaERWsigma"=0.1,
                                            "gammaIRWsigma"=0.1,
                                            "deltaIRWsigma"=0.1,
                                            "gammaDRWsigma"=0.1,
                                            "deltaDRWsigma"=0.1,
                                            "ERWsigma"=0.1 ) )
  my.summary <- summary( opts )
  checkTrue( is( my.summary, "LBOptionsMCMC" ) )
  checkEquals( my.summary, opts )
  rm( opts, my.summary )
}



# #####     test of class Inference     ######################################

testRUnit.Inference.newInference <- function() {
  inf <- new( "LBInference" )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkEquals( inf@paramHat, vector( mode="numeric" ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, vector( mode="numeric" ) )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  rm( inf )

  
  inf <- new( "LBInference", paramHat=c( beta=1, betaN=1,
                                       gammaE=1, deltaE=1,
                                       gammaI=1, deltaI=1,
                                       gammaD=1, deltaD=1 ),
                           paramSe=c( beta=2, betaN=2, gammaE=2, deltaE=2,
                                      gammaI=2, deltaI=2, gammaD=2, deltaD=2 ),
                           loglik=-122, aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                                  gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )

  
  inf <- new( "LBInference", paramHat=c( beta=1, betaN=1,
                                       gammaE=1, deltaE=1,
                                       gammaI=1, deltaI=1,
                                       gammaD=1, deltaD=1 ),
                           aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  rm( inf )


  inf <- new( "LBInference", loglik=-122, aic=400,
                           paramHat=c( beta=1, betaN=1,
                                       gammaE=1, deltaE=1,
                                       gammaI=1, deltaI=1,
                                       gammaD=1, deltaD=1 ),
                           paramSe=c( beta=2, betaN=2,
                                      gammaE=2, deltaE=2,
                                      gammaI=2, deltaI=2,
                                      gammaD=2, deltaD=2 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2,
                                  gammaE=2, deltaE=2,
                                  gammaI=2, deltaI=2,
                                  gammaD=2, deltaD=2 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )

  
  inf <- new( "LBInference", loglik=-122, aic=400,
                           paramHat=c( beta=1, betaN=1,
                                       gammaI=1, deltaI=1,
                                       gammaD=1, deltaD=1 ),
                           paramSe=c( beta=2, betaN=2,
                                      gammaI=2, deltaI=2,
                                      gammaD=2, deltaD=2 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2,
                                  gammaI=2, deltaI=2,
                                  gammaD=2, deltaD=2 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )


  inf <- new( "LBInference", loglik=-122, aic=400,
                           paramHat=c( beta=1, betaN=1,
                                       gammaD=1, deltaD=1 ),
                           paramSe=c( beta=2, betaN=2,
                                      gammaI=2, deltaI=2,
                                      gammaD=2, deltaD=2 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaD=1, deltaD=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2,
                                  gammaI=2, deltaI=2,
                                  gammaD=2, deltaD=2 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )
}


testRUnit.Inference.setInfValues <- function() {
  # there are no inf values before...
  inf <- new( "LBInference" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            paramSe=c( beta=2, betaN=2,
                                       gammaE=2, deltaE=2,
                                       gammaI=2, deltaI=2,
                                       gammaD=2, deltaD=2 ),
                            loglik=-122, aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                                  gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )
  

  inf <- new( "LBInference" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  rm( inf )

  
  inf <- new( "LBInference" )
  infValues( inf ) <- list( loglik=-122, aic=400,
                            paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )


  # there are inf values before...
  inf <- new( "LBInference", paramHat=c( beta=3, betaN=3,
                                       gammaE=3, deltaE=3,
                                       gammaI=3, deltaI=3,
                                       gammaD=3, deltaD=3 ),
                           paramSe=c( beta=3, betaN=3, gammaE=3, deltaE=3,
                                      gammaI=3, deltaI=3, gammaD=3, deltaD=3 ),
                           loglik=-555, aic=555 )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            paramSe=c( beta=2, betaN=2,
                                       gammaE=2, deltaE=2,
                                       gammaI=2, deltaI=2,
                                       gammaD=2, deltaD=2 ),
                            loglik=-122, aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                                  gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )


  inf <- new( "LBInference", paramHat=c( beta=3, betaN=3,
                                       gammaE=3, deltaE=3,
                                       gammaI=3, deltaI=3,
                                       gammaD=3, deltaD=3 ),
                           paramSe=c( beta=3, betaN=3, gammaE=3, deltaE=3,
                                      gammaI=3, deltaI=3, gammaD=3, deltaD=3 ),
                           loglik=-555, aic=555 )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=3, betaN=3, gammaE=3, deltaE=3,
                               gammaI=3, deltaI=3, gammaD=3, deltaD=3 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEquals( inf@loglik, -555 )
  rm( inf )
  

  inf <- new( "LBInference", paramHat=c( beta=3, betaN=3,
                                       gammaE=3, deltaE=3,
                                       gammaI=3, deltaI=3,
                                       gammaD=3, deltaD=3 ),
                           paramSe=c( beta=3, betaN=3, gammaE=3, deltaE=3,
                                      gammaI=3, deltaI=3, gammaD=3, deltaD=3 ),
                           loglik=-555, aic=555 )
  infValues( inf ) <- list( loglik=-122, aic=400,
                            paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1,
                                   gammaE=1, deltaE=1,
                                   gammaI=1, deltaI=1,
                                   gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=3, betaN=3, gammaE=3, deltaE=3,
                               gammaI=3, deltaI=3, gammaD=3, deltaD=3 ) )
  checkEqualsNumeric( inf@aic, 400 )
  checkEqualsNumeric( inf@loglik, -122 )
  rm( inf )
}  


testRUnit.Inference.infValues <- function() {
  # there are no inf values...
  inf <- new( "LBInference" )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=vector( mode="numeric" ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=vector( mode="numeric" ),
                                   loglik=vector( mode="numeric" ) ) )
  rm( inf, my.infvalues )


  # there are some inf values...
  inf <- new( "LBInference", paramHat=c( beta=1, betaN=1,
                                       gammaE=1, deltaE=1,
                                       gammaI=1, deltaI=1,
                                       gammaD=1, deltaD=1 ),
                           loglik=-122, aic=400 )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1,
                                               gammaE=1, deltaE=1,
                                               gammaI=1, deltaI=1,
                                               gammaD=1, deltaD=1 ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=400, loglik=-122 ) )
  rm( inf, my.infvalues )


  # there are all inf values...
  inf <- new( "LBInference", paramHat=c( beta=1, betaN=1,
                                       gammaE=1, deltaE=1,
                                       gammaI=1, deltaI=1,
                                       gammaD=1, deltaD=1 ),
                           paramSe=c( beta=2, betaN=2, gammaE=2, deltaE=2,
                                      gammaI=2, deltaI=2, gammaD=2, deltaD=2 ),
                           loglik=-122, aic=400 )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1,
                                               gammaE=1, deltaE=1,
                                               gammaI=1, deltaI=1,
                                               gammaD=1, deltaD=1 ),
                                   paramSe=c( beta=2, betaN=2,
                                              gammaE=2, deltaE=2,
                                              gammaI=2, deltaI=2,
                                              gammaD=2, deltaD=2 ),
                                   aic=400, loglik=-122 ) )
  rm( inf, my.infvalues )
}


testRUnit.Inference.summary <- function() {
  inf <- new( "LBInference", paramHat=c( beta=1, betaN=1,
                                       gammaE=1, deltaE=1,
                                       gammaI=1, deltaI=1,
                                       gammaD=1, deltaD=1 ),
                           loglik=-122, aic=400 )
  my.summary <- summary( inf )
  checkTrue( is( my.summary, "LBInference" ) )
  checkEquals( my.summary, inf )
  rm( inf, my.summary )
}



# #####     test of class InferenceML     ######################################
testRUnit.InferenceML.newInferenceML <- function() {
  inf <- new( "LBInferenceML" )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, vector( mode="numeric" ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, vector( mode="numeric" ) )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@cov, leereMatrix )
  checkEquals( inf@corr, vector( mode="numeric" ) )
  rm( inf )


  inf <- new( "LBInferenceML", paramHat=c( beta=1, betaN=1,
                                         gammaE=1, deltaE=1,
                                         gammaI=1, deltaI=1,
                                         gammaD=1, deltaD=1 ),
                             paramSe=c( beta=2, betaN=2,
                                        gammaE=2, deltaE=2,
                                        gammaI=2, deltaI=2,
                                        gammaD=2, deltaD=2 ),
                             loglik=-122, aic=400,
                             cov=matrix( 1:9, ncol=3), corr=c(0.5, -0.8 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                               gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:9, ncol=3 ) )
  checkEquals( inf@corr, c( 0.5, -0.8 ) )
  rm( inf )


  inf <- new( "LBInferenceML", paramHat=c( beta=1, betaN=1,
                                         gammaE=1, deltaE=1,
                                         gammaI=1, deltaI=1,
                                         gammaD=1, deltaD=1 ),
                             aic=400, corr=c( 0.5, -0.8 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@cov, leereMatrix )
  checkEquals( inf@corr, c( 0.5, -0.8 ) )
  rm( inf )

  
  inf <- new( "LBInferenceML", loglik=-122, aic=400, cov=matrix( 1:9, ncol=3),
                             paramHat=c( beta=1, betaN=1,
                                         gammaE=1, deltaE=1,
                                         gammaI=1, deltaI=1,
                                         gammaD=1, deltaD=1 ),
                             paramSe=c( beta=2, betaN=2,
                                        gammaE=2, deltaE=2,
                                        gammaI=2, deltaI=2,
                                        gammaD=2, deltaD=2 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                               gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:9, ncol=3 ) )
  checkEquals( inf@corr, vector( mode="numeric" ) )
  rm( inf )
}


testRUnit.InferenceML.setInfValues <- function() {
  # there are no inf values before...
  inf <- new( "LBInferenceML" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            paramSe=c( beta=2, betaN=2,
                                       gammaE=2, deltaE=2,
                                       gammaI=2, deltaI=2,
                                       gammaD=2, deltaD=2 ),
                            loglik=-122, aic=400,
                            cov=matrix( 1:9, ncol=3), corr=c(0.5, -0.8 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                               gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:9, ncol=3 ) )
  checkEquals( inf@corr, c( 0.5, -0.8 ) )
  rm( inf )
  

  inf <- new( "LBInferenceML" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            aic=400, corr=c( 0.5, -0.8 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@cov, leereMatrix )
  checkEquals( inf@corr, c( 0.5, -0.8 ) )
  rm( inf )
  

  inf <- new( "LBInferenceML" )
  infValues( inf ) <- list( loglik=-122, aic=400,
                            cov=matrix( 1:9, ncol=3),
                            paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:9, ncol=3 ) )
  checkEquals( inf@corr, vector( mode="numeric" ) )
  rm( inf )


  # there are inf values before...
  inf <- new( "LBInferenceML", paramHat=c( beta=3, betaN=3,
                                         gammaE=3, deltaE=3,
                                         gammaI=3, deltaI=3,
                                         gammaD=3, deltaD=3 ),
                             paramSe=c( beta=3, betaN=3,
                                        gammaE=3, deltaE=3,
                                        gammaI=3, deltaI=3,
                                        gammaD=3, deltaD=3 ),
                             loglik=-555, aic=555,
                             cov=matrix( 5, ncol=3 ), corr=c( 0.5, 0.5 ) )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            paramSe=c( beta=2, betaN=2,
                                       gammaE=2, deltaE=2,
                                       gammaI=2, deltaI=2,
                                       gammaD=2, deltaD=2 ),
                            loglik=-122, aic=400,
                            cov=matrix( 1:9, ncol=3), corr=c(0.5, -0.8 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                               gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:9, ncol=3 ) )
  checkEquals( inf@corr, c( 0.5, -0.8 ) )
  rm( inf )


  inf <- new( "LBInferenceML", paramHat=c( beta=3, betaN=3,
                                         gammaE=3, deltaE=3,
                                         gammaI=3, deltaI=3,
                                         gammaD=3, deltaD=3 ),
                             paramSe=c( beta=3, betaN=3,
                                        gammaE=3, deltaE=3,
                                        gammaI=3, deltaI=3,
                                        gammaD=3, deltaD=3 ),
                             loglik=-555, aic=555,
                             cov=matrix( 5, ncol=3 ), corr=c( 0.5, 0.5 ) )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            aic=400, corr=c( 0.5, -0.8 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=3, betaN=3, gammaE=3, deltaE=3,
                               gammaI=3, deltaI=3, gammaD=3, deltaD=3 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -555 )
  checkEquals( inf@cov, matrix( 5, ncol=3 ) )
  checkEquals( inf@corr, c( 0.5, -0.8 ) )
  rm( inf )


  inf <- new( "LBInferenceML", paramHat=c( beta=3, betaN=3,
                                         gammaE=3, deltaE=3,
                                         gammaI=3, deltaI=3,
                                         gammaD=3, deltaD=3 ),
                             paramSe=c( beta=3, betaN=3,
                                        gammaE=3, deltaE=3,
                                        gammaI=3, deltaI=3,
                                        gammaD=3, deltaD=3 ),
                             loglik=-555, aic=555,
                             cov=matrix( 5, ncol=3 ), corr=c( 0.5, 0.5 ) )
  infValues( inf ) <- list( loglik=-122, aic=400,
                            cov=matrix( 1:9, ncol=3),
                            paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=3, betaN=3, gammaE=3, deltaE=3,
                               gammaI=3, deltaI=3, gammaD=3, deltaD=3 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:9, ncol=3 ) )
  checkEquals( inf@corr, c( 0.5, 0.5 ) )
  rm( inf )
}


testRUnit.InferenceML.getInfValues <- function() {
  # there are no inf values...
  inf <- new( "LBInferenceML" )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=vector( mode="numeric" ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=vector( mode="numeric" ),
                                   loglik=vector( mode="numeric" ),
                                   cov=leereMatrix,
                                   corr=vector( mode="numeric" ) ) )
  rm( inf, my.infvalues )
 
  
  # there are some inf values...
  inf <- new( "LBInferenceML", paramHat=c( beta=1, betaN=1,
                                         gammaE=1, deltaE=1,
                                         gammaI=1, deltaI=1,
                                         gammaD=1, deltaD=1 ),
                             loglik=-122, aic=400,
                             corr=c( 0.5, -0.8 ) )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1,
                                               gammaE=1, deltaE=1,
                                               gammaI=1, deltaI=1,
                                               gammaD=1, deltaD=1 ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=400,
                                   loglik=-122,
                                   cov=leereMatrix,
                                   corr=c( 0.5, -0.8 ) ) )
  rm( inf, my.infvalues )


  # there are all inf values...
  inf <- new( "LBInferenceML", paramHat=c( beta=1, betaN=1,
                                         gammaE=1, deltaE=1,
                                         gammaI=1, deltaI=1,
                                         gammaD=1, deltaD=1 ),
                             paramSe=c( beta=2, betaN=2,
                                        gammaE=2, deltaE=2,
                                        gammaI=2, deltaI=2,
                                        gammaD=2, deltaD=2 ),
                             loglik=-122, aic=400,
                             cov=matrix( 1:9, ncol=3 ), corr=c( 0.5, -0.8 ) )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1,
                                               gammaE=1, deltaE=1,
                                               gammaI=1, deltaI=1,
                                               gammaD=1, deltaD=1 ),
                                   paramSe=c( beta=2, betaN=2,
                                              gammaE=2, deltaE=2,
                                              gammaI=2, deltaI=2,
                                              gammaD=2, deltaD=2 ),
                                   aic=400,
                                   loglik=-122,
                                   cov=matrix( 1:9, ncol=3 ),
                                   corr=c( 0.5, -0.8 ) ) )
  rm( inf, my.infvalues )
}


testRUnit.InferenceML.summary <- function() {
  inf <- new( "LBInferenceML", paramHat=c( beta=1, betaN=1,
                                         gammaE=1, deltaE=1,
                                         gammaI=1, deltaI=1,
                                         gammaD=1, deltaD=1 ),
                             loglik=-122, aic=400,
                             corr=c( 0.5, -0.8 ) )
  my.summary <- summary( inf )
  checkTrue( is( my.summary, "LBInferenceML" ) )
  checkEquals( my.summary, inf )
  rm( inf, my.summary )
}


# #####     test of class InferenceMLK    ######################################
testRUnit.InferenceMLK.newInferenceMLK <- function() {
  inf <- new( "LBInferenceMLK" )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric(  inf@r0 ) )
  checkTrue( is.numeric(  inf@r0.ci ) )
  checkEquals( inf@paramHat, vector( mode="numeric" ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, vector( mode="numeric" ) )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@cov, leereMatrix )
  checkEquals( inf@corr, vector( mode="numeric" ) )
  checkEquals( inf@r0, vector( mode="numeric" ) )
  checkEquals( inf@r0.ci, vector( mode="numeric" ) )
  rm( inf )


  inf <- new( "LBInferenceMLK", paramHat=c( beta=1, betaN=1 ),
                              paramSe=c( beta=2, betaN=2 ),
                              loglik=-122, aic=400,
                              cov=matrix( 1:4, ncol=2), corr=0.5,
                              r0=3.3, r0.ci=c( lower=1, upper=5 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric(  inf@r0 ) )
  checkTrue( is.numeric(  inf@r0.ci ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:4, ncol=2) )
  checkEquals( inf@corr, 0.5 )
  checkEquals( inf@r0, 3.3 )
  checkIdentical( inf@r0.ci, c( lower=1, upper=5 ) )
  rm( inf )


  inf <- new( "LBInferenceMLK", paramHat=c( beta=1, betaN=1 ),
                              aic=400, corr=0.5, r0=3.3 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric(  inf@r0 ) )
  checkTrue( is.numeric(  inf@r0.ci ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@cov, leereMatrix )
  checkEquals( inf@corr, 0.5 )
  checkEquals( inf@r0, 3.3 )
  checkIdentical( inf@r0.ci, vector( mode="numeric" ) )
  rm( inf )

  
  inf <- new( "LBInferenceMLK", loglik=-122, r0.ci=c( lower=1, upper=5 ),
                              aic=400, cov=matrix( 1:4, ncol=2 ),
                              paramHat=c( beta=1, betaN=1 ),
                              paramSe=c( beta=2, betaN=2 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric(  inf@r0 ) )
  checkTrue( is.numeric(  inf@r0.ci ) )
  checkIdentical( inf@paramHat, c( beta=1, betaN=1 ) )
  checkIdentical( inf@paramSe, c( beta=2, betaN=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:4, ncol=2 ) )
  checkEquals( inf@corr, vector( mode="numeric" ) )
  checkEquals( inf@r0, vector( mode="numeric" ) )
  checkIdentical( inf@r0.ci, c( lower=1, upper=5 ) )
  rm( inf )
}


testRUnit.InferenceMLK.setInfValues <- function() {
  # there are no inf values before...
  inf <- new( "LBInferenceMLK" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1 ),
                            paramSe=c( beta=2, betaN=2 ),
                            loglik=-122, aic=400,
                            cov=matrix( 1:4, ncol=2), corr=0.5,
                            r0=3.3, r0.ci=c( lower=1, upper=5 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric( inf@r0 ) )
  checkTrue( is.numeric( inf@r0.ci ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:4, ncol=2 ) )
  checkEqualsNumeric( inf@corr, 0.5 )
  checkEqualsNumeric( inf@r0, 3.3 )
  checkIdentical( inf@r0.ci, c( lower=1, upper=5 ) )
  rm( inf )
  

  inf <- new( "LBInferenceMLK" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1 ),
                            aic=400, corr=0.5,
                            r0.ci=c( lower=1, upper=5 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric( inf@r0 ) )
  checkTrue( is.numeric( inf@r0.ci ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@cov, leereMatrix )
  checkEquals( inf@corr, 0.5 )
  checkEquals( inf@r0, vector( mode="numeric" ) )
  checkIdentical( inf@r0.ci, c( lower=1, upper=5 ) )
  rm( inf )
  

  inf <- new( "LBInferenceMLK" )
  infValues( inf ) <- list( loglik=-122, r0=3.3, aic=400,
                            cov=matrix( 1:4, ncol=2),
                            paramHat=c( beta=1, betaN=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric( inf@r0 ) )
  checkTrue( is.numeric( inf@r0.ci ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:4, ncol=2 ) )
  checkEquals( inf@corr, vector( mode="numeric" ) )
  checkEqualsNumeric( inf@r0, 3.3 )
  checkEquals( inf@r0.ci, vector( mode="numeric" ) )
  rm( inf )


  # there are inf values before...
  inf <- new( "LBInferenceMLK", paramHat=c( beta=3, betaN=3 ),
                              paramSe=c( beta=3, betaN=3 ),
                              loglik=-555, aic=555,
                              cov=matrix( 5, ncol=2 ), corr=0.9,
                              r0=7, r0.ci=c( lower=5, upper=9 ) )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1 ),
                            paramSe=c( beta=2, betaN=2 ),
                            loglik=-122, aic=400,
                            cov=matrix( 1:4, ncol=2), corr=0.5,
                            r0=3.3, r0.ci=c( lower=1, upper=5 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric( inf@r0 ) )
  checkTrue( is.numeric( inf@r0.ci ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:4, ncol=2 ) )
  checkEqualsNumeric( inf@corr, 0.5 )
  checkEqualsNumeric( inf@r0, 3.3 )
  checkIdentical( inf@r0.ci, c( lower=1, upper=5 ) )
  rm( inf )


  inf <- new( "LBInferenceMLK", paramHat=c( beta=3, betaN=3 ),
                              paramSe=c( beta=3, betaN=3 ),
                              loglik=-555, aic=555,
                              cov=matrix( 5, ncol=2 ), corr=0.9,
                              r0=7, r0.ci=c( lower=5, upper=9 ) )
  infValues( inf ) <- list( paramSe=c( beta=1, betaN=1 ),
                            aic=400, corr=0.5,
                            r0.ci=c( lower=1, upper=5 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric( inf@r0 ) )
  checkTrue( is.numeric( inf@r0.ci ) )
  checkEquals( inf@paramHat, c( beta=3, betaN=3 ) )
  checkEquals( inf@paramSe, c( beta=1, betaN=1 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -555 )
  checkEquals( inf@cov, matrix( 5, ncol=2 ) )
  checkEqualsNumeric( inf@corr, 0.5 )
  checkEqualsNumeric( inf@r0, 7 )
  checkIdentical( inf@r0.ci, c( lower=1, upper=5 ) )
  rm( inf )


  inf <- new( "LBInferenceMLK", paramHat=c( beta=3, betaN=3 ),
                              paramSe=c( beta=3, betaN=3 ),
                              loglik=-555, aic=555,
                              cov=matrix( 5, ncol=2 ), corr=0.9,
                              r0=7, r0.ci=c( lower=5, upper=9 ) )
  infValues( inf ) <- list( loglik=-122, r0=3.3, aic=400,
                            cov=matrix( 1:4, ncol=2),
                            paramHat=c( beta=1, betaN=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric( inf@r0 ) )
  checkTrue( is.numeric( inf@r0.ci ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1 ) )
  checkEquals( inf@paramSe, c( beta=3, betaN=3 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@cov, matrix( 1:4, ncol=2 ) )
  checkEqualsNumeric( inf@corr, 0.9 )
  checkEqualsNumeric( inf@r0, 3.3 )
  checkIdentical( inf@r0.ci, c( lower=5, upper=9 ) )
  rm( inf )
}


testRUnit.InferenceMLK.getInfValues <- function() {
  # there are no inf values...
  inf <- new( "LBInferenceMLK" )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=vector( mode="numeric" ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=vector( mode="numeric" ),
                                   loglik=vector( mode="numeric" ),
                                   cov=leereMatrix,
                                   corr=vector( mode="numeric" ),
                                   r0=vector( mode="numeric" ),
                                   r0.ci=vector( mode="numeric" ) ) )
  rm( inf, my.infvalues )
 
  
  # there are some inf values...
  inf <- new( "LBInferenceMLK", paramHat=c( beta=1, betaN=1 ),
                              loglik=-122, aic=400,
                              corr=0.5, r0=3.3 )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1 ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=400,
                                   loglik=-122,
                                   cov=leereMatrix,
                                   corr=0.5,
                                   r0=3.3,
                                   r0.ci=vector( mode="numeric" ) ) )
  rm( inf, my.infvalues )


  # there are all inf values...
  inf <- new( "LBInferenceMLK", paramHat=c( beta=1, betaN=1 ),
                              paramSe=c( beta=2, betaN=2 ),
                              loglik=-122, aic=400,
                              cov=matrix( 1:4, ncol=2 ), corr=0.5,
                              r0=3.3, r0.ci=c( 0.5, 0.8 )  )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1 ),
                                   paramSe=c( beta=2, betaN=2 ),
                                   aic=400,
                                   loglik=-122,
                                   cov=matrix( 1:4, ncol=2 ),
                                   corr=0.5,
                                   r0=3.3,
                                   r0.ci=c( 0.5, 0.8 ) ) )
  rm( inf, my.infvalues )
}


testRUnit.InferenceMLK.summary <- function() {
  # there are some inf values...
  inf <- new( "LBInferenceMLK", paramHat=c( beta=1, betaN=1 ),
                              loglik=-122, aic=400,
                              corr=0.5, r0=3.3 )
  my.summary <- summary( inf )
  checkTrue( is( my.summary, "LBInferenceMLK" ) )
  checkEquals( my.summary, inf )
  rm( inf, my.summary )
}

# #####     test of class InferenceMCMC    ###################################

testRUnit.InferenceMCMC.newInferenceMCMC <- function() {
  inf <- new( "LBInferenceMCMC" )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, vector( mode="numeric" ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, vector( mode="numeric" ) )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@samplePaths, data.frame() )
  rm( inf )

  
  inf <- new( "LBInferenceMCMC", paramHat=c( beta=1, betaN=1,
                                           gammaE=1, deltaE=1,
                                           gammaI=1, deltaI=1,
                                           gammaD=1, deltaD=1 ),
                               paramSe=c( beta=2, betaN=2,
                                          gammaE=2, deltaE=2,
                                          gammaI=2, deltaI=2,
                                          gammaD=2, deltaD=2 ),
                               loglik=-122, aic=400,
                               samplePaths=as.data.frame(
                                           matrix( 1:9, ncol=3) ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1,gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                               gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@samplePaths, as.data.frame( matrix( 1:9, ncol=3) ) )
  rm( inf )

  
  inf <- new( "LBInferenceMCMC", paramHat=c( beta=1, betaN=1,
                                           gammaE=1, deltaE=1,
                                           gammaI=1, deltaI=1,
                                           gammaD=1, deltaD=1 ),
                               aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1,gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@samplePaths, data.frame() )
  rm( inf )

  
  inf <- new( "LBInferenceMCMC", loglik=-122, aic=400,
                               samplePaths=as.data.frame(
                                           matrix( 1:9, ncol=3) ),
                               paramSe=c( beta=2, betaN=2,
                                          gammaE=2, deltaE=2,
                                          gammaI=2, deltaI=2,
                                          gammaD=2, deltaD=2 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, vector( mode="numeric" ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                               gammaI=2, deltaI=2, gammaD=2, deltaD=2
                               ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@samplePaths, as.data.frame( matrix( 1:9, ncol=3) ) )
  rm( inf )
}


testRUnit.InferenceMCMC.setInfValues <- function() {
  # there haven't been inference values before...
  inf <- new( "LBInferenceMCMC" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            paramSe=c( beta=2, betaN=2,
                                       gammaE=2, deltaE=2,
                                       gammaI=2, deltaI=2,
                                       gammaD=2, deltaD=2 ),
                            loglik=-122, aic=400,
                            samplePaths=as.data.frame(
                                        matrix( 1:9, ncol=3 ) ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1,gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=2, betaN=2, gammaE=2, deltaE=2,
                               gammaI=2, deltaI=2, gammaD=2, deltaD=2 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@samplePaths, as.data.frame( matrix( 1:9, ncol=3) ) )
  rm( inf )

  
  inf <- new( "LBInferenceMCMC" )
  infValues( inf ) <- list( paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ),
                            aic=400 )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1,gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, vector( mode="numeric" ) )
  checkEquals( inf@samplePaths, data.frame() )
  rm( inf )

  
  inf <- new( "LBInferenceMCMC" )
  infValues( inf ) <- list( loglik=-122, aic=400,
                            samplePaths=as.data.frame(
                                        matrix( 1:9, ncol=3 ) ),
                            paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1,gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, vector( mode="numeric" ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@samplePaths, as.data.frame( matrix( 1:9, ncol=3 ) ) )
  rm( inf )


  # there have been inference values before...
  inf <- new( "LBInferenceMCMC", paramHat=c( beta=3, betaN=3,
                                           gammaE=3, deltaE=3,
                                           gammaI=3, deltaI=3,
                                           gammaD=3, deltaD=3 ),
                               paramSe=c( beta=3, betaN=3,
                                          gammaE=3, deltaE=3,
                                          gammaI=3, deltaI=3,
                                          gammaD=3, deltaD=3 ),
                               loglik=-333, aic=333,
                               samplePaths=as.data.frame(
                                           matrix( 3, ncol=3) ) )
  infValues( inf ) <- list( loglik=-122, aic=400,
                            samplePaths=as.data.frame(
                                        matrix( 1:9, ncol=3 ) ),
                            paramHat=c( beta=1, betaN=1,
                                        gammaE=1, deltaE=1,
                                        gammaI=1, deltaI=1,
                                        gammaD=1, deltaD=1 ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame(  inf@samplePaths ) )
  checkEquals( inf@paramHat, c( beta=1, betaN=1, gammaE=1, deltaE=1,
                                gammaI=1, deltaI=1, gammaD=1, deltaD=1 ) )
  checkEquals( inf@paramSe, c( beta=3, betaN=3, gammaE=3, deltaE=3,
                               gammaI=3, deltaI=3, gammaD=3, deltaD=3 ) )
  checkEquals( inf@aic, 400 )
  checkEquals( inf@loglik, -122 )
  checkEquals( inf@samplePaths, as.data.frame( matrix( 1:9, ncol=3 ) ) )
  rm( inf )
  
}


testRUnit.InferenceMCMC.getInfValues <- function() {
  # there are no inf values...
  inf <- new( "LBInferenceMCMC" )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=vector( mode="numeric" ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=vector( mode="numeric" ),
                                   loglik=vector( mode="numeric" ),
                                   samplePaths=data.frame() ) )
  rm( inf, my.infvalues )

  
  # there are some inf values...
  inf <- new( "LBInferenceMCMC", paramHat=c( beta=1, betaN=1,
                                           gammaE=1, deltaE=1,
                                           gammaI=1, deltaI=1,
                                           gammaD=1, deltaD=1 ),
                               loglik=-122, aic=400,
                               samplePaths=as.data.frame(
                                           matrix( 1:9, ncol=3 ) ) )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1,
                                               gammaE=1, deltaE=1,
                                               gammaI=1, deltaI=1,
                                               gammaD=1, deltaD=1 ),
                                   paramSe=vector( mode="numeric" ),
                                   aic=400,
                                   loglik=-122,
                                   samplePaths=as.data.frame(
                                               matrix( 1:9, ncol=3 ) ) ) )
  rm( inf, my.infvalues )


  # there are all inf values...
  inf <- new( "LBInferenceMCMC", paramHat=c( beta=1, betaN=1,
                                           gammaE=1, deltaE=1,
                                           gammaI=1, deltaI=1,
                                           gammaD=1, deltaD=1 ),
                               paramSe=c( beta=2, betaN=2,
                                          gammaE=2, deltaE=2,
                                          gammaI=2, deltaI=2,
                                          gammaD=2, deltaD=2 ),
                               loglik=-122, aic=400,
                               samplePaths=as.data.frame(
                                           matrix( 1:9, ncol=3 ) ) )
  my.infvalues <- infValues( inf )
  checkTrue( is.list( my.infvalues ) )
  checkEquals( my.infvalues, list( paramHat=c( beta=1, betaN=1,
                                               gammaE=1, deltaE=1,
                                               gammaI=1, deltaI=1,
                                               gammaD=1, deltaD=1 ),
                                   paramSe=c( beta=2, betaN=2,
                                              gammaE=2, deltaE=2,
                                              gammaI=2, deltaI=2,
                                              gammaD=2, deltaD=2 ),
                                   aic=400,
                                   loglik=-122,
                                   samplePaths=as.data.frame(
                                               matrix( 1:9, ncol=3 ) ) ) )
  rm( inf, my.infvalues )
}


testRUnit.InferenceMCMC.summary <- function() {
  # there are some inf values...
  inf <- new( "LBInferenceMCMC", paramHat=c( beta=1, betaN=1,
                                           gammaE=1, deltaE=1,
                                           gammaI=1, deltaI=1,
                                           gammaD=1, deltaD=1 ),
                               loglik=-122, aic=400,
                               samplePaths=as.data.frame(
                                           matrix( 1:9, ncol=3 ) ) )
  my.summary <- summary( inf )
  checkTrue( is( my.summary, "LBInferenceMCMC" ) )
  checkEquals( my.summary, inf )
  rm( inf, my.summary )
}


# #####     test of functions.r    ############################################

testRUnit.functions.ladybugExample <- function() {
  old.lbp <- options()$ladybugPath
 
  options( ladybugPath="/tmp" )
  my.lbe <- ladybugExample( "oneill/oneill.data" )
  checkEquals( my.lbe, "/tmp/examples/oneill/oneill.data" )
  rm( my.lbe )

  options( ladybugPath="/tmp" )
  my.lbe <- ladybugExample( "/oneill/oneill.data" )
  checkEquals( my.lbe, "/tmp/examples//oneill/oneill.data" )
  rm( my.lbe )

  options( ladybugPath=NULL )
  checkException( ladybugExample( "oneill/oneill.data" ), silent=TRUE )

  options( ladybugPath=old.lbp )
}



testRUnit.functions.seir <- function() {
  # missing data...
  layout <- new( "LBLayout", S0=matrix( c( 14, 14 ), ncol=2 ),
                           E0=matrix( c( 1, 0 ), ncol=2 ) )
  exp <- new( "LBExperiment", data=data.frame(), layout=layout )
  opts <- new( "LBOptionsML", seed=999, LBmodel=c( "exp", "gamma", "exp", TRUE ),
                            ignoreData=c( FALSE, TRUE, TRUE ),
                            initBeta=list( 0.4, 0.001, 0.001 ),
                            initBetaN=list( init=0.4, gamma=0.001, delta=0.001 ),
                            initIncu=list( const=TRUE, const.val=5 ),
                            initInf=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ),
                            initDia=list( 0.4, 0.001, 0.001, 0.9, 0.05, 0.05 ) )
  checkException( seir( exp, opts ), silent=TRUE )
  rm( layout, exp, opts )


  # seir ML...
  inf <- seir( ml.exp, ml.opts )
  checkTrue( is( inf, "LBInferenceML" ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkIdentical( round( inf@paramHat, digits=6 ), c( beta= 0.127172,
                                                      betaN=0.007860,
                                                      gammaE=0,
                                                      deltaE=0,
                                                      gammaI= 1.578395,
                                                      deltaI= 0.110297,
                                                      gammaD=18.394663,
                                                      deltaD= 1.209858 ) )
  checkIdentical( round( inf@paramSe, digits=6 ), c( beta= 0.028901,
                                                     betaN=0.003343,
                                                     gammaE=332.694734,
                                                     deltaE=332.694734,
                                                     gammaI= 0.381321,
                                                     deltaI= 0.031417,
                                                     gammaD= 5.149404,
                                                     deltaD= 0.345344 ) )
  checkEqualsNumeric( inf@aic, 497.8892, tolerance=1e-03 )
  checkEqualsNumeric( inf@loglik, -242.9446, tolerance=1e-03 )  
  checkEqualsNumeric( dim( inf@cov ), c( 8, 8 ) )
  checkIdentical( round( inf@corr, 6 ), c( "beta-betaN"=-0.098348,
                                           "gammaE-deltaE"=0,
                                           "gammaI-deltaI"=0.85312,
                                           "gammaD-deltaD"=0.987228 ) )
  rm( inf )


  # seir MLK...
  inf <- seir( ml.exp )
  checkTrue( is( inf, "LBInferenceMLK" ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.matrix(  inf@cov ) )
  checkTrue( is.numeric( inf@corr ) )
  checkTrue( is.numeric( inf@r0 ) )
  checkTrue( is.numeric( inf@r0.ci ) )
  checkIdentical( round( inf@paramHat, digits=6 ), c( beta= 0.124813,
                                                      betaN=0.010213 ) )
  checkIdentical( round( inf@paramSe, digits=6 ), c( beta= 0.028435,
                                                     betaN=0.004402 ) )
  checkEqualsNumeric( inf@aic, 133.3907, tolerance=1e-04 )
  checkEqualsNumeric( inf@loglik, -64.6953, tolerance=1e-04 )
  checkEqualsNumeric( inf@cov, matrix( c( -1253.7969,
                                          rep( -943.9032, 2 ),
                                          -52319.3584 ), nrow=2 ),
                               tolerance=1e-04 )
  checkEqualsNumeric( inf@corr, -0.1165421, tolerance=1e-06 )
  checkEqualsNumeric( inf@r0, 0.1350262, tolerance=1e-06 )
  checkIdentical( round( inf@r0.ci, digits=6 ), c( lower=0.079381,
                                                   upper=0.190672 ) )
  rm( inf )


  # seir MCMC...
  inf <- seir( mcmc.exp, mcmc.opts )
  checkTrue( is( inf, "LBInferenceMCMC" ) )
  checkTrue( is.numeric( inf@paramHat ) )
  checkTrue( is.numeric( inf@paramSe ) )
  checkTrue( is.numeric( inf@aic ) )
  checkTrue( is.numeric( inf@loglik ) )
  checkTrue( is.data.frame( inf@samplePaths ) )
  checkIdentical( round( inf@paramHat, digits=4 ), c( beta= 0.1043,
                                                      betaN=0,
                                                      gammaE=0,
                                                      deltaE=0,
                                                      gammaI=1,
                                                      deltaI=0.8228 ) )
  checkIdentical( round( inf@paramSe, digits=4 ), c( beta= 0.0623,
                                                     betaN=0,
                                                     gammaE=0,
                                                     deltaE=0,
                                                     gammaI=0,
                                                     deltaI=0.4816 ) )
  checkEqualsNumeric( inf@aic, 34.87714, tolerance=1e-04 )
  checkEqualsNumeric( inf@loglik, -15.43857, tolerance=1e-04 )
  checkEquals( nrow( inf@samplePaths ), 2500 )
  rm( inf )
}


testRUnit.functions.simulate <- function() {
  exp <- simulate( sim.opts, layout=sim.layout )
  checkTrue( is( exp, "LBExperiment" ) )
  checkEquals( exp@layout@S0, matrix( c( 13, rep( 14, 7 ) ), ncol=4 ) ) 
  checkEquals( exp@layout@E0, matrix( c(  1, rep(  0, 7 ) ), ncol=4 ) )

  #Fixed the seed so we can check the dimensions
  checkEquals(c(112,6),dim(exp@data),)
}



