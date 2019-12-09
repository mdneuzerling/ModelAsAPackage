This package exists to explore an idea I had about creating a machine learning model as an R package. The idea here is that building this vignette is equivalent to training the model, and the functions in this package allow the user to score new data with that model. We'll be creating an extremely simple sentient analysis model based on [review data from the UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Sentiment+Labelled+Sentences).

You can install this package with `devtools::install_github("mdneuzerling/ModelAsAPackage")`. The package can be loaded with `library(ModelAsAPackage)` and the training vignette with `vignette("model-training", package = "ModelAsAPackage")`.

I thought this might work because of a few things:

* Vignettes are created before source code is bundled, so in theory we can train a model before the package has finished compiling.
* R uses lazy evaluation, so if a package function refers to an object that doesn't yet exist (because it hasn't been created by the vignette) that's okay.
* I like using the same functions for model training as I do for model scoring, like the `map_to_dtm` function below.
* I wanted to take full advantage of `roxygen2` for documenting package functions, and `testthat` for unit tests. I especially like the ease with which you can test within RStudio.

However, I have my doubts:

* In order for tests to work, I have to run `devtools::build_vignettes` before running `devtools::install`. There's something here with namespaces whereby the data objects suddenly become unexported after tests are attempted. I don't know why!
* There are some relative paths in the code below. We're assuming that the working directory is `<package_root>/vignettes` when this vignette is knitted. As such, we can move up one level to obtain the root directory of the package. This should be okay if we're following the standard package structure, but I've been hurt too many times by relative file paths to feel comfortable about this.
* I'm not sure how this would operate with the `plumber` package. I don't know if we can integrate the expected `plumber.R` function in the package, except for sticking it in the `inst` directory and then finding it with `system.file`.
* This all seems like a lot of complexity for not too much benefit. Maybe doing this again would be easier now that I have a template.

No matter what, I think these sorts of projects have to be shared, even if I don't think that this is a major success!

A quick shout out for [the excellent book on R packages by Hadley Wickham](http://r-pkgs.had.co.nz/). It's well worth keeping bookmarked.
