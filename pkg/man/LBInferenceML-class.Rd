\name{LBInferenceML-class}
\docType{class}
\alias{LBInferenceML-class}
\alias{infValues,LBInferenceML-method}
\alias{infValues<-,LBInferenceML-method}
\alias{show,LBInferenceML-method}
\alias{summary,LBInferenceML-method}
\alias{R0,LBInferenceML-method}

\title{Class "LBInferenceML" -- results from ML inference in
  SEIR models }
\description{ Results from a maximum likelihood inferenceise SEIR models}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("LBInferenceML", ...)}.
	 ~~ describe objects here ~~ 
}
\section{Slots}{
	 \describe{
    \item{\code{cov}:}{Object of class \code{"matrix"} giving the
      covariance matrix of all parameters, i.e. this is the inverse
      negative Hessian matrix evaluated at the MLE. }
    \item{\code{corr}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{paramHat}:}{Object of class \code{"numeric"} containing
      the MLE of all parameters~ }
    \item{\code{paramSe}:}{Object of class \code{"numeric"}  containing
      the standard error of all parameters}
    \item{\code{aic}:}{Object of class \code{"numeric"} AIC of the fitted model }
    \item{\code{loglik}:}{Object of class \code{"numeric"}  containing
      the loglik at the MLE }
  }
}
\section{Extends}{
Class \code{"LBInference"}, directly.
}
\section{Methods}{
  \describe{
    \item{infValues}{\code{signature(object = "LBInferenceML")}: get all
      slots }
    \item{infValues<-}{\code{signature(object = "LBInferenceML")}: set a
      list of slots }
    \item{show}{\code{signature(object = "LBInferenceML")}: as usual }
    \item{summary}{\code{signature(object = "LBInferenceML")}: as usual }
    \item{R0}{\code{signature(object = "LBInferenceML")}: Compute the
      basic reproduction ratio based on the largest eigenvalue of the
      transmission matrix.}
  }
}
\seealso{
  \code{\link{LBInference-class}}
}
\examples{
data(laevensML)
seir(laevensML,laevensML.opts)
}
\keyword{classes}
