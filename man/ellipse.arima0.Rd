\name{ellipse.arima0}
\alias{ellipse.arima0}
\title{
Outline an approximate pairwise confidence region 
}
\description{
This function produces the ellipsoidal outline of an approximate 
pairwise confidence region for an ARIMA model fit.
}
\usage{
\method{ellipse}{arima0}(x, which = c(1, 2), level = 0.95, t = sqrt(qchisq(level, 2)), \dots)
}
\arguments{
\item{x}{
The first argument should be an \code{arima0} object, usually resulting from a call
to \code{arima0()}.
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
The \code{summary} function is used to obtain the approximate covariance matrix of the
fitted parameters.
}
\seealso{
\code{\link{ellipse}}
}
\examples{
data(USAccDeaths)
fit <- arima0(USAccDeaths, order = c(0, 1, 1), seasonal = list(order = c(0, 1, 1)))
# Plot the approximate 95\% confidence region for the first two parameters
# of the model
plot(ellipse(fit), type = 'l')
points(fit$coef[1], fit$coef[2])
}
\keyword{dplot}
\keyword{ts}

