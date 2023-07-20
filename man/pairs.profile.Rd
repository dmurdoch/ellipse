\name{pairs_profile}
\alias{pairs_profile}
\alias{pairs.profile}
\alias{ellipse-deprecated}
\alias{pairs}
\title{
Profile pairs
}
\description{
This function produces pairwise plots of profile traces, profile
sketches, and ellipse approximations to confidence intervals.
}
\usage{
pairs_profile(x, labels = c(names(x), "Profile tau"), panel = lines, invert = TRUE, 
    plot.tau = TRUE, plot.trace = TRUE, plot.sketch = TRUE, 
	plot.ellipse = FALSE, level = 0.95, \dots)
	
# Deprecated generic function.  Use graphics::pairs instead.
pairs(x, ...)
}
\arguments{
\item{x}{
An object of class \code{profile}, generally the result of the \code{profile()}
function. 
}
\item{labels}{
The labels to use for each variable.  These default to the variable
names.
}
\item{panel}{
The function to use to draw the sketch in each panel.
}
\item{invert}{
Whether to swap the axes so things look better.
}
\item{plot.tau}{
Whether to do the profile tau (profile t) plots.
}
\item{plot.trace}{
Whether to do the profile trace plots.
}
\item{plot.sketch}{
Whether to do the profile sketch plots.
}
\item{plot.ellipse}{
Whether to do the ellipse approximations.
}
\item{level}{
The nominal confidence level for the profile sketches and ellipses.
}
\item{\dots}{
Other plotting parameters.
}}
\section{Side Effects}{
Produces a plot on the current device for each pair of variables in the
profile object.
}
\details{
This function implements the plots used in Bates and Watts (1988) for
nonlinear regression diagnostics.

Prior to \pkg{ellipse} version 0.5,
the \code{pairs_profile} function was a \code{profile}
method for the \code{pairs} generic.  This caused
various conflicts, because \pkg{graphics} also exports a \code{pairs}
generic, and package \pkg{MASS} exported a \code{profile}
method for \code{graphics::pairs}.  As of \R version 4.4.0,
the \pkg{MASS} method will be in \pkg{stats} instead.

If \code{x} is a profile object then \code{pairs_profile(x)} 
will call the function from this package.  If you'd rather use
the \pkg{MASS}/\pkg{stats} method, then make sure the appropriate
package is loaded, and call \code{pairs(x)}.  (Prior to
\pkg{ellipse} 0.5, there were complicated rules to determine what
\code{pairs(x)} would do; those should still work for now, but
\code{ellipse::pairs} will disappear in a future release.)
}
\references{
Bates and Watts (1988). Nonlinear Regression Analysis and Its Applications. Wiley. \doi{10.1002/9780470316757}.
}
\seealso{
\code{\link{pairs}}, \code{\link{profile}}, \code{\link{ellipse.profile}}, \code{\link{ellipse.nls}}
}
\examples{
 # Plot everything for the Puromycin data
 data(Puromycin)
 Purboth <- nls(formula = rate ~ ((Vm + delV * (state == "treated"))
   * conc)/(K + conc), data = Puromycin,
   start = list(Vm = 160, delV = 40, K = 0.05))
 Pur.prof <- profile(Purboth)
 pairs_profile(Pur.prof, plot.ellipse = TRUE)
 
 # Show the corresponding plot from MASS/stats:
 if (getRversion() < "4.4.0") {
   loadNamespace("MASS")
 } else
   loadNamespace("stats")
   
 graphics::pairs(Pur.prof)
}
\keyword{dplot}
\keyword{regression}
\keyword{nonlinear}
