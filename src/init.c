#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

// Declare the function you want to export
SEXP pikchr_c(SEXP code, SEXP class);

// Define the call method table
static const R_CallMethodDef CallEntries[] = {
  {"pikchr_c", (DL_FUNC) &pikchr_c, 2},
  {NULL, NULL, 0}
};

// Initialization function that registers routines
void R_init_pikchr(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}