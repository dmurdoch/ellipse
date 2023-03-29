\name{ellipse.nls}
\alias{ellipse.nls}
\title{
Outline an approximate pairwise confidence region 
}
\description{
This function produces the ellipsoidal outline of an approximate 
pairwise confidence region for a nonlinear model fit.
}
\usage{
\method{ellipse}{nls}(x, which = c(1, 2), level = 0.95, 
    t = sqrt(2 * qf(level, 2, s$df[2])), \dots)
}
\arguments{
\item{x}{
The first argument should be an \code{nls} object, usually resulting from a call
to \code{nls()}.
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
The summary function is used to obtain the approximate covariance matrix of the
fitted parameters.
}
\seealso{
\code{\link{ellipse.default}}, \code{\link{ellipse.profile}}
}
\examples{
# Plot an approximate 95\% confidence region for the weight and displacement
# parameters in the Michaelis Menten model
data(Puromycin)
fit <- nls(rate ~ Vm*conc/(K + conc), data = Puromycin, subset = state=="treated", 
    start = list(K = 0.05, Vm = 200))
plot(ellipse(fit,which=c('Vm','K')), type = 'l')
params <- fit$m$getPars()
points(params['Vm'],params['K'])
}
\keyword{dplot}
\keyword{nonlinear}

