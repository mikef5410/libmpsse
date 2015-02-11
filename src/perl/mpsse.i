%module MPSSE
%{
#include "mpsse.h"
%}

%typemap(in) (char *str, int len) {
  $1 = SvPV($input,$2);
 }

%typemap(out) swig_string_data
{
  //printf("Converting %d bytes. 0x%x\n",$1.size,*($1.data));
  $result = SWIG_FromCharPtrAndSize($1.data, $1.size); argvi++;
  free($1.data);
}

%include "mpsse.h"
