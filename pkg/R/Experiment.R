# -------------  class LBExperiment  --------------------------------------------

#setClass( "LBExperiment", representation( data   = "data.frame",
#                                        layout = "LBLayout",
#                                             T = "numeric" ) )

# show
setMethod( "show", "LBExperiment", function( object ){
  cat( "An object of class LBExperiment\n\n" )
  cat( "LBLayout:\n" )
    cat( "  S0:\n  " )
    print( object@layout@S0 )
    cat( "\n  E0:\n  " )
    print( object@layout@E0 )
  cat( "\nT = ",object@T,"\n")
  cat( "\nData:\n" )
    print( object@data )
} )


# >>> other Methods

# summary
setMethod( "summary", "LBExperiment", function( object ){
  return( object )
} )

# data2events
setMethod( "data2events", "LBExperiment", function( object ) {
  #Fetch the data from the object
  df <- object@data

  if( is.null( df ) ) stop( "There are no data in the experiment" )
  
  #Replace all unknowns with their start values
  if (is.factor(df$E)) {
    df$E <- as.numeric(sub("\\(([0-9]*)\\)","\\1",levels(df$E)[df$E]))
  }
  if (is.factor(df$I)) {
    df$I <- as.numeric(sub("\\(([0-9]*)\\)","\\1",levels(df$I)[df$I]))
  }
  if (is.factor(df$R)) {
    df$R <- as.numeric(sub("\\(([0-9]*)\\)","\\1",levels(df$R)[df$R]))
  }

  ##Pre-allocate, don't use rbind - this is much faster for large frames.
  events <- as.data.frame(matrix(0,nrow=dim(df)[1]*3,ncol=4))
  names(events) <- c("x","y","t","type")
  
  #Loop over all individuals
  for (i in 1:dim(df)[1]) {
    #print(i)
    #The individiual
    indi  <- df[i,]
    index <- ((i-1)*3+1):(i*3)
    #Generate events
    events[index,] <- cbind(indi$x,indi$y,c(indi$E,indi$I,indi$R),c(1,2,3))
  }


  #Sort according to the event time and Deal with draws -
  #The order of events is E,I,R (i.e. R goes last) 
  events$type <- c("E","I","R")[events$type]
  events <- events[order(events$t, factor(events$type, levels=c("I","E","R"))),]

  #Done
  return(events)
} )

#Ensure S3 plot works as S4...?
setMethod("plot", signature(x="LBExperiment", y="missing"), function(x, y, type=NULL, options=NULL, ...) {  
  #Convert arguments to a list and extract the relevant ones
  args <- list(...)
  #print("In plot")
  #print(args)
  if(is.null(type)) {formula <- state ~ time} else {formula <- type}
  if(is.null(options)) {options <- list()} else {options <- options}
  
  #Code to parse the Formula -- not much error mgmt is done here
  #use tryCatch here!
  state <- tryCatch(formula[[2]] == "state" & formula[[1]] == "~",error=function(e) FALSE)
  individual <- tryCatch(formula[[2]] == "individual" & formula[[1]] == "~",error=function(e) FALSE)

         
          
  time <- tryCatch(formula[[3]] == "time",error=function(e) FALSE)
  timepos <- tryCatch(((formula[[3]][[2]] == "time") & (formula[[3]][[1]] == "|") &
                       (formula[[3]][[3]] == "position")),error=function(e) FALSE)
  onepos <-  tryCatch(((formula[[3]][[2]] == "1") & (formula[[3]][[1]] == "|") &
                       (formula[[3]][[3]] == "position")),error=function(e) FALSE)

              
  #Do the error management
  if (!((state & (time  | timepos | onepos)) |(individual & (time | timepos))))
    cat("Error: Valid formulae are\n\t state\t\t ~ time | position\n\t state\t\t ~ time\n\t state\t\t ~ 1|position\n\t individual\t ~ time\n\t individual\t ~ time | position\n")

  #Dispatch to the private function doing all the hard work (optimize on the name)
  if (state & onepos)  plot.animation(x,options,...)
  if (state & time) plot.global(x,options, ...)
  if (state & timepos) plot.local(x,options, ...)
  if (individual & timepos) {options$grid <- TRUE ; plot.individual(x,options,...)}
  if (individual & time) {options$grid <- FALSE ; plot.individual(x,options,...)}
})

          

#======================================================================
# >>> internal functions
#======================================================================

preprocess.spacetime <- function(epi, setup) {
  #Dimensions
  noX <- max(setup$x)
  noY <- max(setup$y)
  #Initial number of susceptibles, exposed, infectious and recovered
  #The inital numbers (infectives are ignored, coz they will appear
  #as exposed first (if run with option e0)
  S <- array(NA,dim=c(noX,noY,dim(epi)[1]+1))
  E <- array(NA,dim=c(noX,noY,dim(epi)[1]+1))
  I <- array(NA,dim=c(noX,noY,dim(epi)[1]+1))

  #Start values
  S[,,1] <- matrix(setup$S+setup$E,nrow=noX,ncol=noY)
  E[,,1] <- matrix(0,nrow=noX,ncol=noY)
  I[,,1] <- matrix(0,nrow=noX,ncol=noY)

  for (i in 1:dim(epi)[1]) {
    #print(i)
    theEvent <- epi[i,]
    type <- theEvent$type
    #Location of the event
    evx <- theEvent$x
    evy <- theEvent$y

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
# This function finds the correct S_u(t),E_u(t),I_u(t) for each event
######################################################################

preprocess <- function( epi, setup ) {
  #Dimensions
  noX <- max(setup$x)
  noY <- max(setup$y)
  #Initial number of susceptibles, exposed, infectious and recovered
  #The inital numbers (infectives are ignored, coz they will appear
  #as exposed first (if run with option e0)
  S <- matrix(setup$S+setup$E,nrow=noX,ncol=noY)
  E <- matrix(0,nrow=noX,ncol=noY)
  I <- matrix(0,nrow=noX,ncol=noY)

  #Add columns for E,I,S
  epi$S <- NA
  epi$E <- NA
  epi$I <- NA
  
  for (i in 1:dim(epi)[1]) {
    #print(i)
    theEvent <- epi[i,]
    type <- theEvent$type
    x <- theEvent$x
    y <- theEvent$y

    #Action depends on type
    if (type == "E") {
      S[x,y] <- S[x,y] - 1 ; E[x,y] <- E[x,y] + 1
    } else if (type == "I") {
      E[x,y] <- E[x,y] - 1 ; I[x,y] <- I[x,y] + 1
    } else if (type == "R") {
      I[x,y] <- I[x,y] - 1
    }
    ##Set the S,E,I counts for each event (if epi is large this might be expensive!)
    epi[i,c("S","E","I")] <- c(S[x,y],E[x,y],I[x,y])
  }
  return(epi)
}


######################################################################
# Helper function to draw a slice
#
# Params:
#  center - c(x,y) coordinates
#  phi    - c(fromangle,toangle)
#  r      - the radius
#  col    - the colors
######################################################################

draw.slice <- function(center,phi,r,col) {
  #Is there something to draw?
  if (abs(phi[2]-phi[1]) > 1e-2) {
    #Can we draw the entire thing in one slice?
    if (abs(phi[2]-phi[1] - 2*pi) < 0.01) {
      u <- seq(phi[1],phi[2],length=50)
      x <- r*1/6*cos(u) + center[1]
      y <- r*1/6*sin(u) + center[2]
      polygon(x,y,col=col)
    } else {
      #Include center
      u <- seq(phi[1],phi[2],length=50)
      x <- c(center[1],r*1/6*cos(u) + center[1],center[1])
      y <- c(center[2],r*1/6*sin(u) + center[2],center[2])
      polygon(x,y,col=col)
    }
  }
}

######################################################################
# Helper function to draw bar
#
# Params:
#  center - c(x,y) coordinates
#  seir   - number of individuals in the classes S,E,I,R
#  r      - the radius
#  col    - the colors
######################################################################

draw.bar <- function(center,seir,r,col) {
  #Calculate constants
  x <- center[1] + c(-1,1)*1/6*r
  ylow <- center[2] -1/6*r
  norm <- 1/sum(seir)*2/6*r

  #Compute upper and lower bound for each box
  y <- ylow + cumsum(c(0,seir[1:(length(seir))]*norm))
  y <- cbind(y[1:(length(y)-1)],y[-1])

  #Draw the box
  rect(x[1],y[,1],x[2],y[,2],col=col[-1])
}

# show.animation
# This function illustrates the three multivariate time series
# (dimension: noX x noY) containing susceptibles, exposed, and
# infected using noOfPics pictures.
# For each picture a pdf file is created

setMethod( "plot.animation", "LBExperiment", 
function( object, options, ylab="x-coordinate",xlab="y-coordinate",xlim=NULL, ylim=NULL, legend=TRUE,
          main=NULL, color=getOption("epicolor"), mar=c(0,0,2,0), ... ) {
  
  ########################################
  #Extract the options or lset the defaults
  ########################################
  justInf <- ifelse(!is.null(options$justInf),options$justInf,FALSE)
  noOfPics <- ifelse(!is.null(options$noOfPics),options$noOfPics,50)
  PDF  <- ifelse(!is.null(options$PDF),options$PDF,FALSE)
  name  <- ifelse(!is.null(options$name),options$name,"picture")
  chart   <- ifelse(!is.null(options$chart),options$chart,"bar")
  if (!((chart == "bar") | chart == "pie")) {
    stop("Error: Valid charts are c(\"bar\",\"pie\"\n")
  }
  setup <- layoutAsDataFrame( object@layout )

  #Preprocess the data (no caching of results for a 2nd call occurrs)
  epi <- data2events( object )
  epi <- preprocess( epi, setup )
  ts  <- preprocess.spacetime( epi, setup )
  
  S <- ts$S
  E <- ts$E
  I <- ts$I
  
  noX <- max(setup$x)
  noY <- max(setup$y)

   #The time points where to show the picture (linear time)
  #If we would take epi$t we are not linear in time.
  tseq <- seq(0,max(epi$t),length=noOfPics)

  #largest possible number
  nmax <- max(S[,,])

  #Colors of <>, exposed, infected, susceptible, recovered
  colors <- c("",color$E,color$I,color$S,color$R)
  
  #Loop over all time points
  for (i in 1:length(tseq)) {
    #Find the idx in the multivariate time series corresponding
    #to t
    idx <- which.max(epi$t >= tseq[i]) + 1

   #Set the par (restoring apparently doesn't work)
    oldmar <- par()$mar

    #Internal function doing the plot work - to be called
    #in order to generate pdf AND postscript file
    doThePlot <- function() {
      #bottom left top right
      par(mar=mar)

      ###############
      #Make the plot
      ###############
      if (is.null(xlim)) xlim <- c(-1/6, (noY-1)/3 + 1/6)
      if (is.null(ylim)) ylim <- c(-2/6,(noX-1)/3+1/6)
      plot(NA,xlim=xlim,ylim=ylim,axes=F,ylab=ylab,xlab=xlab)

      #Loop over all units
      for (x in 1:noX) {
        for(y in 1:noY) {
          #Compute important params for this cell
          r <- S[x,y,1]/nmax
          center <- c((1/3)*(y-1),(noX-x)*1/3)
          seir=c(E[x,y,idx],I[x,y,idx],S[x,y,idx],
            S[x,y,1]-E[x,y,idx]-I[x,y,idx]-S[x,y,idx])
          
          #Show either only the infectious or all S,E,I,R
          if (justInf) {
            if (chart == "pie") {
              draw.slice(center,phi=c(0,2*pi),r=I[x,y,idx]/nmax,col=colors[3])
            } else {
              draw.bar(center,seir=c(I[x,y,idx],sum(seir)-I[x,y,idx]),r=r,col=c(colors[c(1,3)],"white"))
            }
          } else { #!justInf
            if (chart == "pie") {
            #Draw all slices -- scale the circles according to the
            #proportions of E,I,R,T
            angles <- c(E[x,y,idx],I[x,y,idx],S[x,y,idx],S[x,y,1]-E[x,y,idx]-I[x,y,idx]-S[x,y,idx])
            angles <- c(0,2*pi*cumsum(angles)/sum(angles))
            
            #Show all proportions 
            for (j in 2:5) {
              draw.slice(c((1/3)*(y-1),(noX-x)*1/3),phi=c(angles[j-1],angles[j]),r,col=colors[j])
            }
          } else {
            draw.bar(c((1/3)*(y-1),(noX-x)*1/3),seir=seir,r,colors)
          }
          }
        }
      }
    
      #Add a title
      if (is.null(main)) main <- function(t) paste("t=",round(tseq[i]*10)/10)
      title(main(t))
      if (legend) {
        legend(-1/6,-1/6-1/20,c("Susceptible","Exposed","Infected","Recovered"),
             horiz=T,fill=unlist(getOption("epicolor")),bty="n")
      }
    }
    
    #Creating the PDF File
    if (PDF) {
      #PDF
      fileName <- paste(name,"-",i,".pdf",sep="")
      cat("Creating ",fileName,"\n")
      pdf(fileName,height=5,width=5*(noY/noX))
      doThePlot()
      dev.off()

      #Postscript
      fileName <- paste(name,"-",i,".eps",sep="")
      cat("Creating ",fileName,"\n")
      postscript(fileName,height=5,width=5*(noY/noX),horizontal=FALSE,onefile=FALSE,paper="special")
      doThePlot()
      dev.off()
    } else {
      #No File creation
      doThePlot()
    }

    #Restore par
    par(mar=oldmar)

  }
  #Done.
  invisible()
})


######################################################################
# Function to show the information about each individual
######################################################################


setMethod( "plot.individual", "LBExperiment", function( object, options,
                                                       xlab="time",ylab="individual",xlim=NULL, ylim=NULL, legend=TRUE,
                                                       main=NULL, color=getOption("epicolor"), mar=NULL, ... ) {
  #Unpack Options
  ignoreD <- ifelse(!is.null(options$ignoreD), options$ignoreD, TRUE)
  grid    <- ifelse(!is.null(options$grid), options$grid, TRUE)

  #Handle some of the arguments
  if (is.null(main)) main <- function(x,y) paste("(",x,",",y,")")
  
  #Fetch the layout
  #setup <- layoutAsDataFrame( object@layout )
  layout <- object@layout

  #Number of animals
  N <- layout@S0 + layout@E0

  noXY <- dim(layout@S0)
  oldmar <- par()$mar
  #Select the appropriate layout
  if (grid) {
    if (is.null(mar)) mar <- c(3,2,3,1)
    par(mfrow=c(noXY[1],noXY[2]),mar=mar)
  } else {
    if (is.null(mar)) mar <- c(2,2,2,1)
    par(mfrow=c(noXY[1]*noXY[2],1),mar=mar)
  }

  data <- object@data
  #Find the maximum observed event time (take CE's into account)
  notce <- data$D != "CE"
  #In case none are CE then we have a vector of numbers
  if (sum(notce) == length(data$D)) {
    d <- data$D
  } else {
    d <- as.numeric(levels(data$D)[data$D[notce]])
  }
  maxt <- max(data$E,data$I,data$R, d)

  #Extract plot params
  if (is.null(xlim)) xlim <- c(0,maxt)
  if (is.null(ylim)) ylim <- c(0,sum(max(N)))
  
  #Loop over all units
  for (x in 1:noXY[1]) {
    for (y in 1:noXY[2]) {
      unit <- data[data$x == x & data$y == y,]

      #Create empty plot space (not type="n")
      plot(0,xlim=xlim,ylim=ylim,yaxt="n",
           xlab=xlab,ylab=ylab,type="n") ##skip ,xaxs="i",yaxs="i"

      title(main(x,y))
      #Variable to save ylab information
      ylabs <- NULL
      h <- 0

      #Loop over all pigs in each pen
      for (i in 1:N[x,y]) {
        h <- h + 1
        #The individual
        if (i <= dim(unit)[1]) {indiv <- unit[i,] } else {indiv <- list(E=NA,I=NA,R=NA,D=NA)}
        #Only those with viraemia
        if (!is.na(indiv$E)) {
          #A point indicates the assumed exposure time
          points(indiv$E,h,pch=4,cex=2,col=2) #col=2
          #Show vireamia period
          lines(c(indiv$I,indiv$R),c(h,h),col=1)
          #Show point of sero conversion
          if (!ignoreD) { points(indiv$D,h,pch=19,cex=2,col=2) } #col=2
          #Indicate death if present. 
          #if (!is.na(indiv$death)) {
          #points(indiv$death,h,cex=cex,pch=22,)
        }
        if (h<10) {void <- "0"} else {void <- ""}
        ylabs <- c(ylabs,paste(x,y,":",void,h,sep=""))
      }

      #Annotate axis
      no <- 1:h
      axis(2,at=no,labels=ylabs)
    }
  }
  par(mfcol=c(1,1),mar=oldmar)
})



# plot.local
setMethod( "plot.local", "LBExperiment", function( object, options, xlab="",ylab="",xlim=NULL, ylim=NULL, legend=TRUE, main=NULL, color=getOption("epicolor"), mar=c(3,3,3,1),  ...) {
  #Parse options
  stacked <- ifelse(!is.null(options$stacked),options$stacked,TRUE)

  setup <- layoutAsDataFrame( object@layout )

  #Preprocess
  epi <- data2events( object )
  epi <- preprocess( epi, setup )

  #Dimensions
  noX <- max(setup$x)
  noY <- max(setup$y)
  #Make the appropriate call to par
  oldmar <- par()$mar
  par(mfrow=c(noX,noY),mar=mar)

  #=====================
  # Argument handling
  #=====================
  #Plot limits for all plots
  if (is.null(xlim)) xlim <- c(0,max(epi$t))
  if (is.null(ylim)) ylim <- c(0,max(epi[,c("E","S","I")])+1)
  #Naming
  if (is.null(main)) { main <- function(x,y) {paste("(",x,",",y,")")} }
  #Colors        
  color  <- unlist(color)
  #======================

  for (x in 1:noX) {
    for (y in 1:noY) {
      #Extract all events happening in the location (x,y)
      epi.loc <- epi[epi$x == x & epi$y == y,]
      #Have a look at the first event
      first   <- epi.loc[1,]
      first$t <- -1e-4
      first$S <- first$S + 1
      first$E <- first$E - 1
    
      epi.loc <- rbind(first,epi.loc)

      #Decide on plot type (stacked or plain)
      if (!stacked) {
        matplot(epi.loc$t,epi.loc[,c("E","S","I")],type="s", xlab=xlab,ylab=ylab, xlim=xlim,ylim=ylim,lty=1:3,xaxs="i",yaxs="i",main="", col=color[c("E","S","I")])
      } else {
        #Open a plot window with no contents.
        plot(NA,xlim=xlim,ylim=ylim,xlab=xlab,ylab=ylab,xaxs="i",yaxs="i",...)
        for (i in 2:length(epi.loc$t)) {
          seir <-c(as.numeric(epi.loc[i-1,c("S","E","I")]),epi.loc[1,"S"]-sum(epi.loc[i-1,c("S","E","I")]))
          ys <- cumsum(c(0,seir))
          rect(epi.loc$t[i-1],ys[-length(ys)],epi.loc$t[i],ys[-1],col=color,border=NA)
        }
        #For compliance -- fill the rest of the time with R.
        last <- length(epi.loc$t)
        rect(epi.loc$t[last],0,xlim[2],epi.loc[1,"S"]-sum(epi.loc[last,c("S","E","I")]),col=color["R"],border=NA)
      }

      #Do naming
      title(main(x,y))

      #Add legend (if requested)
      if (legend) {
        if ((x==1) & (y==1)) {
          if (!stacked) {
            legend(max(epi$t)/2,max(epi[,c("E","S","I")]),
                   c("E","S","I"),color[c("E","S","I")],lty=1:3)
          } else {
            legend(max(epi$t),sum(epi[1,c("E","S")]),
                   c("S","E","I","R"),fill=color[c("S","E","I","R")],xjust=1,bg="white",cex=1)
          }
        }
      }
    }
  }
  par(mfcol=c(1,1),mar=oldmar)
})

# plot.global
setMethod( "plot.global", "LBExperiment", function( object , options,
#          xlab="t",ylab="Number of indiviuals",xlim=NULL, ylim=NULL, legend=TRUE,
          xlab="t",ylab="Number of indiviuals", legend=TRUE,
          main="", color=getOption("epicolor"), ... ) {
  
  #Parse options
  stacked <- ifelse(!is.null(options$stacked),options$stacked,TRUE)

  #Extract options
  color <- unlist(color)
  
  setup <- layoutAsDataFrame( object@layout )

  print("In print global")
  xlim <- list(...)$xlim
  ylim <- list(...)$ylim


 print(xlim)
 print(ylim)
 print(xlab)
 print(ylab)
  
  #Transform
  epi <- data2events( object )

  S <- numeric(dim(epi)[1]+1)
  E <- numeric(dim(epi)[1]+1)
  I <- numeric(dim(epi)[1]+1)

  #Initial numbers
  S[1] <- sum(setup$S+setup$E)
  E[1] <- 0
  I[1] <- 0
  
  for (i in 1:dim(epi)[1]) {
    #print(i)
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
  #Make it a matrix
  R <- S[1]-S-E-I
  seir <- cbind(S,E,I,R)
  t <- c(0,epi$t)

  #Deduce some values
  if (is.null(ylim)) ylim <- c(0,max(apply(seir,MARGIN=1,sum)))
  if (is.null(xlim)) c(0,max(t))

  print(ylim)
  
  #Decide whether the 4 counting processes are shown as individual or stacked ts
  if (!stacked) {
    matplot(t,seir[,-4],type="s",xlab=xlab,ylab=ylab,col=color[c("S","E","I")],xaxs="i",yaxs="i",main=main,xlim=xlim,ylim=ylim)
    if (legend) legend(0,1/2*max(ylim),c("S","E","I"),lty=1:3,col=color[c("S","E","I")])
  } else { #Make a "stacked" plot
    plot(NA,xlim=xlim,ylim=ylim,xlab=xlab,ylab=ylab,xaxs="i",yaxs="i",main=main)

    for (i in 2:length(t)) {
      ys <- cumsum(c(0,seir[i-1,]))
      rect(t[i-1],ys[-length(ys)],t[i],ys[-1],col=color,border=NA)
    }
    if (legend) {
      legend(max(t),ylim[2],c("S","E","I","R"),horiz=TRUE,xjust=1,fill=color,bg="white")
    }
  } ##end if !stacked
} )

