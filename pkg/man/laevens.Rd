\name{laevens}
\alias{laevens}
\alias{laevensML}
\alias{laevensML.opts}
%I am not completely sure where this object is actually used
\alias{laevens.opts}
\alias{laevens.opts.mcmc}
\docType{data}
\title{ CSFV Experiment by Laevens et. al }
\description{
   In this experiment the spread of CSFV was investigated in a \eqn{1\times
   3}{1x3} layout with \eqn{S(0)=(5,5,6)} and \eqn{E(0)=(0,1,0)} slaughter
   pigs. Every second day all pigs still alive were investigated using a
   virus isolation test based on blood plasma.
}
\usage{data(laevens)}
\format{
  \preformatted{
  The format is:
Formal class 'LBExperiment' [package "RLadyBug"] with 2 slots
  ..@ data  :`data.frame':	15 obs. of  6 variables:
  .. ..$ x: int [1:15] 1 1 1 1 1 1 1 1 1 1 ...
  .. ..$ y: int [1:15] 2 1 1 1 1 2 2 2 2 3 ...
  .. ..$ E: int [1:15] 0 18 14 20 20 10 10 10 6 20 ...
  .. ..$ I: int [1:15] 6 24 20 26 26 16 16 16 12 26 ...
  .. ..$ R: int [1:15] 12 34 28 34 34 32 34 28 30 28 ...
  .. ..$ D: int [1:15] 12 34 28 34 34 32 34 28 30 28 ...
  ..@ layout:Formal class 'LBLayout' [package "RLadyBug"] with 2 slots
  .. .. ..@ S0: num [1, 1:3] 5 5 6
  .. .. ..@ E0: num [1, 1:3] 0 1 0
  }
}
\details{
  Together with an object laevens also an object \code{laevens.opts} is loaded
  which is an object of class \code{\link{LBInferenceMCMC-class}} suitable for
  MCMC inference

   The data(laevensML) contains a version of the data, where a constant
   incubation time of c=6 is assumed. Here \code{laevens.opts}
   contains the necessary object for maximum likelihood inference.
}
\source{
  H. Laevens, F. Koenen, H. Deluyker and A. de Kruif, Experimental
  infection of slaughter pigs with classical swine fever virus:
  transmission of the virus, course of the disease and antibody response,
  Vet. Rec., 1999,  145:243-248.
}
\examples{
data(laevens)

}
\keyword{datasets}
