\name{LBInference-class}
\docType{class}
\alias{LBInference-class}
\alias{infValues,LBInference-method}
\alias{infValues<-,LBInference-method}
\alias{show,LBInference-method}
\alias{summary,LBInference-method}
%undocumented code objects
\alias{infValues}
\alias{infValues<-}

\title{Class "LBInference" -- captures results for SEIR inference }
\description{ This class contains results from inference by the
  LadyBug program.}
\section{Objects from the Class}{
Usually, there is no need to create objects of this class by hand.
}
\section{Slots}{
	 \describe{
    \item{\code{paramHat}:}{Object of class \code{"numeric"} A vector
      with point estimates for the model parameters. }
    \item{\code{paramSe}:}{Object of class \code{"numeric"} Point
      estimates for the standard error. }
    \item{\code{aic}:}{Object of class \code{"numeric"} Akaikes
      Information Criterion. }
    \item{\code{loglik}:}{Object of class \code{"numeric"} Value of the
      log likelihood. }
  }
}
\section{Methods}{
  \describe{
    \item{infValues}{\code{signature(object = "LBInference")}: Fetches a
      list with all slots. }
    \item{infValues<-}{\code{signature(object = "LBInference")}: ... }
    \item{show}{\code{signature(object = "LBInference")}: ... }
    \item{summary}{\code{signature(object = "LBInference")}: ... }
	 }
}
\seealso{
    \code{\link{LBInferenceML-class}} and   \code{\link{LBInferenceMCMC-class}}
}
\examples{
data(oneill)
mcmc <- seir(oneill,oneill.opts)
\dontrun{infValues(mcmc)}
}

\keyword{classes}
