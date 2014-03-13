#Load the package
library(RLadyBug)

#Read the data file containing the parameters and the setup.
#Could also create this manually
objs <- readSpecFile( data=ladybugExample( "/sim/4x2.data" ))

#Start the JAVA program containing the simulator
exp <- simulate( objs$options, layout=objs$experiment@layout )

#Illustrate the results
plot( exp ,type = state ~ time|position)
plot( exp ,type = state ~ time)
plot( exp ,type = state ~ time,options=list(stacked=FALSE))
plot( exp ,type = state ~ 1 |position, options=list(justInf=TRUE,noOfPics=200,chart="pie"))
