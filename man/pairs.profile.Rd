\name{pairs.profile}
\alias{pairs.profile}
\title{
Profile pairs
}
\description{
This function produces pairwise plots of profile traces, profile
sketches, and ellipse approximations to confidence intervals.
}
\usage{
\method{pairs}{profile}(x, labels = c(names(x), "Profile tau"), panel = lines, invert = TRUE, 
    plot.tau = TRUE, plot.trace = TRUE, plot.sketch = TRUE, 
	plot.ellipse = FALSE, level = 0.95, \dots)
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

Unfortunately, the \pkg{MASS} package also defines a
\code{\link[MASS:plot.profile]{pairs.profile}} method.  The \code{ellipse::\link{pairs}}
generic is supplied to allow users to choose to use
the version in this package. 

If \code{x} is a profile object, then \code{ellipse::pairs(x)} 
is guaranteed to call the method from this package.  If you'd rather use
the \pkg{MASS} method, then two steps are needed:  you need to
be sure that \pkg{MASS} is loaded, then call \code{graphics::pairs(x)}. 
(If \pkg{MASS} is not loaded, you'll get the default method from the \pkg{graphics} package, which will
trigger an error since it doesn't know about profile
objects.)  

If both \pkg{ellipse} and \pkg{MASS} are loaded, then \code{pairs(x)} 
is slightly ambiguous:  the method that is called depends
on the ordering of \pkg{ellipse} and \pkg{graphics} (not \pkg{MASS}!) in the search list.  In almost all cases
\pkg{ellipse} will precede \pkg{graphics}, so the \pkg{ellipse} method will usually be the default.


If \code{x} is any object
other than a profile object, \code{ellipse::pairs(x)}
will pass the call on to \code{graphics::pairs(x)},
and the standard method will be called.
}
\references{
Bates and Watts (1988). Nonlinear Regression Analysis and Its Applications. Wiley. \doi{10.1002/9780470316757}.
}
\seealso{
\code{\link{profile}}, \code{\link{ellipse.profile}}, \code{\link{ellipse.nls}}
}
\examples{
 # Plot everything for the Puromycin data
 data(Puromycin)
 Purboth <- nls(formula = rate ~ ((Vm + delV * (state == "treated"))
   * conc)/(K + conc), data = Puromycin,
   start = list(Vm = 160, delV = 40, K = 0.05))
 Pur.prof <- profile(Purboth)
 ellipse::pairs(Pur.prof, plot.ellipse = TRUE)
 
 # Show the corresponding plot from MASS:
 if (requireNamespace("MASS"))
   graphics::pairs(Pur.prof)
}
\keyword{dplot}
\keyword{regression}
\keyword{nonlinear}
