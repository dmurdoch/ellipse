\name{ellipse.profile.glm}
\alias{ellipse.profile.glm}
\title{
Pairwise profile sketch	for GLM profiles
}
\description{
This routine approximates a pairwise confidence region for a glm
model.
}
\usage{
\method{ellipse}{profile.glm}(x, which = c(1, 2), level = 0.95, t, 
    npoints = 100, dispersion, \dots)
}
\arguments{
\item{x}{
An object of class \code{\link[MASS]{profile.glm}}.
}
\item{which}{
Which pair of parameters to use.
}
\item{level}{
The \code{level} argument
specifies the confidence level for an asymptotic confidence region.
}
\item{t}{
The square root of the value to be contoured.  By default, this is \code{qchisq(level, 2)}
for models with fixed dispersion (i.e. binomial and Poisson), and \code{2 * qf(level, 2, df)} for other models,
where \code{df} is the residual degrees of freedom.
}
\item{npoints}{
How many points to use in the ellipse.
}
\item{dispersion}{
If specified, fixed dispersion is assumed, otherwise the dispersion is taken from the model.
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
\code{\link{profile}}, \code{\link{glm}}, \code{\link{ellipse.glm}}
}
\examples{
## MASS has a pairs.profile function that conflicts with ours, so
## do a little trickery here
	 noMASS <- is.na(match('package:MASS', search()))
	 if (noMASS) require(MASS)

## Dobson (1990) Page 93: Randomized Controlled Trial :

     counts <- c(18,17,15,20,10,20,25,13,12)
     outcome <- gl(3,1,9)
     treatment <- gl(3,3)
     glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())

##  Plot an approximate 95\% confidence region for the two outcome variables
     prof.D93 <- profile(glm.D93)
     plot(ellipse(prof.D93, which = 2:3), type = 'l')
     lines(ellipse(glm.D93, which = 2:3), lty = 2)
     params <- glm.D93$coefficients
     points(params[2],params[3])
     
##  Clean up our trickery
	 if (noMASS) detach('package:MASS')
	 
}
\keyword{dplot}
\keyword{models}
