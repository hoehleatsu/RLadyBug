\name{LBOptionsML-class}
\docType{class}
\alias{LBOptionsML-class}
\alias{show,LBOptionsML-method}
\alias{summary,LBOptionsML-method}
\alias{writeOptionFile,LBOptionsML-method}

\title{Class "LBOptionsML" -- maximum likelihood inference in SEIR models }
\description{ Specification of LadyBug SEIR models using maximum likelihood inference }
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("LBOptionsML", seed, LBmodel, ignoreData, initBeta, initBetaN, initIncu, initInf, initDia, algo, randomWalk)}.
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

\section{Extends}{
Class \code{"LBOptions"}, directly.
}

\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "LBOptionsML")}: 
      \cr shows the object
    }
    \item{summary}{\code{signature(object = "LBOptionsML")}:
      \cr gives a summary of the object (at the moment no difference to \code{show} )
    }
    \item{writeOptionFile}{\code{signature(object = "LBOptionsML", filename = "vector" )}:
      \cr writes a file containing all options as input for java
    }
	 }
}

\author{ M. Hoehle and U. Feldmann }
%\note{ ~~further notes~~ }

% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	See also \code{\link{LBOptions-class}} and \code{\link{LBOptionsMCMC-class}}}
\examples{
  opts <- new( "LBOptionsML", seed=2003,
                              LBmodel=c( "constant", "gamma", "none", FALSE ),
                              ignoreData=c( FALSE, FALSE, FALSE ),
                              initBeta=list( 0.4, 0.001, 0.001 ),
                              initBetaN=list( init=0.005, gamma=0.001, delta=0.001 ),
                              initIncu=list( asis=TRUE ),
                              initInf=list( 1, 0.001, 0.001, 0.11, 0.001, 0.001 ),
                              initDia=list( 8, 0.001, 0.001, 0.8, 0.001, 0.001 ) )
}
\keyword{classes}
