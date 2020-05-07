#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
RObject doF(DataFrame d, Formula formula, Function f) {
  return(f(formula, d));
}
