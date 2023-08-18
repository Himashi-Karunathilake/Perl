#!/usr/bin/perl

# The fifth program in Perl.

use strict;
use warnings;
use feature "say";

say "";

say "*************** RUNNING THE MODULES.PL FILE ***************";
system("perl modules.pl");
say "__________________________________________________________________________________________";
say "";

say "*************** RUNNING THE ANONYMOUS_SUBROUTINES.PL FILE ***************";
system("perl anonymous_subroutines.pl");
say "__________________________________________________________________________________________";
say "";

say "*************** RUNNING THE FILE_HANDLING.PL FILE ***************";
system("perl file_handling.pl");
say "__________________________________________________________________________________________";
say "";

say "*************** RUNNING THE ERROR_HANDLING.PL FILE ***************";
system("perl error_handling.pl");
say "__________________________________________________________________________________________";
say "";