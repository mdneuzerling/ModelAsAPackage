context("map-to-dtm")

# We're using "movie", "film" and phone" as our test words because these are
# the most populous in the training data, and so are likely to be a part of the
# pruned vocabulary that defines the columns of the document term matrix.
# Note that "movie" stems to "movi".

dtm_unweighted <- as.matrix(map_to_dtm(c("movie", "phone"), tfidf = NULL))
dtm_weighted <- as.matrix(map_to_dtm(c("movie", "phone")))

test_that("DTM has common words that aren't stop words", {
  expect_true("movi" %in% colnames(dtm_unweighted))
  expect_true("phone" %in% colnames(dtm_unweighted))
  expect_true("film" %in% colnames(dtm_unweighted))
})

test_that("DTM doesn't contain common stop words", {
  expect_false("the" %in% colnames(dtm_unweighted))
  expect_false("a" %in% colnames(dtm_unweighted))
})

test_that("DTM correctly represents present and absent words", {
  expect_equal(dtm_unweighted[1, "movi"], 1)
  expect_equal(dtm_unweighted[2, "phone"], 1)
  expect_equal(dtm_unweighted[1, "film"], 0)
  expect_equal(dtm_unweighted[2, "film"], 0)
})

test_that("DTM is applying weightings", {
  expect_true(dtm_unweighted[1, "movi"] > 0)
  expect_false(is.integer(dtm_unweighted[1, "movi"]))
  expect_true(dtm_unweighted[2, "phone"] > 0)
  expect_false(is.integer(dtm_unweighted[2, "phone"]))
})
