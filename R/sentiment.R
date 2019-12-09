#' Classify a review as good or bad
#'
#' @param x Text to be classified, ideally a one-sentence product review.
#'
#' @import randomForest
#' @export
#'
sentiment <- function(x) {
  processed <- map_to_dtm(x)
  as.character(predict(review_rf, processed))
}
