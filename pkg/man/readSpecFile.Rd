\name{readSpecFile}
\alias{readSpecFile}
\encoding{latin1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Read LadyBug files and create corresponding S4 RLadyBug objects }
\description{
  Data and specification files in the LadyBug files are read and
  converted to S4 RLadyBug objects.
}
\usage{
readSpecFile(options, data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{options}{Filename of the LadyBug options (i.e. the .sir) file}
  \item{data}{Filename of the Data in LadyBug format}
}
\details{
  n.a.  
}
\value{
  A list containing
  \item{options}{The information relevant to the \code{Options}}
  \item{experiment}{An object of class \code{Object} containing the
    layout and the event times of the data}
}
\author{U. Feldmann and M. \enc{Höhle}{Hoehle}}
\examples{
\dontrun{csfv <- readSpecFile( ladybugExample( "/csfv/mcmc.sir"),ladybugExample( "/csfv/csfv.data" ))}
#Show the MCMC options
\dontrun{csfv$options}
#Show the layout and initial configuration
\dontrun{csfv$experiment}
}
\keyword{utilities}
