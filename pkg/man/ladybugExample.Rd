\name{ladybugExample}
\alias{ladybugExample}
\encoding{latin1}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Access files in the LadyBug directory examples directory }
\description{
  A small helper function to access files in the LadyBug
  \emph{examples/} directory.
}
\usage{
ladybugExample(exp.file)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{exp.file}{ The filename relative to <LADYBUG>/examples/ }
}
\value{
  The complete filename, where <LADYBUG> is replaced by
  options("ladybugPath").

}
\author{ M. \enc{Höhle}{Hoehle} }
\examples{
\dontrun{ladybugExample( "/csfv/mcmc.sir" )}
}
\keyword{utilities}

