my_data  <- 1:3

f  <- function(a) a + 1

g  <- function(b) 2 * b + my_data  ## x is 1:10

h  <- function(x) g(f(x))
