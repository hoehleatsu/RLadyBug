\encoding{latin1}
\name{RLadyBug.options}
\alias{RLadyBug.options}
\alias{reset.RLadyBug.options}

\title{Options of the \pkg{RLadyBug} Package}

\description{
  Query, set or reset options specific to the \pkg{RLadyBug}
  package, similar to what \code{\link{options}} does for global settings.
}

\usage{
RLadyBug.options(...)
reset.RLadyBug.options()
}

\arguments{
  \item{\dots}{
    Either empty, or a sequence of option names (as strings),
    or a sequence of \code{name=value} pairs, or a named list of
    options. Available options are:
    \describe{
      \item{allExamples:}{
	Logical flag mainly for CRAN-compatibility, i.e. to prevent
	cumbersome computations in help file examples from being run by
	CRAN servers. This option defaults to \code{TRUE} unless the
	environment variable \env{_R_CHECK_TIMINGS_} is set when
	attaching the \pkg{RLadyBug} package.
      }
      \item{ladyBugPath:}{
	Character string pointing to the location of the LadyBug
	directory. This contains the LadyBug jar file in the subdirectoy
	bin/ and examples in the examples/ directory. Usually, this
	parameter is set automatically at package initialization.
      }
    }
  }
}
\value{
  \code{reset.RLadyBug.options} reverts all options to their default
  values and (invisibly) returns these in a list.

  For \code{RLadyBug.options}, the following holds:
  \itemize{
    \item If no arguments are given, the current values of all package options are
    returned in a list.
    \item If one option name is given, the current value of this
    option is returned (\emph{not} in a list, just the value).
    \item If several option names are given, the current values of these options
    are returned in a list.
    \item If \code{name=value} pairs are given, the named options
    are set to the given values, and the \emph{previous} values of
    these options are returned in a list.
  }
}

\author{
  Michael \enc{Höhle}{Hoehle},
  inspired by the implementation of \code{surveillance.options()} in the
  \pkg{surveillance} coded by Sebastian Meyer.
}

\examples{
RLadyBug.options()
}

\keyword{environment}

