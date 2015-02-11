package MPSSE;
use ExtUtils::MakeMaker;
#system("swig -perl mpsse.i");
WriteMakefile(
     'NAME' => 'MPSSE',            # Name of your module
     'LIBS' => ['-lftdi1', '-lusb' ],             # Custom libraries (if any)
     'INC' => '-I. -I.. -I/usr/include/libftdi1 -I/usr/include/libusb-1.0' ,
     'DEFINE' => '-DSWIGPERL',
     'OPTIMIZE' => '-O1 -g',
     'OBJECT' => [ 'mpsse_wrap.o', 'mpsse.o','support.o' ]    # Object files
             );

sub MY::postamble {
  return<<'MAKE_FRAG';
mpsse_wrap.c: mpsse.i
	swig -perl mpsse.i

MAKE_FRAG
  }
