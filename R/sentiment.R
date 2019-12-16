#' Classify a review as good or bad
#'
#' @param x Text to be classified, ideally a one-sentence product review.
#'
#' @importFrom "stats" "predict"
#' @importFrom "randomForest" "randomForest"
#' @export
#'
sentiment <- function(x) {
  processed <- map_to_dtm(x)
  as.character(predict(ModelAsAPackage::review_rf, processed))
}
