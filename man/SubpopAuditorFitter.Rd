% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AuditorFitters.R
\name{SubpopAuditorFitter}
\alias{SubpopAuditorFitter}
\title{Static AuditorFitter based on Subpopulations}
\value{
\code{\link{AuditorFitter}}\cr

\code{list} with items\cr
\itemize{
\item \code{corr}: pseudo-correlation between residuals and learner prediction.
\item \code{l}: the trained learner.
}
}
\description{
Used to assess multi-calibration based on a list of
binary valued columns: \code{subpops} passed during initialization.
}
\examples{
  library("data.table")
  data = data.table(
    "AGE_NA" = c(0, 0, 0, 0, 0),
    "AGE_0_10" =  c(1, 1, 0, 0, 0),
    "AGE_11_20" = c(0, 0, 1, 0, 0),
    "AGE_21_31" = c(0, 0, 0, 1, 1),
    "X1" = runif(5),
    "X2" = runif(5)
  )
  label = c(1,0,0,1,1)
  pops = list("AGE_NA", "AGE_0_10", "AGE_11_20", "AGE_21_31", function(x) {x[["X1" > 0.5]]})
  sf = SubpopAuditorFitter$new(subpops = pops)
  sf$fit(data, label - 0.5)
}
\seealso{
Other AuditorFitter: 
\code{\link{CVLearnerAuditorFitter}},
\code{\link{LearnerAuditorFitter}},
\code{\link{SubgroupAuditorFitter}}
}
\concept{AuditorFitter}
\section{Super class}{
\code{\link[mcboost:AuditorFitter]{mcboost::AuditorFitter}} -> \code{SubpopAuditorFitter}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{subpops}}{\code{\link{list}} \cr
List of subpopulation indicators.
Initialize a SubpopAuditorFitter}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{SubpopAuditorFitter$new()}}
\item \href{#method-fit}{\code{SubpopAuditorFitter$fit()}}
\item \href{#method-clone}{\code{SubpopAuditorFitter$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="mcboost" data-topic="AuditorFitter" data-id="fit_to_resid">}\href{../../mcboost/html/AuditorFitter.html#method-fit_to_resid}{\code{mcboost::AuditorFitter$fit_to_resid()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Initializes a \code{\link{SubpopAuditorFitter}} that
assesses multi-calibration within each group defined
by the \verb{subpops'. Names in }subpops` must correspond to
columns in the data.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{SubpopAuditorFitter$new(subpops)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{subpops}}{\code{\link{list}} \cr
Specifies a collection of characteristic attributes
and the values they take to define subpopulations
e.g. list(age = c('20-29','30-39','40+'), nJobs = c(0,1,2,'3+'), ,..).}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-fit"></a>}}
\if{latex}{\out{\hypertarget{method-fit}{}}}
\subsection{Method \code{fit()}}{
Fit the learner and compute correlation
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{SubpopAuditorFitter$fit(data, resid, mask)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{data}}{\code{\link{data.table}}\cr
Features.}

\item{\code{resid}}{\code{\link{numeric}}\cr
Residuals (of same length as data).}

\item{\code{mask}}{\code{\link{integer}}\cr
Mask applied to the data. Only used for \code{SubgroupAuditorFitter}.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{SubpopAuditorFitter$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
