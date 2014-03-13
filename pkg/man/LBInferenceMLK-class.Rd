\name{LBInferenceMLK-class}
\docType{class}
\alias{LBInferenceMLK-class}
\alias{infValues,LBInferenceMLK-method}
\alias{infValues<-,LBInferenceMLK-method}
\alias{show,LBInferenceMLK-method}
\alias{summary,LBInferenceMLK-method}

\title{Class "LBInferenceMLK" -- results from MLK inference in
  SEIR models }
\description{ Results from the Klinkenberg inference method}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("LBInferenceMLK", ...)}.
	 ~~ describe objects here ~~ 
}
\section{Slots}{
	 \describe{
    \item{\code{r0}:}{Object of class \code{"numeric"} 
       }
    \item{\code{r0.ci}:}{Object of class \code{"numeric"} containing the 
      confindence intervall of r0 }
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
Class \code{"LBInferenceML"}, directly.
}
\section{Methods}{
  \describe{
    \item{infValues}{\code{signature(object = "LBInferenceMLK")}: get all
      slots }
    \item{infValues<-}{\code{signature(object = "LBInferenceMLK")}: set a
      list of slots }
    \item{show}{\code{signature(object = "LBInferenceMLK")}: as usual }
    \item{summary}{\code{signature(object = "LBInferenceMLK")}: as usual }
	 }
}
\seealso{
  \code{\link{LBInferenceML-class}}
}
%\examples{}
\keyword{classes}
