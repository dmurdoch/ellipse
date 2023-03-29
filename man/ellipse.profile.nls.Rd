\name{ellipse.profile.nls}
\alias{ellipse.profile.nls}
\title{
Pairwise profile sketch
}
\description{
This routine approximates a pairwise confidence region for a nonlinear regression
model.
}
\usage{
\method{ellipse}{profile.nls}(x, which = c(1, 2), level = 0.95, 
          t = sqrt(2 * qf(level, 2, attr(x, "summary")$df[2])), 
          npoints = 100, \dots)
}
\arguments{
\item{x}{
An object of class \code{\link{profile.nls}}.
}
\item{which}{
Which pair of parameters to use.
}
\item{level}{
The \code{level} argument
specifies the confidence level for an asymptotic confidence region.
}
\item{t}{
The square root of the value to be contoured.
}
\item{npoints}{
How many points to use in the ellipse.
}
\item{\dots}{
Extra parameters which are not used (for compatibility with the generic).
}
}
\value{
An \code{npoints} x \code{2} matrix with columns having the chosen parameter names, 
which approximates a contour of the function that was profiled.
}
\details{
This function uses the 4 point approximation to the contour as described
in Appendix 6 of Bates and Watts (1988).  It produces the exact contour for
quadratic surfaces, and good approximations for mild deviations from
quadratic.  If the surface is multimodal, the algorithm is likely to
produce nonsense.
}
\references{
Bates and Watts (1988). Nonlinear Regression Analysis and Its Applications. Wiley. \doi{10.1002/9780470316757}.
}
\seealso{
\code{\link{profile}}, \code{\link{ellipse.nls}}
}
\examples{
# Plot an approximate 95\% confidence region for the Puromycin
# parameters Vm and K, and overlay the ellipsoidal region
data(Puromycin)
Purboth <- nls(formula = rate ~ ((Vm + delV * (state == "treated"))
  * conc)/(K + conc), data = Puromycin,
  start = list(Vm = 160, delV = 40, K = 0.05))
Pur.prof <- profile(Purboth)
plot(ellipse(Pur.prof, which = c('Vm', 'K')), type = 'l')
lines(ellipse(Purboth, which = c('Vm', 'K')), lty = 2)
params <- Purboth$m$getPars()
points(params['Vm'],params['K'])
}
\keyword{dplot}
\keyword{models}
