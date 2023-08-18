#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# Add the current directory to @INC
use lib '.';

# Import the Greet module
use Greet;

say "=============== Welcome to the Greet Module! ===============";

print "Please provide your name: ";
my $name = <STDIN>;
chomp $name;

say "";

# Call a function from the module
Greet::say_hello($name);