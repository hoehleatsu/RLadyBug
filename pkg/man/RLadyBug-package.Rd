\encoding{latin1}
\name{RLadyBug-package}
\alias{RLadyBug-package}
\alias{RLadyBug}
\docType{package}
\title{
  Analysis of infectious diseases using stochastic epidemic models
}
\description{
  \pkg{RLadyBug} is an S4-package for the simulation, visualization and
  estimation of stochastic epidemic models in R. Utilizing the
  Susceptible-Exposed-Infected-Recovered (SEIR) model
  as mathematical framework, maximum likelihood and Bayesian inference can be
  performed to estimate the parameters in data from a single outbreak of an
  infectious disease typical in e.g. disease transmission experiments.
  The (twin)SIR modelling of infectious disease surveillance data
  introduced with version 0.5 has (with version 0.7) been migrated to the
  package \pkg{surveillance} (>= 1.3.0).
}
\details{
\tabular{ll}{
Package: \tab RLadyBug\cr
Type: \tab Package\cr
Version: \tab 0.7-1\cr
Date: \tab 2012-02-19\cr
License: \tab see file LICENSE \cr
}
\itemize{
  \item Likelihood and Bayesian inference for the SEIR-modelling of a
  single outbreak in a heterogenous population as in \enc{Höhle}{Hoehle}
  et al. (2005) using an additive intensity model. Typical examples
  are animal disease transmission experiments. Event observations
  can be  missing. 
  \item  Analysis of the same type of data structure based on approximate
  inference using Poisson regression as in Klinkenberg et al. (2002)
}

  The aim of the package is to take a step towards
  statistical software supporting parameter estimation, the calculation
  of confidence intervals and hypothesis testing for stochastic epidemic
  models.

  The package works by using \pkg{rJava} to interface Java code doing
  the actual MCMC inference. Since the \code{system.out} and
  \code{system.err} from the java call are saved in the current
  working directory it is necessary for the \code{seir} function to work
  that write permissions to the the current path (\code{getwd()}) exist.
  
}
\author{
Michael \enc{Höhle}{Hoehle}, Ulrike Feldmann, and Sebastian Meyer

Maintainer: Michael \enc{Höhle}{Hoehle} \email{hoehle@stat.uni-muenchen.de}
}
\references{
  RLadyBug -- An R package for working with stochastic epidemic models
  (2007), M. \enc{Höhle}{Hoehle} and U. Feldmann, \emph{Computational Statistics
  and Data Analysis}, 52(2), pp. 680--686.

  \enc{Höhle}{Hoehle}, M., \enc{Jørgensen}{Joergensen}, E. and
  O'Neill, P.D. (2005), \emph{Journal of the Royal
  Statistical Society}, Series C, 54(2), pp. 349--366.

  Klinkenberg, D., De Bree, J., Laevens, H. and De Jong,
  M. C. M. (2002), Within- and between-pen transmission of Classical
  Swine Fever Virus: a new method to estimate the basic reproduction
  ratio from transmission experiments, \emph{Epidemiol. Infect.}, 128, 293-299.
}
\keyword{ package }
\seealso{
Package \pkg{\link[surveillance:surveillance-package]{surveillance}}
}
\examples{
\dontrun{demo("article-csda")}
}
