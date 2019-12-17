UNGA 0.2.0
==========

- Removed files 'configure' and 'configure.win' and the directory 'tools'
  from the top level of the package - not needed any more as a result of 
  polmineR's usage of a temporary registry directory.
- Added site generated using `pkgdown::build_site()`. 
- Added continuous integration (Travis CI, appveyor).


UNGA 0.1.2
==========

- To circumvent a R CMD check warning for hidden files, hidden files named '.dummy' were removed from the package. These files were there to ensure that the global_vectors and the topicmodels directory would be there. These dirs are not created when needed in slightly modified functions `unga_download_lda_model` and `unga_download_global_vectors.
- The license was changed to CC BY-NC-SA 4.0 (previously CLARIN ACA+BY+NC+SA) to have a standard license that is known by R CMD check.
- Added package 'SnowballC' to DESCRIPTION (used if present by `unga_add_p_attribute_stem`).
- Explicit import of functions from polmineR and utils.
- Adjustment of documented arguments so that R CMD check does not throw any warnings.
- Changed webdirs to amazon S3 where corpus and topicmodel are deposited now.

UNGA 0.0.4
==========

- new corpus version (build date 2019-01-23) with linguistic annotation (POS, lemma, ner) added
- added date information for protocols which were missing date
- moved tar file to password protected university web server
- renamed UNGA_workflow.Rmd as UNGA_pdf_tei.Rmd
- removed raw data from the data_raw directory
- added `unga_add_p_attribute_stem` function for test purposes
- added `unga_download_lda_models` function
- the following models can be downloaded:
- "word" (the standard lda topic model with removed stopwords, modelled with a k of 250, a burnin of 1000 and 1003 iterations all in all)
- "word_more_iter" (lda topic model with removed stopwords, modelled with a k of 250, a burnin of 4000 and 6000 iterations all in all)
- "word_no_stopwords" (lda topic model without stopword removal, modelled with a k of 250, a burnin of 1000 and 1003 all in all)
- "word_shorter_iterandburnin" (lda topic model with removed stopwords, modelled with a k of 250, a burnin of 100 and 300 iterations all in all)


UNGA 0.0.3
==========
- sample corpus created, as described in UNGA_sample_corpus.R
- files configure and configure.win added
- file tools/setpaths.R added
- function unga_download_corpus added

UNGA 0.0.2
==========

- selected meeting records which could be used as an actual data package (Session 49 onwards)
- replaced 'Beschreibung_UNGAWorkflow.Rmd' with a nearly working Rmd

UNGA 0.0.1
==========

- moved 'Beschreibung_UNGAWorkflow.Rmd' into data-raw
- moved folders pdf/txt/xml into data-raw
- add .Rbuildignore to ignore folder 'data-raw'

