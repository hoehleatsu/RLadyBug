\name{hksars}
\alias{hksars}
\alias{hksars.opts.ml}
\docType{data}
\title{ Hong Kong SARS outbreak 2003 }
\description{
  Severe Acute Respiratory Syndrome (SARS) data from the 2003 outbreak
  in Hong Kong.
  Data contain the daily reported number of cases among health care
  and others as given in Figure 2 of Anonymous (2003).
  A susceptible population of 6.7 mio is assumed.

}
\usage{data("hksars")}
\details{
  A constant incubation time of 6.4 days and a constant recovery time of
  34 days as in Donnelly et al. (2003) is assumed. Figure 2 in Anonymous
  (2003) provides the exposure time. A homogenous population is assumed.
}
\source{
Anonymous (2003). Sars bulletin. Technical report, Health, Welfare and
Food Bureau, Government of the Hong Kong Special Administrative
Region, 10 June 2003.  Available as
\url{http://www.info.gov.hk/info/sars/bulletin/bulletin0610e.pdf}

Donelly, C. A., Ghani, A. C., Leung, G. M., and 16 more authors
(2003).  Epidemiological determinants of spread of causal agent of
severe acute respiratory syndrome in Hong Kong. The Lancet, 361:1761
}

\examples{
data("hksars")

\dontrun{
#Show how to plot using EpiTools
require("epitools")
require("chron")

E <- chron("2/15/2003") + hksars@data$E
curve <- epicurve.dates(E,axisnames = FALSE,before=0, after=0,legend.text = TRUE,col = colorbrewer.palette(3, "seq", "r")[3:1],ylab="No. cases")
axis(1, at = curve$xvals, labels = curve$cmday, tick = FALSE, line = 0)
axis(1, at = curve$xvals, labels = curve$cmonth, tick = FALSE, line = 1)
}
}
\keyword{datasets}
