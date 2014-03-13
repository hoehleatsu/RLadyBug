\name{LBOptionsMCMC-class}
\docType{class}
\alias{LBOptionsMCMC-class}
\alias{algo,LBOptionsMCMC-method}
\alias{algo<-,LBOptionsMCMC-method}
\alias{LBOptions,LBOptionsMCMC-method}
\alias{LBOptions<-,LBOptionsMCMC-method}
\alias{optionsAsDataFrame,LBOptionsMCMC-method}
\alias{randomWalk,LBOptionsMCMC-method}
\alias{randomWalk<-,LBOptionsMCMC-method}
\alias{show,LBOptionsMCMC-method}
\alias{summary,LBOptionsMCMC-method}
\alias{writeOptionFile,LBOptionsMCMC-method}
%undocumented code objects
\alias{randomWalk}
\alias{randomWalk<-}
\alias{algo}
\alias{algo<-}
\alias{writeOptionFile}

\title{Class "LBOptionsMCMC" -- Specification of MCMC estimation in SEIR models. }
\description{ Specification of MCMC estimation in SEIR models.  }
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("LBOptionsMCMC", seed, LBmodel, ignoreData, initBeta, initBetaN, initIncu, initInf, initDia, algo, randomWalk)}.
}
\section{Slots}{
	 \describe{
    \item{\code{algo}:}{Object of class \code{"vector"}. Contains a specification of the MCMC algorithm, i.e. a vector with names
      \tabular{cl}{
        \code{samples} \tab how many? (without burnin) \cr
        \code{thin} \tab how to thin the random numbers \cr
        \code{burnin} \tab the first x random numbers will be ignored
      }
    }
    \item{\code{randomWalk}:}{Object of class \code{"vector"}. Contains a specification of the random walk, i.e. a vector with names
      \tabular{cl}{
        \code{betaRWsigma} \tab sigma concerning parameter \eqn{\beta}
          \cr
        \code{betaNRWsigma} \tab sigma concerning parameter \eqn{\beta_n}
          \cr
        \code{gammaERWsigma} \tab sigma concerning parameter \eqn{\gamma} of the gamma distribution of the incubation time
          \cr
        \code{deltaERWsigma} \tab sigma concerning parameter \eqn{\delta} of the gamma distribution of the incubation time
          \cr
        \code{gammaIRWsigma} \tab sigma concerning parameter \eqn{\gamma} of the gamma distribution of the infectious time
          \cr
        \code{deltaIRWsigma} \tab sigma concerning parameter \eqn{\delta} of the gamma distribution of the infectious time
          \cr
        \code{gammaDRWsigma} \tab sigma concerning parameter \eqn{\gamma} of the gamma distribution of the seroconversion time
          \cr
        \code{deltaDRWsigma} \tab sigma concerning parameter \eqn{\delta} of the gamma distribution of the seroconversion time
          \cr
        \code{ERWsigma} \tab sigma concerning unknown exposure times
      }
    }
    \item{\code{seed}:}{Object of class \code{"numeric"}. The seed value
      to use when calling the Java program }
    \item{\code{LBmodel}:}{Object of class \code{"vector"}. Contains a
      specification of the SEIR model, i.e. a vector with names
      \tabular{cl}{
	\code{incuTimePDF}\tab distribution of incubation time \cr
	\code{infTimePDF} \tab distribution of the infectious time \cr
	\code{diagTimePDF} \tab distribution of the seroconversion time \cr
	\code{meanVar} \tab mean variance representation of periods (TRUE/FALSE)\cr
	}}
    \item{\code{ignoreData}:}{Object of class \code{"vector"}. Booleans
      \tabular{cl}{
	\code{ignoreE} \tab Ignore the specified exposure (E) event times \cr
	\code{ignoreI} \tab Ignore the specified infective (I) event times\cr
	\code{ignoreD} \tab Ignore the specified diagnose (D) event time\cr
      }}
    \item{\code{initBeta}:}{Object of class \code{"list"}. Inital values:
      \tabular{cl}{
        \code{init} \tab for \eqn{\beta} \cr
        \code{gamma} \tab for the priori parameter \eqn{\gamma} \cr
        \code{delta} \tab for the priori parameter \eqn{\delta} 
      }
    }
    \item{\code{initBetaN}:}{Object of class \code{"list"}. Inital values:
      \tabular{cl}{
        \code{init} \tab for \eqn{\beta_n} \cr
        \code{gamma} \tab for the priori parameter \eqn{\gamma} \cr
        \code{delta} \tab for the priori parameter \eqn{\delta} 
      }
    }
    \item{\code{initIncu}:}{Object of class \code{"list"}. Initial values: 
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
    \item{\code{initInf}:}{Object of class \code{"list"}. Initial values: 
      \tabular{cl}{
        \code{g} \tab for parameter \eqn{\gamma} of the gamma distribution of the infectious time \cr
        \code{g.gamma} \tab for the parameter \eqn{gamma} of the distribution of g \cr
        \code{g.delta} \tab for the parameter \eqn{delta} of the distribution of g \cr
        \code{d} \tab for parameter \eqn{\delta} of the gamma distribution of the infectious time \cr
        \code{d.gamma} \tab for the parameter \eqn{gamma} of the distribution of d \cr
        \code{d.delta} \tab for the parameter \eqn{delta} of the distribution of d \cr
      }
    }
    \item{\code{initDia}:}{Object of class \code{"list"}. Initial values: 
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

\section{Extends}{
Class \code{"LBOptions"}, directly.
}
\section{Methods}{
  \describe{
    \item{algo}{\code{signature(object = "LBOptionsMCMC")}:
      \cr returns value of slot \code{algo}      
    }
    \item{algo<-}{\code{signature(object = "LBOptionsMCMC", value = "vector")}:\cr assigns \code{value} to slot \code{algo}
    }
    \item{LBOptions}{\code{signature(object = "LBOptionsMCMC")}: 
      \cr returns values of real option slots (as there are \code{seed}, \code{LBModel}, \code{ignoreData}, \code{algo}, \code{randomWalk} )
    }
    \item{LBOptions<-}{\code{signature(object = "LBOptionsMCMC", value = "list")}: 
      \cr assigns value to real option slots (as there are \code{seed}, \code{LBModel}, \code{ignoreData}, \code{algo}, \code{randomWalk} )
    }
    \item{optionsAsDataFrame}{\code{signature(object = "LBOptionsMCMC")}:
      \cr returns real option values in a dataframe format
    }
    \item{randomWalk}{\code{signature(object = "LBOptionsMCMC")}:
      \cr returns value of slot \code{randomWalk}      
    }
    \item{randomWalk<-}{\code{signature(object = "LBOptionsMCMC", value = "vector" )}:
      \cr assigns \code{value} to slot \code{randomWalk}
    }
    \item{show}{\code{signature(object = "LBOptionsMCMC")}: 
      \cr shows the object
    }
    \item{summary}{\code{signature(object = "LBOptionsMCMC")}:
      \cr gives a summary of the object (at the moment no difference to \code{show} )
    }
    \item{writeOptionFile}{\code{signature(object = "LBOptionsMCMC", filename="vector")}:
      \cr writes a file containing all options as input for java
    }
	 }
}

\author{ M. Hoehle and U. Feldmann }
%\note{ ~~further notes~~ }

% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	See also \code{\link{LBOptions-class}} and \code{\link{LBOptionsML-class}}}
\examples{
  opts <- new( "LBOptionsMCMC", algo=c( samples=2500, thin=25, burnin=50000 ),
                                randomWalk=c( "betaRWsigma"= 0.1,
                                              "betaNRWsigma"=0.1,
                                              "gammaERWsigma"=3,
                                              "deltaERWsigma"=1,
                                              "gammaIRWsigma"=1,
                                              "deltaIRWsigma"=1,
                                              "gammaDRWsigma"=3,
                                              "deltaDRWsigma"=1,
                                              "ERWsigma"=6 ),  
                                seed=2003,
                                LBmodel=c( "gamma", "gamma", "gamma", FALSE ),
                                ignoreData=c( TRUE, FALSE, TRUE ),
                                initBeta=list( 0.4, 0.001, 0.001 ),
                                initBetaN=list( init=0.005, gamma=0.001, delta=0.001 ),
                                initIncu=list( g=1, g.gamma=0.001, g.delta=0.001,
                                               d=0.11, d.gamma=0.001, d.delta=0.001 ),
                                initInf=list( 1, 0.001, 0.001, 0.11, 0.001, 0.001 ),
                                initDia=list( 8, 0.001, 0.001, 0.8, 0.001, 0.001 ) )

}
\keyword{classes}
