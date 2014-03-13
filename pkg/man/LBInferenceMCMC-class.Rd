\name{LBInferenceMCMC-class}
\docType{class}
\alias{LBInferenceMCMC-class}
\alias{infValues,LBInferenceMCMC-method}
\alias{infValues<-,LBInferenceMCMC-method}
\alias{initialize,LBInferenceMCMC-method}
\alias{plot,LBInferenceMCMC,missing-method}
\alias{R0,LBInferenceMCMC-method}
\alias{samplePaths,LBInferenceMCMC-method}
\alias{show,LBInferenceMCMC-method}
\alias{summary,LBInferenceMCMC-method}
%undocumented code objects
\alias{R0}
\alias{samplePaths}

\title{Class "LBInferenceMCMC" -- results from MCMC inference in SEIR models}
\description{ This class holds the results from MCMC inference for SEIR
  models, i.e. sample paths and provides routines to calculate R0}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("LBInferenceMCMC", paramHat, paramSe, aic, loglik, samplePaths)}.
}
\section{Slots}{
	 \describe{
    \item{\code{samplePaths}:}{Object of class \code{"data.frame"} A
      data frame containing the va }
    \item{\code{paramHat}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{paramSe}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{aic}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{loglik}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Extends}{
Class \code{"LBInference"}, directly.
}
\section{Methods}{
  \describe{
    \item{infValues}{\code{signature(object = "LBInferenceMCMC")}: ... }
    \item{infValues<-}{\code{signature(object = "LBInferenceMCMC")}: ... }
    \item{initialize}{\code{signature(.Object = "LBInferenceMCMC")}: ... }
    \item{plot}{\code{signature(x = "LBInferenceMCMC", y = "missing")}:
      Important is the \code{which} argument
      \describe{
	\item{\code{"beta"}}{CODA diagnostics for the \eqn{\beta}{beta}
	  parameter}
	\item{\code{"betabetaN"}}{Provides a diagnostic plot and HPD interval
	  for the \eqn{\frac{\beta}{\beta_n}}{beta/betan} ratio.}
    }}
    \item{R0}{\code{signature(object = "LBInferenceMCMC")}: Compute the
      basic reproduction ratio for each sample. Mean, median, etc. are
      then computed. }
    \item{samplePaths}{\code{signature(object = "LBInferenceMCMC")}: get
      the sample paths}
    \item{show}{\code{signature(object = "LBInferenceMCMC")}: as usual }
    \item{summary}{\code{signature(object = "LBInferenceMCMC")}: as usual }
  }
}
\seealso{
  \code{\link{LBInference-class}}
}
\examples{

#Load Laevens (1999) data
data("laevens")
#Modify such that the checks at CRAN are only done with a
#minimum sample size (1000 samples, no thin and a burun of 1000).
if (!RLadyBug.options("allExamples")) {
  algo(laevens.opts) <- c(1000,1,1000)
}

#Algo part of the Options
algo(laevens.opts)

#Run SEIR model inference
inf.mcmc <- seir(laevens,laevens.opts)

#Results
inf.mcmc

#Analysis through coda (library coda is called when starting RLadyBug)
samples <- mcmc(samplePaths(inf.mcmc))
plot(samples[,"beta"])

#Look at the \beta/\beta_n ratio
ratio <- plot(inf.mcmc,which = "betabetaN")
c(mean=ratio$mean,ratio$hpd)

#R0
quantile(R0(inf.mcmc,laevens),c(0.025,0.5,0.975))

}

\keyword{classes}
