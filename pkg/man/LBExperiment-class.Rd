\name{LBExperiment-class}
\docType{class}
\alias{LBExperiment-class}
\alias{show,LBExperiment-method}
\alias{plot,LBExperiment-method}
\alias{plot,LBExperiment,missing-method}
\alias{summary,LBExperiment-method}
\alias{data2events,LBExperiment-method}
%undocumented code objects
\alias{data2events}

\title{Class "LBExperiment" }
\description{ S4 class containing the data and the layout of the
  infectious disease data}

\section{Slots}{
  \describe{
    \item{\code{data}:}{ Data Frame with six columns: x, y, E, I, R, D }
    \item{\code{layout}:}{Object of class \code{"LBLayout"} }
        \item{\code{T}:}{A \code{"numeric"} specifying how long the epidemic was observed. }
  }
}

\section{Methods}{
  \describe{
    \item{data2events}{\code{signature(object = "LBExperiment")}: convert
      the data.frame of events for each individual to a time order data.frame of
      events for the entire Experiment. The information about each
      individual is lost. This function is used internally.
    }
    \item{show}{\code{signature(object = "LBExperiment")}: shows all slots
      of the LBExperiment object.}
    \item{setLayout<-}{\code{signature(object = "LBExperiment")}: sets the
      Layout.}
    \item{plot}{\code{signature(signature(x="LBExperiment",
	y="missing"), function(x, y, type=NULL, options=NULL, ...))}
      The \code{type} argument should be a formula specifying the
      desired type of plot. By providing an additional \code{options}
      list individual parameters for the plots are provided. Valid
      formulae are
      \describe{
	\item{\code{state ~ time | position}}{The number of susceptible,
	  infectious and recovered as a function of time for each
	  unit. Warning: in case there are many units this plot
	  might be rather useless.}
	\item{\code{state ~ time}}{shows the
	  total number of susceptible, infectious and recovered (i.e. summed
	  over all units) as a function of time. Individual options are
	  \describe{
	    \item{\code{stacked}}{boolean whether stacked boxplots or just
	      time-series are shown.}
	}}
	\item{\code{state ~ 1|position}}{illustrates the three multivariate time
	  series (susceptible, exposed,
	  infected) as a "film" with \code{noOfPics} pictures. Individual
	  options are
	  \describe{
	    \item{\code{chart}}{Either \code{"pie"} or \code{"bar"}, where
	      the latter is default.}
	    \item{\code{justInf}}{if \code{FALSE} pie charts with the number of
	      S(t),E(t),I(t) are shown, otherwise only the number of infectious is
	      shown, where the radius shows the proportion.}
	    \item{\code{noOfPics}}{How many pictures in the animation. If not
	      saved set the "History" attribute of the X11.}
	    \item{\code{PDF}}{If \code{TRUE} the results are saved in PDF
	      Files with the base name \code{name}.}
	    \item{\code{name}}{Base name of the generated PDF Files. The
	      actual files are then names \code{name}-\code{addstr}-\code{number}.pdf}
	    \item{\code{addstr}}{This is added to the base name.}
	}}
	\item{\code{individual ~ time}}{shows all events for each individual}
	\item{\code{individual ~ time} | position}{show individual
	  histories of each individual aligned to the same time axis}
      }
      Additional parameters to the underlying plot rountine,
      e.g. \code{xlab}, \code{legend=FALSE}, \code{color}, are passed using \code{...}. 
    }
  }
}
\examples{
sim.layout <- new( "LBLayout", S0=matrix( c( 13, rep( 14, 7 ) ), ncol=4 ),
                  E0=matrix( c(  1, rep(  0, 7 ) ), ncol=4 ) )
sim.opts <- new( "LBOptions", seed=2006,
                            LBmodel=c( "gamma", "gamma", "gamma", FALSE ),
                            ignoreData=c( FALSE, FALSE, FALSE ),
                            initBeta =list( init=0.125,
                                        gamma=0.001, delta=0.001 ),
                            initBetaN=list( init=0.018,
                                        gamma=0.001, delta=0.001 ),
                            initIncu=list( asis=FALSE, const=FALSE,
                                    g=6.697, g.gamma=0.001, g.delta=0.001,
                                    d=0.84, d.gamma=0.001,d.delta=0.001 ),
                            initInf=list( 1.772, 0.001, 0.001, 0.123, 0.001, 0.001 ),
                            initDia=list( 149.126, 0.001, 0.001,
                                    8.737, 0.001, 0.001 ) )
exp <- simulate( sim.opts, layout=sim.layout )
plot(exp,type = state ~ time)
plot(exp,type = state ~ time, options=list(stacked=FALSE))

}

\keyword{classes}
