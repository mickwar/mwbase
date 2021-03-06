% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_phantom.R
\name{make_phantom}
\alias{make_phantom}
\title{make_phantom}
\usage{
make_phantom(text, display, colors, sep = "", ...)
}
\arguments{
\item{text}{a vector of characters, each part that is desired to
be either invisible or a different color should be
in a separate element}

\item{display}{numeric vector containing the index of which elements
in text should be displayed, defaults to displaying all}

\item{colors}{either a single color or a vector of colors having length
equal to the length of text so the colors match with
the elements of text, defaults to black}

\item{sep}{a character string that separates the components in
text, defaults to "" which is no separation}

\item{...}{additional arguments used in title()}
}
\description{
Adapted from Matt Heiner

Takes a character vector and can hide some components in that vector
when making a title. Also allows different colors to be in the text.
}
\examples{
set.seed(1)
x = rnorm(20)
y = rnorm(20)

# Figure 1
plot(x, type="l", col = "red", lwd = 2)
lines(y, col = "blue", lwd = 2)
make_phantom(text = c("Red", "Blue"), display = 1:2, colors = c("red", "blue"), sep = "  ")

# Figure 2
par(mfrow = c(1, 2))
plot(x, type="l", col = "red", lwd = 2)
make_phantom(text = c("Red", "Blue"), display = 1, colors = c("red", "blue"), sep = "  ")

plot(y, type="l", col = "blue", lwd = 2)
make_phantom(text = c("Red", "Blue"), display = 2, colors = c("red", "blue"), sep = "  ")
par(mfrow = c(1, 1))
# Notice the position of the text in the two titles compared with that of Figure 1
}
