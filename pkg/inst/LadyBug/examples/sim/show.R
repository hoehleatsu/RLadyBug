######################################################################
# Author: Michael Hoehle <http://www.stat.uni-muenchen.de/~hoehle>
# Date:   23 October 2005
#
# Description:
# This R file is used to visualize the results of an epidemic
# ran by simsellke.sh. See the README.txt for a sequence
# of commands.
######################################################################

######################################################################
# Convert the .all file to one giving the number of E,I,S in each
# cell
######################################################################

preprocess.spacetime <- function(epi) {
  #Initial number of susceptibles, exposed, infectious and recovered
  #The inital numbers (infectives are ignored, coz they will appear
  #as exposed first (if run with option e0)
  S <- array(NA,dim=c(noX,noY,dim(epi)[1]+1))
  E <- array(NA,dim=c(noX,noY,dim(epi)[1]+1))
  I <- array(NA,dim=c(noX,noY,dim(epi)[1]+1))

  #Start values
  S[,,1] <- matrix(setup$S+setup$I,nrow=noX,ncol=noY)
  E[,,1] <- matrix(0,nrow=noX,ncol=noY)
  I[,,1] <- matrix(0,nrow=noX,ncol=noY)

  for (i in 1:dim(epi)[1]) {
    type <- epi[i,]$type
    #Location of the event
    evx <- epi[i,]$x
    evy <- epi[i,]$y

    #Loop over all cells
    for (x in 1:noX) {
      for (y in 1:noY) {
        #Carry last value forward
        S[x,y,i+1] <- S[x,y,i]
        E[x,y,i+1] <- E[x,y,i]
        I[x,y,i+1] <- I[x,y,i]
        
        #If the event is in the current cell
        if ((evx == x) & (evy == y)) {
          if (type == "E") {
            S[x,y,i+1] <- S[x,y,i+1] - 1 ; E[x,y,i+1] <- E[x,y,i+1] + 1
          } else if (type == "I") {
            E[x,y,i+1] <- E[x,y,i+1] - 1 ; I[x,y,i+1] <- I[x,y,i+1] + 1
          } else if (type == "R") {
            I[x,y,i+1] <- I[x,y,i+1] - 1
          }
        }
      }
    }
  }
  return(  list(S=S,E=E,I=I))
}

######################################################################
# This function illustrates the three multivariate time series
# (dimension: noX x noY) containing susceptibles, exposed, and
# infected using noOfPics pictures.
# For each picture a pdf file is created
#
# Params:
#  S - time series with the number of susceptibles in each cell
#  E - time series with the number of susceptibles in each cell
#  I - time series with the number of susceptibles in each cell
#  noOfPics - number of pictures for the animiation
#  PDF = boolean, whether to save the pictures as PDFs
######################################################################

show.animation <- function(S,E,I,noOfPics=200,name="picture",PDF=FALSE) {
  #The time points where to show the picture (linear time)
  #If we would take epi$t we are not linear in time.
  tseq <- seq(0,max(epi$t),length=noOfPics)

  #Loop over all time points
  for (i in 1:length(tseq)) {
    #Find the idx in the multivariate time series corresponding
    #to t
    idx <- which.max(epi$t > tseq[i]) -  1

    if (PDF) {
      fileName <- paste(name,"-",i,".pdf",sep="")
    
      pdf(fileName,height=5,width=5*(noY/noX))
      cat("Creating ",fileName,"\n")
    }
    #Make the plot
    plot(NA,xlim=c(-1/6, (noY-1)/3 + 1/6),ylim=c(-1/6,(noX-1)/3+1/6),axes=F,ylab="x-coordinate",xlab="y-coordinate")
    for (x in 1:noX) {
      for(y in 1:noY) {
        r <- I[x,y,idx]/S[x,y,1]
        u <- seq(0,2*pi,length=100)
        points(r*1/6*cos(u) + (1/3)*(y-1),r*1/6*sin(u) + (noX-x)*1/3,type="l")
      }
    }
    title(paste("t=",round(tseq[i]*10)/10))

    #Turn the device off.
    if (PDF) {
      dev.off()
    }
  }
  #Done.
  invisible()
}


preprocess <- function(epi) {
  #Initial number of susceptibles, exposed, infectious and recovered
  #The inital numbers (infectives are ignored, coz they will appear
  #as exposed first (if run with option e0)
  S <- matrix(setup$S+setup$I,nrow=noX,ncol=noY)
  E <- matrix(0,nrow=noX,ncol=noY)
  I <- matrix(0,nrow=noX,ncol=noY)

  #Add columns for E,I,S
  epi$S <- NA
  epi$E <- NA
  epi$I <- NA
  
  for (i in 1:dim(epi)[1]) {
    type <- epi[i,]$type
    x <- epi[i,]$x
    y <- epi[i,]$y

    #Action depends on type
    if (type == "E") {
      S[x,y] <- S[x,y] - 1 ; E[x,y] <- E[x,y] + 1
    } else if (type == "I") {
      E[x,y] <- E[x,y] - 1 ; I[x,y] <- I[x,y] + 1
    } else if (type == "R") {
      I[x,y] <- I[x,y] - 1
    }
    ##Set the events
    epi[i,c("S","E","I")] <- c(S[x,y],E[x,y],I[x,y])
  }
  return(epi)
}

######################################################################
# A function to plot the course of the epidemic for each cell.
######################################################################

plot.epilocal <- function(epi) {
  #Make the appropriate call to par
  par(mfrow=c(noX,noY),mar=c(3,1,3,1))
  
  for (x in 1:noX) {
    for (y in 1:noY) {
      #Extract all events happening in the location (x,y)
      epi.loc <- epi[epi$x == x & epi$y == y,]
      #Have a look at the first event
      first   <- epi.loc[1,]
      first$t <- -1e-4
      first$S <- first$S + 1
      first$E <- first$E - 1
      #if (!(x==1 & y==1)) {
      #  first$E=0; first$S=first$S+1
      #} else {
      #  first$E=1; first$I=0
      #}
    
      epi.loc <- rbind(first,epi.loc)
      matplot(epi.loc$t,epi.loc[,c("E","S","I")],type="s",col=c(1,2,3),
              xlim=c(0,max(epi$t)),ylim=c(0,max(epi[,c("E","S","I")])+1),lty=1)
      title(paste("(",x,",",y,")"))
      if ((x==1) & (y==1)) {
        legend(max(epi$t)/2,max(epi[,c("E","S","I")]),
               c("E","S","I"),col=c(1,2,3),lty=1)
      }
    }
  }
  par(mfcol=c(1,1),mar=c(4,4,4,4))
}

plot.epiglobal <- function(epi) {
  S <- numeric(dim(epi)[1]+1)
  E <- numeric(dim(epi)[1]+1)
  I <- numeric(dim(epi)[1]+1)

  #Initial numbers
  S[1] <- sum(setup$S+setup$I)
  E[1] <- 0
  I[1] <- 0
  
  for (i in 1:dim(epi)[1]) {
    type <- epi[i,]$type
    #Action depends on type
    if (type == "E") {
      S[i+1] <- S[i] - 1 ; E[i+1] <- E[i] + 1 ; I[i+1] <- I[i]
    } else if (type == "I") {
      S[i+1] <- S[i]     ; E[i+1] <- E[i] - 1 ; I[i+1] <- I[i] + 1
    } else if (type == "R") {
      S[i+1] <- S[i]     ; E[i+1] <- E[i]     ; I[i+1] <- I[i] - 1
    } else if (type == "S") {
      S[i+1] <- S[i]     ; E[i+1] <- E[i]     ; I[i+1] <- I[i];
    }
  }
  matplot(c(0,epi$t),cbind(S,E,I),type="s",xlab=expression(t),ylab="Number of indiviuals")
  legend(2/3*max(epi$t),1/2*max(S,E,I),c("S","E","I"),lty=1,col=1:3)
}

######################################################################
# Global variables
######################################################################
#Read the plain style list
name <- "sim8x16"
epi <- read.table(paste(name,".all",sep=""),col.names=c("x","y","t","type"))
#Determine the number of units in the setup
noX <- max(epi$x)
noY <- max(epi$y)
noOfUnits <- noX * noY
#Read the secondary information
setup <- read.table(paste(name,".data",sep=""),skip=4,nrow=noOfUnits,col.names=c("u","x","y","S","I"))

######################################################################
# Here is the action
######################################################################
plot.epiglobal(epi)
epi <- preprocess(epi)
plot.epilocal(epi)

pdf(file="local.pdf")
plot.epilocal()
dev.off()

pdf(file="global.pdf")
plot.epiglobal()
dev.off()

######################################################################
#Generate 3 multivariate time series containing
#the susceptibles, exposed, infectious
######################################################################
ts <- preprocess.spacetime(epi)

#Show the inf time series
show.animation(ts$S,ts$E,ts$I,noOfPics=8,PDF=T,name=name)
