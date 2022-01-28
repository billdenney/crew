
# crew

<!--[![CRAN](https://www.r-pkg.org/badges/version/crew)](https://CRAN.R-project.org/package=crew)-->

[![status](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![check](https://github.com/ropensci/crew/workflows/check/badge.svg)](https://github.com/ropensci/crew/actions?query=workflow%3Acheck)
[![codecov](https://codecov.io/gh/ropensci/crew/branch/main/graph/badge.svg?token=3T5DlLwUVl)](https://app.codecov.io/gh/ropensci/crew)
[![lint](https://github.com/ropensci/crew/workflows/lint/badge.svg)](https://github.com/ropensci/crew/actions?query=workflow%3Alint)

The user interface in `crew` is an abstraction for high-performance
computing technologies. Like the `future` R package, `crew` provides
a backend-agnostic standard. But unlike `future`, `crew` prioritizes
centralized scheduling, semi-persistent workers, and user-driven
customization. The user supplies methods to initialize, dispatch, poll,
and terminate a worker on a specific backend technology. The backend
technology could be forked processes, an on-premises high-performance
computing cluster, a cloud computing service, or even another worker
abstraction like `future`. Then, `crew` supplies an `R6` subclass to
create objects that manage the actual workers. Every worker group has a
centralized mutable cache and a centralized registry of all the workers
in the group, both of which are available to the user-defined worker
methods. This facilitates advanced capabilities such as worker
affinities and batched polling. The end goal is to help pipeline tools
such as such `targets` efficiently orchestrate tasks without having to
support individual low-level interfaces to specific high-performance
computing platforms or cloud computing services.

## Installation

``` r
remotes::install_github("ropensci/crew")
```

## Code of Conduct

Please note that the `crew` project is released with a [Contributor
Code of
Conduct](https://github.com/wlandau/crew/blob/main/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.

## Citation

``` r
citation("crew")
#> 
#> To cite package 'crew' in publications use:
#> 
#>   William Michael Landau (NA). crew: Centralized Interface For
#>   Semi-Persistent High-Performance Computing Workers.
#>   https://wlandau.github.io/crew/,
#>   https://github.com/wlandau/crew.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {crew: Centralized Interface For Semi-Persistent
#> High-Performance Computing Workers},
#>     author = {William Michael Landau},
#>     note = {https://wlandau.github.io/crew/, https://github.com/wlandau/crew},
#>   }
```
