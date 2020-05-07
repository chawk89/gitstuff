#include <Rcpp.h>

using namespace Rcpp;

// The C++ class for uniform random number generation
class Uniform {
public:
  Uniform(double min_, double max_) : min(min_), max(max_) {}
  NumericVector draw(int n) const {
    RNGScope scope;
    return runif( n, min, max );
  }
  double min, max;
};
