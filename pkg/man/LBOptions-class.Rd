\name{LBOptions-class}
\docType{class}
\alias{LBOptions-class}
\alias{ignoreData,LBOptions-method}
\alias{ignoreData<-,LBOptions-method}
\alias{initBeta,LBOptions-method}
\alias{initBeta<-,LBOptions-method}
\alias{initBetaN,LBOptions-method}
\alias{initBetaN<-,LBOptions-method}
\alias{initDia,LBOptions-method}
\alias{initDia<-,LBOptions-method}
\alias{initialize,LBOptions-method}
\alias{initIncu,LBOptions-method}
\alias{initIncu<-,LBOptions-method}
\alias{initInf,LBOptions-method}
\alias{initInf<-,LBOptions-method}
\alias{initsAsDataFrame,LBOptions-method}
\alias{LBInits,LBOptions-method}
\alias{LBInits<-,LBOptions-method}
\alias{LBModel,LBOptions-method}
\alias{LBModel<-,LBOptions-method}
\alias{LBOptions,LBOptions-method}
\alias{LBOptions<-,LBOptions-method}
\alias{optionsAsDataFrame,LBOptions-method}
\alias{seed,LBOptions-method}
\alias{seed<-,LBOptions-method}
%undoc code object
\alias{ignoreData}
\alias{ignoreData<-}
\alias{initBeta}
\alias{initBeta<-}
\alias{initBetaN}
\alias{initBetaN<-}
\alias{initDia}
\alias{initDia<-}
\alias{initIncu}
\alias{initIncu<-}
\alias{initInf}
\alias{initInf<-}
\alias{seed<-}
\alias{seed}
\alias{LBInits}
\alias{LBInits<-}
\alias{LBModel}
\alias{LBModel<-}
\alias{LBOptions}
\alias{LBOptions<-}
\alias{optionsAsDataFrame}
\alias{initsAsDataFrame}
%
\alias{show,LBOptions-method}
\alias{simulate,LBOptions-method}
\alias{summary,LBOptions-method}

\title{Class "LBOptions" }
\description{ Specification of LadyBug SEIR models}
\section{Objects from the Class}{
 Objects can be created by calls of the form \code{new("LBOptions",
   seed, LBmodel, ignoreData, initBeta, initBetaN, initIncu, initInf,
   initDia, algo, randomWalk)}. 
}
\section{Slots}{
	 \describe{
    \item{\code{seed}:}{Object of class \code{"numeric"} The seed value
      to use when calling the Java program }
    \item{\code{LBmodel}:}{Object of class \code{"vector"} Contains a
      specification of the SEIR model, i.e. a vector with names
      \tabular{cl}{
	\code{incuTimePDF}\tab distribution of incubation time \cr
	\code{infTimePDF} \tab distribution of the infectious time \cr
	\code{diagTimePDF} \tab distribution of the seroconversion time \cr
	\code{meanVar} \tab mean variance representation of periods (TRUE/FALSE)\cr
	}}
    \item{\code{ignoreData}:}{Object of class \code{"vector"} Booleans
      \tabular{cl}{
	\code{ignoreE} \tab Ignore the specified exposure (E) event times \cr
	\code{ignoreI} \tab Ignore the specified infective (I) event times\cr
	\code{ignoreD} \tab Ignore the specified diagnose (D) event time\cr
      }}
    \item{\code{initBeta}:}{Object of class \code{"list"} Inital values:
      \tabular{cl}{
        \code{init} \tab for \eqn{\beta} \cr
        \code{gamma} \tab for the priori parameter \eqn{\gamma} \cr
        \code{delta} \tab for the priori parameter \eqn{\delta} 
      }
    }
    \item{\code{initBetaN}:}{Object of class \code{"list"} Inital values:
      \tabular{cl}{
        \code{init} \tab for \eqn{\beta_n} \cr
        \code{gamma} \tab for the priori parameter \eqn{\gamma} \cr
        \code{delta} \tab for the priori parameter \eqn{\delta} 
      }
    }
    \item{\code{initIncu}:}{Object of class \code{"list"} Initial values: 
      \tabular{cl}{
        \code{g} \tab for parameter \eqn{\gamma} of the gamma distribution of the incubation time \cr
        \code{g.gamma} \tab for the parameter \eqn{gamma} of the distribution of g \cr
        \code{g.delta} \tab for the parameter \eqn{delta} of the distribution of g \cr
        \code{d} \tab for parameter \eqn{\delta} of the gamma distribution of the incubation time \cr
        \code{d.gamma} \tab for the parameter \eqn{gamma} of the distribution of d \cr
        \code{d.delta} \tab for the parameter \eqn{delta} of the distribution of d \cr
      }
      or choose \code{asis} or \code{constant}:
      \tabular{cl}{
        \code{asis} \tab TRUE/FALSE \cr
        \code{const} \tab TRUE/FALSE \cr
        \code{const.val} \tab value of constant if \code{const} == TRUE
      }
    }
    \item{\code{initInf}:}{Object of class \code{"list"} Initial values:
      \tabular{cl}{
        \code{g} \tab for parameter \eqn{\gamma} of the gamma distribution of the infectious time \cr
        \code{g.gamma} \tab for the parameter \eqn{gamma} of the distribution of g \cr
        \code{g.delta} \tab for the parameter \eqn{delta} of the distribution of g \cr
        \code{d} \tab for parameter \eqn{\delta} of the gamma distribution of the infectious time \cr
        \code{d.gamma} \tab for the parameter \eqn{gamma} of the distribution of d \cr
        \code{d.delta} \tab for the parameter \eqn{delta} of the distribution of d \cr
      }
    }
    \item{\code{initDia}:}{Object of class \code{"list"} Initial values:
      \tabular{cl}{
        \code{g} \tab for parameter \eqn{\gamma} of the gamma distribution of the seroconversion time \cr
        \code{g.gamma} \tab for the parameter \eqn{gamma} of the distribution of g \cr
        \code{g.delta} \tab for the parameter \eqn{delta} of the distribution of g \cr
        \code{d} \tab for parameter \eqn{\delta} of the gamma distribution of the seroconversion time \cr
        \code{d.gamma} \tab for the parameter \eqn{gamma} of the distribution of d \cr
        \code{d.delta} \tab for the parameter \eqn{delta} of the distribution of d \cr
      }
    }
  }
}
\section{Methods}{
  \describe{
    \item{ignoreData}{\code{signature(object = "LBOptions")}: 
      \cr returns value of slot \code{ignoreData}      
    }
    \item{ignoreData<-}{\code{signature(object = "LBOptions", value = "vector")}: 
      \cr assigns \code{value} to slot \code{ignoreData}
    }
    \item{initBeta}{\code{signature(object = "LBOptions")}:
      \cr returns value of slot \code{initBeta}      
    }
    \item{initBeta<-}{\code{signature(object = "LBOptions", value = "list")}:
      \cr assigns \code{value} to slot \code{initBeta}
    }
    \item{initBetaN}{\code{signature(object = "LBOptions")}:
      \cr returns value of slot \code{initBetaN}      
    }
    \item{initBetaN<-}{\code{signature(object = "LBOptions", value = "list")}:
      \cr assigns \code{value} to slot \code{initBetaN}
    }
    \item{initDia}{\code{signature(object = "LBOptions")}:
      \cr returns value of slot \code{initDia}      
    }
    \item{initDia<-}{\code{signature(object = "LBOptions", value = "list")}:
      \cr assigns \code{value} to slot \code{initDia}
    }
    \item{initialize}{\code{signature(.Object = "LBOptions")}: 
      \cr does initializing of the slots when \code{new( "LBOptions", ... )} is called 
    }
    \item{initIncu}{\code{signature(object = "LBOptions")}:
      \cr returns value of slot \code{initIncu}      
    }
    \item{initIncu<-}{\code{signature(object = "LBOptions", value = "list")}:
      \cr assigns \code{value} to slot \code{initIncu}
    }
    \item{initInf}{\code{signature(object = "LBOptions")}:
      \cr returns value of slot \code{initInf}      
    }
    \item{initInf<-}{\code{signature(object = "LBOptions", value = "list")}:
      \cr assigns \code{value} to slot \code{initInf}
    }
    \item{initsAsDataFrame}{\code{signature(object = "LBOptions")}: 
      \cr returns initial values in a dataframe format
    }
    \item{LBInits}{\code{signature(object = "LBOptions")}: 
      \cr returns all initial values (as there are \code{initBeta}, \code{initBetaN}, \code{initIncu}, \code{initInf}, \code{initDia} )
    }
    \item{LBInits<-}{\code{signature(object = "LBOptions", value = "list")}:
      \cr assigns \code{value} to all initial value slots (as there are \code{initBeta}, \code{initBetaN}, \code{initIncu}, \code{initInf}, \code{initDia} )
    }
    \item{LBModel}{\code{signature(object = "LBOptions")}: 
      \cr returns value of slot \code{LBModel}      
    }
    \item{LBModel<-}{\code{signature(object = "LBOptions", value = "vector")}:
      \cr assigns \code{value} to slot \code{LBModel}      
    }
    \item{LBOptions}{\code{signature(object = "LBOptions")}: 
      \cr returns values of real option slots (as there are \code{seed}, \code{LBModel}, \code{ignoreData} )
    }
    \item{LBOptions<-}{\code{signature(object = "LBOptions", value = "list")}: 
      \cr assigns value to real option slots (as there are \code{seed}, \code{LBModel}, \code{ignoreData} )
    }
    \item{optionsAsDataFrame}{\code{signature(object = "LBOptions")}:
      \cr returns real option values in a dataframe format
    }
    \item{seed}{\code{signature(object = "LBOptions")}:
      \cr returns value of slot \code{seed}      
    }
    \item{seed<-}{\code{signature(object = "LBOptions", value = "numeric")}:
      \cr assigns \code{value} to slot \code{seed}
    }
    \item{show}{\code{signature(object = "LBOptions")}: 
      \cr shows the object
    }
    \item{simulate}{\code{signature(object = "LBOptions", layout = "Layout")}:
      \cr simulates data according to the specified model and init values and the given layout structure 
    }
    \item{summary}{\code{signature(object = "LBOptions")}:
      \cr gives a summary of the object (at the moment no difference to \code{show} )
    }
	 }
}
\author{ M. Hoehle and U. Feldmann }
%\note{ ~~further notes~~ }

% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	See also \code{\link{LBOptionsMCMC-class}} and \code{\link{LBOptionsML-class}}}
\examples{
  opts <- new( "LBOptions", seed=2003,
                            LBmodel=c( "gamma", "gamma", "gamma", FALSE ),
                            ignoreData=c( TRUE, FALSE, FALSE ),
                            initBeta=list( 0.125, 0.001, 0.001 ),
                            initBetaN=list( init=0.018, gamma=0.001, delta=0.001 ),
                            initIncu=list( g=6.697, g.gamma=0.001, g.delta=0.001,
                                           d=0.840, d.gamma=0.001, d.delta=0.001 ),
                            initInf=list( 1.772, 0.001, 0.001, 0.123, 0.001, 0.001 ),
                            initDia=list( 149.126, 0.001, 0.001, 8.737, 0.001, 0.001 ) )
 layout <- new( "LBLayout", S0=matrix( c( 14, 14 ), ncol=2 ),
                            E0=matrix( c( 0, 1 ), ncol=2 ) )

 exp <- simulate( opts, layout=layout )
}
\keyword{classes}
