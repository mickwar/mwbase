#' plot_hpd
#'
#' @description
#' Plot a univariate density with its hpd shaded
#'
#' @param x        Vector of samples to be plotted
#' @param dens     Density object of x (optional)
#' @param hpd      Vector containing end points of the hpd region, must have
#'                 an even length (optional)
#' @param col1     Color of the non-shaded portion of the plot
#' @param col2     Color of the shaded portion
#' @param multiply Logical, if true multiply col1 with col2 and set new
#'                 color to col2, otherwise don't
#' @param fade     Numeric in [0, 1], the degree of transparency to
#'                 affect col1 and col2, ranging from 0 (totally
#'                 transparent) to 1 (opaque), defaults to 1
#' @param add      Logical, should the plot be added to the current one
#' @param ...      Extra arguments to pass to plot()
#' @seealso hpd_uni, hpd_mult, col_dens, col_mult, col_fade
#' @export
#' @example examples/ex_plot_hpd.R

plot_hpd = function(x, dens, hpd, col1 = "gray50", col2 = "gray50",
    multiply = TRUE, fade = 1, add = FALSE, ...){

    if (missing(dens))
        dens = density(x)
    if (missing(hpd))
        hpd = hpd_mult(x)

    if (multiply)
        col2 = col_mult(col1, col2)
    if (fade < 1){
        col1 = col_fade(col1, fade)
        col2 = col_fade(col2, fade)
        }
    if (!add)
        plot(dens, type='n', ...)

    # Get the points from hpd that are closest to those from dens$x
    new.hpd = sapply(hpd, function(y) dens$x[which.min(abs(dens$x - y))])
    mid = c(-Inf, new.hpd, Inf)

    # Draw each group
    for (i in 1:(length(new.hpd)/2+1))
        col_dens(dens, mid[(2*i-1):(2*i)], col1, NA)
    for (i in 1:(length(new.hpd)/2))
        col_dens(dens, new.hpd[(2*i-1):(2*i)], col2, NA)
    }
