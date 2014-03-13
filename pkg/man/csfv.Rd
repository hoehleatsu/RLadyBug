\name{csfv}
\alias{csfv}
\alias{csfvML}
\alias{csfvTDprior}
\alias{csfv.opts}
\alias{csfvML.opts}
\alias{csfvTDprior.opts}
\docType{data}
\title{ CSFV Transmission Experiment }
\description{
  Analysis of the transmission rates in the classical swine fever virus
  transmission experiment in the Dewulf et al. (2001) article.
}
\usage{data(csfv)}
\details{
  The \code{csfvML} dataset is a version of \code{csfv}, where the
  exposure time is specified with an artificially assumed fixed
  incubation time of 6 days, except for the innoculated individual which
  has an incubation time of three days. This is rather ad hoc but allows
  us to calculate ML estimates. 

  The \code{csfvTDprior} dataset is a version of \code{csfv}, where
  rather strong priori distributions are assumed for the waiting time
  from exposure until diagnosis.

  Note that respective \code{csfv.opts}, \code{csfvML.opts} and
  \code{csfvTD.opts} objects are loaded which provide an appropriate
  estimation method.
}
\source{
  An experimental infection with classical swine fever in E2 sub-unit
  marker-vaccine vaccinated and in non-vaccinated pigs, Vaccine 19,
  pages 475-482.
}

\examples{
\dontrun{data(csfv)}
\dontrun{seir(csfv,csfv.opts)}
}
\keyword{datasets}
