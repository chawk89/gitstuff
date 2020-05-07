#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector rcppConv2(NumericVector xa, NumericVector xb) {
  int na = xa.size();
  int nb = xb.size();
  NumericVector xab(na + nb - 1);

  for (int i = 0; i < na; i++)
    for (int j = 0; j < nb; j++)
      xab[i + j] += xa[i] * xb[j];

  return xab;
}
