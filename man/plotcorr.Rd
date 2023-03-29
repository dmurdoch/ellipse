\name{plotcorr}
\alias{plotcorr}
\title{
Plot correlation matrix ellipses
}
\description{
This function plots a correlation matrix using ellipse-shaped glyphs for
each entry.  The ellipse represents a level curve of the density of a
bivariate normal with the matching correlation.
}
\usage{
plotcorr(corr, outline = TRUE, col = 'grey', numbers = FALSE, 
         type = c("full","lower","upper"),
	       diag = (type == "full"), bty = "n", axes = FALSE,
	       xlab = "", ylab = "", asp = 1,
	       cex.lab = par("cex.lab"), cex = 0.75*par("cex"),
	       mar = 0.1 + c(2,2,4,2), ...)
}
\arguments{
\item{corr}{
A matrix containing entries between \code{-1} and \code{1} to be plotted as
correlations.
}
\item{outline}{
Whether the ellipses should be outlined in the default colour.
}
\item{col}{
Which colour(s) to use to fill the ellipses.
}
\item{numbers}{
Whether to plot numerical correlations in place of ellipses.  If
numbers is \code{TRUE}, then the correlations will be rounded to a single decimal
place and placed on the plot.
}
\item{type}{Character. Plot \code{"full"} matrix or just \code{"upper"} or
  \code{"lower"} triangular part of it.}
\item{diag}{Logical. Plot diagonal elements or not. }
\item{bty, axes, xlab, ylab, asp, mar, cex.lab, ...}{Graphical parameters
which will be passed to \code{\link{plot}} when plotting.}
\item{cex}{Graphical parameter
which will be passed to \code{\link{text}} when plotting.}
}
\details{
The ellipses being plotted will be tangent to a unit character square,
with the shape chosen to match the required correlation.  If \code{numbers = FALSE},
the \code{col} vector will be recycled to colour each of the ellipses; if
\code{TRUE}, it will be ignored.
}
\references{
Murdoch, D.J. and Chow, E.D. (1996). A graphical display of large
correlation matrices. The American Statistician 50, 178-180. \doi{10.2307/2684435}.
}
\seealso{
\code{\link{ellipse}}
}
\author{Duncan Murdoch; Gregor Gorjanc suggested the \code{type} and \code{diag}
options.}
\examples{
save.par <- par(ask = interactive())

# Plot the correlation matrix for the mtcars data full model fit 
data(mtcars)
fit <- lm(mpg ~ ., mtcars)
plotcorr(summary(fit, correlation = TRUE)$correlation)

# Plot a second figure with numbers in place of the
# ellipses
plotcorr(summary(fit, correlation = TRUE)$correlation, numbers = TRUE)

# Colour the ellipses to emphasize the differences.  The color range
# is based on RColorBrewer's Reds and Blues (suggested by Gregor Gorjanc)

corr.mtcars <- cor(mtcars)
ord <- order(corr.mtcars[1,])
xc <- corr.mtcars[ord, ord]
colors <- c("#A50F15","#DE2D26","#FB6A4A","#FCAE91","#FEE5D9","white",
            "#EFF3FF","#BDD7E7","#6BAED6","#3182BD","#08519C")   
plotcorr(xc, col=colors[5*xc + 6])

plotcorr(xc, col=colors[5*xc + 6], type = "upper")
plotcorr(xc, col=colors[5*xc + 6], type = "lower", diag = TRUE)
par(save.par)
}
\keyword{hplot}
