% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Uniform.R
\docType{class}
\name{Uniform}
\alias{Uniform}
\title{A C++ Uniform class exposed via R6}
\description{
\code{Uniform} objects can be instantiated and drawn from.
}
\section{Methods}{

\describe{
  \item{\code{Uniform$new(min = 0.0, max = 1.0)}}{Create a new Uniform class}
  \item{\code{Uniform$draw(n = 1)}}{Draw n observations from the class}
}
}

\examples{
u <- Uniform$new()
u$draw(3)
u2 <- Uniform$new(1.0, 5.0)
u2$draw(5)
Create a Uniform instance
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Uniform$new()}}
\item \href{#method-draw}{\code{Uniform$draw()}}
\item \href{#method-clone}{\code{Uniform$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Uniform$new(min = 0, max = 1)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{min}}{the minimum value}

\item{\code{max}}{the maximum value
Draw n observations from uniform}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-draw"></a>}}
\subsection{Method \code{draw()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Uniform$draw(n = 1)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{n}}{the number of observations}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
a vector of n observations
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Uniform$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
