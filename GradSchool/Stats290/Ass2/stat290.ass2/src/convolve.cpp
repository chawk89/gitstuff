#include <Rcpp.h>

using namespace Rcpp;

//' Convolve two numeric vectors and return the resuting vector.
//'
//' The convolution of two vectors \eqn{a} of length \eqn{n_1} and
//' and \eqn{b} of length \eqn{n_2} is of length \eqn{n_1 + n_2 - 1}.
//'
//' @param a the first vector
//' @param b the second vector
//'
//' @return a new vector that the convolution
//' @export
//'
//' @examples
//' base::set.seed(1)
//' ourConvolve(a = rnorm(2), b = rnorm(3))
//'
// [[Rcpp::export]]
NumericVector ourConvolve(NumericVector a, NumericVector b) {
  int na = a.length(); int nb = b.length();
  int nResult = na + nb - 1;
  NumericVector result(nResult);

  for(int i = 0; i < na; i++) {
    for(int j = 0; j < nb; j++) {
      result[i + j] += a[i] * b[j];
    }
  }

  return(result);
}
