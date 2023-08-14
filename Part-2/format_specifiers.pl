#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

my $name = "Dwight";
my $age = 30;
my $height = 1.82;

# Printf formats according to format specifiers
printf("Name: %s\nAge: %d\nHeight: %.2f\n", $name, $age, $height);