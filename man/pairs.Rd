\name{pairs}
\alias{pairs}
\alias{pairs.default}
\alias{pairs.formula}
\title{
Scatterplot Matrix
}
\description{
A matrix of scatterplots is produced.
}
\usage{
pairs(x, ...)
\method{pairs}{default}(x, ...)
\method{pairs}{formula}(formula, data = NULL, ..., subset,
      na.action = stats::na.pass)
}
\arguments{
  \item{x}{
An object containing the data to plot.
}
  \item{formula, data, subset, na.action}{See \code{\link[graphics]{pairs}}}.
  \item{\dots}{
Other arguments to pass to the methods.
}
}
\details{
The \pkg{ellipse} package defines a \code{\link{pairs.profile}} 
method for profile objects.  Unfortunately,
so does the \pkg{MASS} package.  The \code{ellipse::pairs}
generic is supplied to allow users to choose to use
the version in this package.  See the \code{\link{pairs.profile}}
help page for more details.
}
\value{
Typically no useful value is produced; this generic
function is called for the side effect of producing the 
display.
}
\seealso{
\code{\link{pairs.profile}} for the method from this package.
}
\examples{
example(pairs, "graphics")
}
