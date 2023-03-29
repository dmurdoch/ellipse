\name{ellipse.glm}
\alias{ellipse.glm}
\title{
Outline an approximate pairwise confidence region 
}
\description{
This function produces the ellipsoidal outline of an approximate 
pairwise confidence region for a generalized linear model fit.
}
\usage{
\method{ellipse}{glm}(x, which = c(1, 2), level = 0.95, t, npoints = 100, 
        dispersion, \dots)
}
\arguments{
\item{x}{
The first argument should be a \code{glm} object, usually resulting from a call
to \code{glm()}.
}
\item{which}{
Which selects the pair of parameters to be plotted.  The default is the
first two.
}
\item{level}{
The confidence level of the region.  Default 95\%.
}
\item{t}{
The t statistic on the boundary of the ellipse.  For Binomial or Poisson
families, \code{sqrt(qchisq(level, 2))} is used; for other distributions,
\code{sqrt(2*qf(level, 2, df))} where \code{df} is the residual degrees of freedom.
}
\item{npoints}{
How many points to return in the ellipse.
}
\item{dispersion}{
The value of dispersion to use.  If specified, it is treated as fixed,
and the chi-square limits for \code{t} are used. If missing, it is 
taken from \code{summary(x)}.
}
\item{\dots}{
Other \code{ellipse.default} parameters may also be used.
}}
\value{
A matrix with columns named according to which to outline the confidence region.
}
\details{
The summary function is used to obtain the approximate covariance matrix of the
fitted parameters, the dispersion estimate, and the degrees of freedom.
}
\seealso{
\code{\link{ellipse.default}}
}
\examples{     
## Dobson (1990) Page 93: Randomized Controlled Trial :

     counts <- c(18,17,15,20,10,20,25,13,12)
     outcome <- gl(3,1,9)
     treatment <- gl(3,3)
     glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())

# Plot an approximate 95 \% confidence region for the two Outcome parameters

	plot(ellipse(glm.D93, which = c(2,3)), type = 'l')
	points(glm.D93$coefficients[2], glm.D93$coefficients[3])
}
\keyword{dplot}
\keyword{regression}

