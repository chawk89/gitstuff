#include "RcppUniform.h"

using namespace Rcpp;

// [[Rcpp::export]]
XPtr<Uniform> Unew(SEXP min, SEXP max) {

  // convert inputs to appropriate C++ types
    double min_ = as<double>(min), max_ = as<double>(max);

    // create a pointer to an Uniform object and wrap it
    // as an external pointer
    XPtr<Uniform> ptr( new Uniform( min_, max_ ), true );

    // return the external pointer to the R side
    return ptr;
}

// [[Rcpp::export]]
NumericVector Udraw( SEXP xp, SEXP n) {
    // grab the object as a XPtr (smart pointer) to Uniform
    XPtr<Uniform> ptr(xp);

    // convert the parameter to int
    int n_ = as<int>(n);

    // invoke the function
    NumericVector res = ptr->draw( n_ );

    // return the result to R
    return res;
}
