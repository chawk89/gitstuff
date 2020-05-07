#' Stat 290 Simple Test Package
#'
#' `stat290.ass2` is a simple ("hello world") package for
#' stat290.
#'
#' The package provides two functions:
#' * [`plotTzByOS`][plotTzByOS()] which uses [`ggplot2::ggplot()`] to produce a plot object
#' * [`ourConvolve`][ourConvolve()] which uses the `Rcpp` package to link R code to a C routine.
#'
#' The source code of the package further demonstrates:
#'
#' * [R markdown](https://rmarkdown.rstudio.com/) syntax in documenting functions, including references to functions and data within the same package and from other packages using the [`roxygen2` package](https://cran.r-project.org/package=roxygen2/vignettes/rd-formatting.html)
#' * Including a data set [`bitly`] as part of the package
#' * Importing functions from other packages using `importFrom` directives
#' * Use of [utils::globalVariables()] to get around warnings produced when checking the package, something that happens a lot when using [ggplot2::ggplot()], for instance.
#'
#' @seealso [ourConvolve][ourConvolve()]
#' @seealso [plotTzByOS][plotTzByOS()]
#' @useDynLib stat290.ass2
#' @importFrom Rcpp sourceCpp
#' @importFrom utils globalVariables
#' @docType package
#' @name stat290.ass2
NULL

utils::globalVariables(names = c("os",
                                 "Nonwindows",
                                 "Windows",
                                 "value",
                                 "agent",
                                 "count",
                                 "tz"))

