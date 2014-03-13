#Load the library 
library("RLadyBug")

#In case BW graphics are needed
#bw.color <- gray(seq(0.8,0.4,length=4)); names(bw.color) <- c("S","E","I","R")
#options("epicolor"=as.list(bw.color))

#Create layouts and simulate
layout <- new("LBLayout",S0=matrix(c(10,9,10),1,3),
                         E0=matrix(c(0,1,0),1,3))

options <- new("LBOptions",initBeta=list(init=0.125),initBetaN=list(init=0.018),
               initIncu=list(g=6.697,d=0.840),initInf=list(g=1.772,d=0.123))
plot(simulate( options, layout=layout),type=state ~ time|position)

#Change to 8x16 layout
E0  <- matrix(0,8,16) ; E0[4,8] <- 1
S0  <- matrix(15,8,16) - E0
exp <- simulate( options, layout=new("LBLayout",S0=S0,E0=E0))
plot(exp,type=state~1|position,options=list(noOfPics=20))

#Show the use of readSpecFile
data("laevensML")
plot(laevensML,type = individual ~ time|position)

#MCMC for the laevens experiment
data("laevens")
inf.mcmc <- seir(laevens,laevens.opts)

#Algo part of the Options
algo(laevens.opts)

#Results
inf.mcmc

#Analysis through coda (library coda is called when starting RLadyBug)
samples <- mcmc(samplePaths(inf.mcmc))
plot(samples[,"beta"])

#Look at the \beta/\beta_n ratio
ratio <- plot(inf.mcmc,which = "betabetaN")
c(mean=ratio$mean,ratio$hpd)

#R0
quantile(R0(inf.mcmc,laevens),c(0.025,0.5,0.975))
