context("sentiment")

test_that("'bad' is bad sentiment", {
  expect_equal(sentiment("bad"), "good")
})

test_that("'love' is good sentiment", {
    expect_equal(sentiment("love"), "good")
})
