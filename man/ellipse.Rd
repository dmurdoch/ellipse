\name{ellipse}
\alias{ellipse}
\alias{ellipse.default}
\title{
Make an ellipse
}
\description{
A generic function returning an ellipse or other outline of a confidence region
for two parameters.  
}
\usage{
ellipse(x, \dots)
\method{ellipse}{default}(x, scale = c(1, 1), centre = c(0, 0), level = 0.95,
    t = sqrt(qchisq(level, 2)), which = c(1, 2), npoints = 100, center = centre,
    \dots)
}
\arguments{
\item{x}{
An object. In the default method the parameter \code{x} should be a correlation between -1 and 1 or a
square positive definite matrix at least 2x2
in size. It will be treated as the correlation or covariance 
of a multivariate normal distribution.
}
\item{\dots}{
Descendant methods may require additional parameters.
}
\item{scale}{
If \code{x} is a correlation matrix, then the standard deviations of each
parameter can be given in the scale parameter.  This defaults to \code{c(1, 1)},
so no rescaling will be done.
}
\item{centre}{
The centre of the ellipse will be at this position.
}
\item{level}{
The confidence level of a pairwise confidence region.  The default is
0.95, for a 95\% region.  This is used to control the size of the ellipse
being plotted.  A vector of levels may be used.
}
\item{t}{
The size of the ellipse may also be controlled by specifying the value
of a t-statistic on its boundary.  This defaults to the appropriate
value for the confidence region.
}
\item{which}{
This parameter selects which pair of variables from the matrix will be
plotted.  The default is the first 2.
}
\item{npoints}{
The number of points used in the ellipse.  Default is 100.
}

\item{center}{
An alternative to \code{centre} to accommodate US spelling.
}

}
\value{
An \code{npoints} x \code{2} matrix is returned with columns named according to the
row names of the matrix \code{x} (default \code{'x'} and \code{'y'}), suitable
for plotting.
}
\details{
The default method uses the 
\code{(cos(theta + d/2), cos(theta - d/2))} parametrization of an ellipse, where 
\code{cos(d)} is the correlation of the parameters.
}
\seealso{
\code{\link{ellipse.lm}}, \code{\link{ellipse.nls}}, 
\code{\link{ellipse.profile}}, \code{\link{ellipse.profile.nls}},
\code{\link{ellipse.arima0}},
\code{\link{plotcorr}}
}
\references{
Murdoch, D.J. and Chow, E.D. (1996). A graphical display of large 
correlation matrices. The American Statistician 50, 178-180. \doi{10.2307/2684435}.
}
\examples{
# Plot an ellipse corresponding to a 95\% probability region for a
# bivariate normal distribution with mean 0, unit variances and 
# correlation 0.8.
plot(ellipse(0.8), type = 'l')
}
\keyword{dplot}
