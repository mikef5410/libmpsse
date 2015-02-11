#!/usr/bin/perl
use FTDI;
use MPSSE;

use Data::Dumper qw(Dumper);
my $result=MPSSE::MPSSE($MPSSE::SPI0,$MPSSE::FIVE_MHZ,$MPSSE::MSB);

#my $result=MPSSE::Open(0x0403,0x6014,$MPSSE::SPI0,
#                      $MPSSE::FIVE_MHZ,$MPSSE::MSB,
#                     $MPSSE::INTERFACE_ANY,undef,undef);

die "Open failed!" if ($result->{open} != 1) ;
my $ftdi_ctx=$result->{ftdi};

my $id=$ftdi_ctx->read_chipid();
printf("Chipid: 0x%x\n",$id);
#my $chipid = FTDI::read_chipid($ftdi_ctx);
#printf("FTDI chipid: 0x%x\n",$chipid);



#my $dev=$ftdi_ctx->{usb_dev};
#print Dumper($dev);
#my @r=$ftdi_ctx->usb_get_strings(undef,255,255,255);
#print Dumper(@r);

$ver=unpack("C",MPSSE::Version());
printf("LibMPSSE version: 0x%02x\n",$ver+0);

print "FTDI is initialized\n" if ($result->{ftdi_initialized});

#print $fchip->swig_description_get();
print $result->{description},"\n";

printf "0x%04x\n",$result->GetPid();
print $result->GetDescription(),"\n";

my $buffer=$result->Transfer("ABCDEFG",7);
print(length($buffer),"\n");

$result->MPSSE::Close();
