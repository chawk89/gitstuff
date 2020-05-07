context("Addition tests")

test_that("add works as expected", {
    expect_equal(add(1, 2), 3)
    expect_identical(add(1:10, 1:10), 2 * (1:10))
})
