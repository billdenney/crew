
# crew

<!--[![CRAN](https://www.r-pkg.org/badges/version/crew)](https://CRAN.R-project.org/package=crew)-->

[![status](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![check](https://github.com/wlandau/crew/workflows/check/badge.svg)](https://github.com/wlandau/crew/actions?query=workflow%3Acheck)
[![codecov](https://codecov.io/gh/wlandau/crew/branch/main/graph/badge.svg?token=3T5DlLwUVl)](https://app.codecov.io/gh/wlandau/crew)
[![lint](https://github.com/wlandau/crew/workflows/lint/badge.svg)](https://github.com/wlandau/crew/actions?query=workflow%3Alint)

The [`R6`](https://r6.r-lib.org) classes of `crew` establish a
standardized user interface to high-performance computing technologies.
Unlike its closely related [`future`](https://future.futureverse.org/)
package, `crew` prioritizes centralized scheduling, heterogeneous
semi-persistent workers, and user-driven customization. The primary goal
is to help pipeline tools such as such
[`targets`](https://docs.ropensci.org/targets/) efficiently orchestrate
tasks without having to support individual low-level interfaces to
specific high-performance computing platforms or cloud services.

## Installation

``` r
remotes::install_github("wlandau/crew")
```

## Documentation

-   How to use `crew`:
    <https://wlandau.github.io/crew/articles/usage.html>
-   Design specification for developers who extend `crew`:
    <https://wlandau.github.io/crew/articles/specification.html>.

## Future development: nested crews

Large data science pipelines manage hundreds of distributed workers on
different machines, from traditional clusters to cloud platforms by
Amazon and Google. In these situations, orchestration itself is
computationally demanding. Sending jobs, receiving job output, and
detecting crashes may severely block the main process.

To overcome this bottleneck, `crew` package will eventually support
nested crews. The outer crew will support a small number of
`callr::r_bg()` workers running on the same machine as the main process.
Each of these outer workers will run a crew of its own, and the inner
crews will run hundreds of inner workers on distributed systems like AWS
Batch. The outer workers will run a different event loop that forwards
jobs from the outer crew to the inner crews and back.

## Future development: new backends

The `crew` package is arbitrarily extensible. It is designed to support
multiple backend services (e.g. Amazon, Google, Azure) with minimal
changes to the `R6` interface. For Amazon S3 storage for jobs, one can
write a new subclass of `class_store` and write methods analogous to
those of `class_store_local`. Likewise, for Amazon AWS Batch or Google
Cloud Run workers, one can write new worker subclasses analogous to
`class_worker_callr` and `class_worker_future`. All these classes are
documented in help files, and a specification of required methods and
fields is in the [specification
vignette](https://wlandau.github.io/crew/articles/specification.html).
The new subclasses will be supported in separate R packages that import
`crew`, ideally one package per cloud platform.

## Thanks

The `crew` package incorporates insightful ideas from the following
people.

-   [Kirill Müller](https://github.com/krlmlr/). The
    [`workers`](https://github.com/wlandau/worker) prototype was
    entirely his vision, and `crew` would not exist without it. `crew`
    reflects this and many other insights from Kirill about
    orchestration models for R processes.
-   [Henrik Bengtsson](https://github.com/HenrikBengtsson/). Henrik’s
    [`future`](https://github.com/HenrikBengtsson/future/) package
    ecosystem demonstrates the incredible power of a consistent R
    interface on top of a varying collection of high-performance
    computing technologies.
-   [Michael Schubert](https://github.com/mschubert/). Michael’s
    [`clustermq`](https://mschubert.github.io/clustermq/) package
    supports efficient high-performance computing on traditional
    clusters, and it demonstrates the value of a central `R6` object to
    manage an entire collection of persistent workers.
-   [David Kretch](https://github.com/davidkretch). The
    [`paws`](https://github.com/paws-r/paws) R package is a powerful
    interface to Amazon Web Services, and the documentation clearly
    communicates the capabilities and limitations of AWS to R users.
-   [Adam Banker](https://github.com/adambanker), co-authored
    [`paws`](https://github.com/paws-r/paws) with [David
    Kretch](https://github.com/davidkretch).
-   [David Neuzerling](https://github.com/mdneuzerling). David’s
    [`lambdr`](https://github.com/mdneuzerling/lambdr/) package
    establishes a helpful pattern to submit and collect AWS Lambda jobs
    from R.
-   [Mark Edmondson](https://github.com/MarkEdmondson1234/). Mark
    maintains several R packages to interface with Google Cloud Platform
    such as
    [`googleCloudStorageR`](https://github.com/cloudyr/googleCloudStorageR)
    and
    [`googleCloudRunner`](https://github.com/MarkEdmondson1234/googleCloudRunner),
    and he [started the
    conversation](https://github.com/ropensci/targets/issues/720) around
    helping [`targets`](https://github.com/ropensci/targets) submit jobs
    to Google Cloud Run.

## Code of Conduct

Please note that the `crew` project is released with a [Contributor Code
of
Conduct](https://github.com/wlandau/crew/blob/main/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.

## Citation

``` r
citation("crew")
#> 
#> To cite package 'crew' in publications use:
#> 
#>   William Michael Landau (NA). crew: Centralized Reusable Workers.
#>   https://wlandau.github.io/crew/, https://github.com/wlandau/crew.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {crew: Centralized Reusable Workers},
#>     author = {William Michael Landau},
#>     note = {https://wlandau.github.io/crew/, https://github.com/wlandau/crew},
#>   }
```
