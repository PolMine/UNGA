#' Download the UNGA corpus from web directory.
#' 
#' \code{unga_download_corpus} will get a tarball with the indexed corpus
#' from a directory (web dir) and install the corpus into the UNGA package.
#' @param corpus Name of the corpus to download (\code{character} vector), defaults to "UNGA".
#' @param webdir The (web) directory where the tarball resides.
#' @param archive A \code{logical}; whether an older version of the corpus from the archive should be installed instead.
#' @param version If \code{archive} is \code{TRUE}, a corpus version must be specified.
#' @export unga_download_corpus
#' @rdname install_unga
#' @importFrom cwbtools corpus_install
#' @importFrom RCurl url.exists
unga_download_corpus <- function(corpus = "UNGA", webdir = "https://polmine.s3.eu-central-1.amazonaws.com/corpora/cwb/unga", archive = FALSE, version = NULL) {
  if (archive) {
    webdir <- "https://polmine.sowi.uni-due.de/corpora/cwb/unga/archive"
    if (is.null(version)) stop("... if archive is TRUE, then corpus version must be specified!")
    tarball <- file.path(webdir, sprintf("%s_%s.tar.gz", tolower(corpus), version))
  } else {
    tarball <- file.path(webdir, sprintf("%s.tar.gz", tolower(corpus)))
  }
  
  message("... downloading tarball: ", tarball)
  cwbtools::corpus_install(pkg = "UNGA", tarball = tarball)
}