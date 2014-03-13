\name{LBLayout-class}
\docType{class}
\alias{LBLayout-class}
\alias{layoutAsDataFrame,LBLayout-method}
\alias{layoutMatrixes,LBLayout-method}
\alias{show,LBLayout-method}
\alias{summary,LBLayout-method}
%undocumented code objects
\alias{layoutAsDataFrame}
\alias{layoutMatrixes}

\title{Class "LBLayout" -- grid layout structure  }
\description{ This class is used to specify the spatial (or structural)
  arrangement of the populations. Currently only a grid layout is handled.}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("LBLayout", ...)}.
}
\section{Slots}{
	 \describe{
    \item{\code{S0}:}{Object of class \code{"matrix"} A matrix
      specifying the number of initially susceptible in each unit. }
    \item{\code{E0}:}{Object of class \code{"matrix"} A matrix
      specifying the number of initially exposed in each unit. }
  }
}
\section{Methods}{
  \describe{
    \item{layoutAsDataFrame}{\code{signature(object = "LBLayout")}:  Returns a data frame containing the columns "u", "x", "y", "S" and
    "E" }
    \item{layoutMatrixes}{\code{signature(object = "LBLayout")}:
      provides a list with S0 and E0 in matrix form}
    \item{show}{\code{signature(object = "LBLayout")}: as usual }
    \item{summary}{\code{signature(object = "LBLayout")}: as usual }
	 }
}
\note{ Currently, LadyBug is not able to handle more than one initially
  exposed. This will change in the near future. }
\seealso{
	See also \code{\link{LBExperiment-class}}.
}
\examples{
data(csfv)
}
\keyword{classes}
