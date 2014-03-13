##RUnit test file for plotting
library(RLadyBug)

#Create some layout and data.
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

#Has no names
checkIdentical(c("g","g.gamma","g.delta","d","d.gamma","d.delta"),names(initInf(sim.opts)))

#sim.opts <- new( "LBOptions")
#checkException(simulate( sim.opts, layout=sim.layout ))

#Start the program containing the simulator
exp <- simulate( sim.opts, layout=sim.layout )


#Illustrate the results
testRunit.statetime <- function() {
  plot(exp,type = state ~ time)
  plot(exp,type = state ~ time, options=list(stacked=FALSE))
}

testRUnit.state1position <- function() {
  plot(exp,type = state ~ 1|position)
    
  #Test the chart option
  plot(exp,type = state ~ 1|position,options=list(chart="bar",noOfPics=3))
  plot(exp,type = state ~ 1|position,options=list(chart="pie"))
    
  #Check if the PDF Options (PDF, name, noOfPics) work
  plot(exp,type = state ~ 1|position,options=list(PDF=TRUE,name="testpics",noOfPics=10))
  checkTrue(all(sapply(1:10,function(i) file.remove(paste("testpics-",i,".pdf",sep="")))))
  checkTrue(!file.exists("testpics-11.pdf"))
  
  #Check if justInf works
  plot(exp,type = state ~ 1|position,options=list(justInf=TRUE,chart="pie"))
  plot(exp,type = state ~ 1|position,options=list(justInf=TRUE,chart="bar"))
}

testRunit.statetimeposition <- function() {
  plot(exp,type = state ~ time|position)

  #Test the stack option
  plot(exp,type = state ~ time|position,options=list(stacked=FALSE))
}

