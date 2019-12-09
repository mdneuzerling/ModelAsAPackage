#' Create a directory if it doesn't exist
#'
#' All intermediate directories will be created if necessary. That is, the
#' directory will be created recursively
#'
#' @param dir_path Location of the directory to be created
#'
#' @export
#'
create_directory_if_it_doesnt_exist <- function(dir_path) {
  if (!dir.exists(dir_path)) {
    dir.create(dir_path, recursive = TRUE)
  }
}
