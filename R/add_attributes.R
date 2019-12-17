#' Add word stems as a positional attribute to UNGA
#' 
#' \code{unga_add_p_attribute_stem} will add word stems as a positional attribute
#' @param verbose Logical, whether to output messages.
#' @export unga_add_p_attribute_stem
#' @rdname add_attributes
#' @importFrom cwbtools p_attribute_encode
#' @importFrom polmineR as.nativeEnc registry_get_encoding
unga_add_p_attribute_stem <- function (verbose = TRUE){
  if (requireNamespace("SnowballC", quietly = TRUE)) {
    
    if (verbose) message("... decoding token stream for p-attribute 'word'")
    words <- polmineR::get_token_stream("UNGA", p_attribute = "word")
    
    if (verbose)  message("... adjusting encoding")
    words <- as.nativeEnc(words, from = registry_get_encoding("UNGA"))
    
    if (verbose) message("... stemming")
    stems <- SnowballC::wordStem(words, language = "english")
    rm(words)
    gc()
    
    if (verbose) message("... writing new p-attribute")
    unga_regdir = system.file(package = "UNGA", "extdata", "cwb", "registry")
    unga_regdata <- cwbtools::registry_file_parse(
      corpus = "UNGA", 
      registry_dir = unga_regdir
    )
    unga_charset <- unga_regdata[["properties"]][["charset"]]
    unga_data_dir <- unga_regdata[["home"]]
    cwbtools::p_attribute_encode(
      token_stream = stems, p_attribute = "word", 
      registry_dir = unga_regdir, corpus = "UNGA", 
      data_dir = unga_data_dir, method = "CWB", verbose = TRUE, 
      encoding = unga_charset, compress = TRUE
    )
    return(invisible(NULL))
  }
  else {
    stop("package 'SnowballC' required but not available")
  }
}
