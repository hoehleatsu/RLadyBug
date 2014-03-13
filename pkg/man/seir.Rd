\name{seir}
\alias{seir}
\encoding{latin1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Parameter estimation in SEIR-Models based on ML or MCMC }
\description{
  Inference is perform for the
  parameters in an SEIR-model based on the data in \code{experiment}.
  The actuall class of \code{options} (\code{OptionsML} or
  \code{OptionsMCMC}) decides what type of inference is performed.
}
\usage{
seir(experiment, options, debug = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{experiment}{ Data corresponding to an Experiment}
  \item{options}{ An object of class \code{Options}. The specific action
    (ML or MCMC estimation) is determined by the subclass of
    \code{options}.}
  \item{debug}{Boolean (default \code{FALSE}) specifying whether to
    yield additional debug information in case of problems. For example
    the \code{ladybug.system.out} and \code{ladybug.system.err} are not
    removed after the call and can be found in the current working directory.}
}
\details{
  Estimation is performed by calling LadyBug using a \code{.jcall} to the
  appropriate method in the Java class
  \code{sir.estimate.LadyBug}. Output is read from file and converted
  into an appropriate object of class \code{\link{LBInference-class}}.

  Currently the method branches on the appropriate method using an
  \code{if}. Should become a generic method as some point.

  Note that the \code{system.out} and \code{system.err} from the java
  call are saved in the currented working directory (the directory has
  to be writable). After a successfull call the files are deleted
  unless one uses the \code{debug} option.
  }
\value{
  An object of class \code{Inference}
}
\author{U. Feldmann and M. \enc{Höhle}{Hoehle}}
\seealso{\code{\link{LBOptions-class}},\code{\link{LBOptionsML-class}},\code{\link{LBOptionsMCMC-class}}}
\examples{
data("csfvML")
ml <- seir(csfvML, csfvML.opts)
ml

#MCMC Inference for the data from the Laevens experiment
data("laevens")
#Modify such that the checks at CRAN are only done with a
#minimum sample size (1000 samples, no thin and a burun of 1000).
if (!RLadyBug.options("allExamples")) {
  algo(laevens.opts) <- c(1000,1,1000)
}
#Algo part of the Options
algo(laevens.opts)

inf.mcmc <- seir(laevens,laevens.opts)
#Show some results
inf.mcmc

#Analysis through coda (library coda is called when starting RLadyBug)
samples <- mcmc(samplePaths(inf.mcmc))
plot(samples[,"beta"])

}
\keyword{htest}

