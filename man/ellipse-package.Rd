\name{ellipse-package}
\alias{ellipse-package}
\docType{package}
\title{
Functions for drawing ellipses and ellipse-like confidence
regions
}
\description{
This package contains various routines for drawing
ellipses and ellipse-like confidence regions, implementing the
plots described in Murdoch and Chow (1996).

There are also routines implementing
the profile plots described in Bates and Watts (1988).
}
\details{
There are three groups of routines in the ellipse package.  The first
consists of those involved with \code{\link{plotcorr}}, which implements the plots
described in Murdoch and Chow (1996). These display correlations using
ellipses, whose shape is that of the contours of a bivariate normal
distribution with matching correlation.
    
The second group implements a version of the profile plots described in
Bates and Watts (1988); see \code{\link{ellipse.profile}} and \code{\link{pairs.profile}}.

The last group provide the basis for the others, drawing ellipses based on
various S objects, including scalar correlations, covariance matrices
\code{\link{arima}}, \code{\link{lm}}, and \code{\link{nls}} fits:  see \code{\link{ellipse}}.

}
\author{
Duncan Murdoch and E. D. Chow (porting
to R by Jesus M. Frias Celayeta.)

Maintainer: Duncan Murdoch <murdoch.duncan@gmail.com>
}
\references{
Bates and Watts (1988) Nonlinear Regression Analysis and Its Applications. Wiley. \doi{10.1002/9780470316757}.

Murdoch, D.J. and Chow, E.D. (1996). A graphical
display of large correlation matrices. The American
Statistician 50, 178-180. \doi{10.2307/2684435}.
}
\keyword{ package }
\keyword{ dplot }
