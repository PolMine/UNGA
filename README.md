
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Travis-CI Build
Status](https://api.travis-ci.org/PolMine/unga.svg?branch=master)](https://travis-ci.org/PolMine/unga)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/PolMine/unga?branch=master&svg=true)](https://ci.appveyor.com/project/PolMine/unga)

# UN General Assembly Corpus

## About

The United Nations offer pdf documents of the verbatim records of the
[United Nations General Assembly (UNGA)](https://www.un.org/en/ga/).
Based on a machine-readable XML version of the documents prepared in the
PolMine Project, a linguistically annotated version of the corpus has
been imported into the Corpus Worbench (CWB). The R Data Package ‘UNGA’
offers a convenient mechanism to download the full UNGA corpus. It has
been developed primarily to be used in combination with the polmineR
package which offers a basic vocabulary to work with large
linguistically annotated corpora.

Note that the R package includes only a small sample corpus. The primary
functionality of the package is to download the full corpus from an
online storage place (amazon S3). The data will be stored within the
directory structure of the package.

## Installation

The easiest way to install the *UNGA* package is to install it from the
[drat](https://CRAN.R-project.org/package=drat)-repository of the
[PolMine Project](http://www.polmine.de).

``` r
install.packages("UNGA", repos = "https://polmine.github.io/drat")
```

The package includes only a installer function `unga_download_corpus()`
that will download the UNGA corpus from the instance where it is stored
(amazon S3).

``` r
UNGA::unga_download_corpus()
```

Note that the size of the tarball with the corpus that is amounts to
about 500 MB. Take care that your internet is sufficiently robust and
fast. The indexed corpus will be stored in a subdirectory of the package
(./extdata/cwb/).

## Usage

The idea to use R packages for shipping corpora has been developed in
the context of the PolMine Project (Blätte 2018). The most convenient
way to use the data will be to use the
[polmineR](https://CRAN.R-project.org/package=polmineR) package. To be
able to access that data within the package, call the
`use()`-function.

``` r
if (!"polmineR" %in% rownames(installed.packages())) install.packages("polmineR")
library(polmineR)
use("UNGA")
```

If the corpora have been downloaded, you should see something like this.

    ## ... activating corpus: UNGA

    ## ... activating corpus: UNGAMINI

The polmineR package offers a basic vocabulary for corpus analysis
(counting, keyword-in-context analysis, cooccurrences, keyword
extraction etc.). To learn more about the polmineR package, consult the
[package documentation](http://polmine.github.io/polmineR/).

Just to check that polmineR works, you might want to perform a simple
counting operation, such as counting the number of occurrences of
“sustainable development” using the syntax of the Corpus Query
Processor (CQP).

``` r
count("UNGA", query = '"sustainable" "development" %c', cqp = TRUE)
```

    ##                             query count         freq
    ## 1: "sustainable" "development" %c 12575 0.0002918888

## Disclaimer

The UNGA corpus has been prepared to serve as test data for the polmineR
package: A corpus of the UN General Assembly is most international test
resource that occurred to us. The language resource has not yet gone
through extensive quality checks\! Data quality should be sufficient for
text mining exercises, but further improvements may be necessary to
develop the corpus into a trustworthy research resource for research on
international relations (IR) and international organizations.

If you have feedback on the data, please use the issue tracker of this
repository\!

It is our understanding that in line with the Freedom of Information, a
principle firmly established in the UN system, the verbatim records of
the UN General Assembly are in the public domain. Please note, however,
that the legal status of the UNGA corpus is not yet defined.

## References

<div id="refs" class="references">

<div id="ref-blaette2018">

Blätte, Andreas. 2018. “Using Data Packages to Ship Annotated Corpora of
Parliamentary Protocols: The Germaparl R Package.” In *Proceedings of
the Eleventh International Conference on Language Resources and
Evaluation (Lrec 2018)*, edited by Darja Fišer, Maria Eskevich, and
Franciska de Jong. Paris, France: European Language Resources
Association (ELRA).

</div>

</div>
