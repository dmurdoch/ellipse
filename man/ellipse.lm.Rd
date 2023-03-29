\name{ellipse.lm}
\alias{ellipse.lm}
\title{
Outline a pairwise confidence region for a linear model fit.
}
\description{
This function produces the ellipsoidal outline of a pairwise confidence
region for a linear model fit.
}
\usage{
\method{ellipse}{lm}(x, which = c(1, 2), level = 0.95, 
    t = sqrt(2 * qf(level, 2, x$df.residual)), \dots)
}
\arguments{
\item{x}{
The first argument should be an \code{lm} object, usually resulting from a call
to \code{lm()}.
}
\item{which}{
Which selects the pair of parameters to be plotted.  The default is the
first two.
}
\item{level}{
The confidence level of the region.  Default 95\%.
}
\item{t}{
The t statistic on the boundary of the ellipse.
}
\item{\dots}{
Other \code{ellipse.default} parameters may also be used.
}}
\value{
A matrix with columns \code{x} and \code{y} to outline the confidence region.
}
\details{
The summary function is used to obtain the covariance matrix of the
fitted parameters.
}
\seealso{
\code{\link{ellipse.default}}
}
\examples{
# Plot the estimate and joint 90\% confidence region for the displacement and cylinder
# count linear coefficients in the mtcars dataset
data(mtcars)
fit <- lm(mpg ~ disp + cyl , mtcars)
plot(ellipse(fit, which = c('disp', 'cyl'), level = 0.90), type = 'l')
points(fit$coefficients['disp'], fit$coefficients['cyl'])
}
\keyword{dplot}
\keyword{regression}
