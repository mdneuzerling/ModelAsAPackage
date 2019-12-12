#' Download and uncompress a zipped data file
#'
#' Given the URL of a .zip file, this function will download it and decompress
#' it to a given location.
#'
#' This function was intended to download and uncompress the data located at
#' https://archive.ics.uci.edu/ml/datasets/Sentiment+Labelled+Sentences
#' It is not a general function to download arbitrary data, but may be a
#' useful template.
#'
#' @param url character. A URL of the location of the data
#' @param save_location character. The contents of the downloaded zip file will
#' be uncompressed and saved here. If save_location does not exist, it will be
#' created, as well as any missing parent directories.
#'
#' importFrom("utils", "download.file", "unzip")
#' @export
#'
download_data <- function(url, save_location = getwd()) {
  zip_file <- tempfile()
  on.exit(unlink(zip_file))
  download.file(url, zip_file)

  create_directory_if_it_doesnt_exist(save_location)

  unzip(zip_file, exdir = save_location)
}
