#' Download and load supplementary data from web directory.
#' 
#' \code{unga_download_lda_model} will download a lda topic model
#' from a directory (web dir) and store it in the UNGA package.
#' \code{unga_download_global_vectors} will download a global vectors model
#' from a directory (web dir) and store it in the UNGA package.
#' @param model Name of the model.
#' @param webdir (web) directory where the data file resides
#' @param verbose A \code{logical} value, whether to output status messages.
#' @export unga_download_lda_model
#' @export unga_download_global_vectors
#' @rdname supplementary_data
#' @importFrom utils download.file
unga_download_lda_model <- function(
  model = "lda_UNGA_2019-01-23_180_2019-09-24.rds",
  webdir = "https://polmine.s3.eu-central-1.amazonaws.com/corpora/cwb/unga", 
  verbose = TRUE
){
  
  extdata_dir <- system.file(package = "UNGA", "extdata")
  model_dir <- file.path(extdata_dir, "topicmodels")
  if (!dir.exists(model_dir)) dir.create(model_dir)
  
  if (length(model) == 1L) {
    tarball <- file.path(webdir, model)
    message("... downloading supplementary data: ", basename(tarball))
    
    if (.Platform$OS.type == "windows") {
      prefix <- gsub("^(https://|http://).*?$", "\\1", tarball)
      tarball <- gsub("^(https://|http://)(.*?)$", "\\2", tarball)
      download.file(
        url = sprintf("%s%s", prefix, tarball),
        destfile = paste0(model_dir, "/", model)
      )
    } else {
      curl::curl_download(
        url = tarball,
        destfile = paste0(model_dir, "/", model), 
        handle = curl::handle_setopt(curl::new_handle()),
        quiet = !verbose
      )
    }
  } else {
    for (x in model) unga_download_lda_model(model = x, webdir = webdir)
  }
}


#' @rdname supplementary_data
unga_download_global_vectors <- function(
  model = NULL,
  webdir = "https://polmine.sowi.uni-due.de/corpora/cwb/unga/supplementary_data/global_vectors", 
  verbose = TRUE
){
  
  model_dir <- system.file(package = "UNGA", "extdata", "global_vectors")
  if (!dir.exists(model_dir)) dir.create(model_dir)
  
  if (length(file) == 1) {
    tarball <- file.path(webdir, model)
    message("... downloading supplementary data: ", basename(tarball))
    
    if (.Platform$OS.type == "windows") {
      prefix <- gsub("^(https://|http://).*?$", "\\1", tarball)
      tarball <- gsub("^(https://|http://)(.*?)$", "\\2", tarball)
      download.file(
        url = sprintf("%s%s", prefix, tarball),
        destfile = paste0(file.path(model_dir), "/", model)
      )
    } else {
      curl::curl_download(
        url = tarball,
        destfile = paste0(file.path(model_dir), "/", model), 
        handle = curl::handle_setopt(curl::new_handle()),
        quiet = !verbose
      )
    }
  } else {
    for (x in file) unga_download_global_vectors(model = x, webdir = webdir)
  }
}