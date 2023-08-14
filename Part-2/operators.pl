#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# Arithmetic operators
my $var1 = 5;
my $var2 = 2;

say "var1 = $var1\tvar2 = $var2";
say "Addition of the two variables: ", ($var1 + $var2);
say "Subtraction of the two variables: ", ($var1 - $var2);
say "Multiplication of the two variables: ", ($var1 * $var2);
say "Division of var1 by var2: ", ($var1 / $var2);
say "Remainder when var1 is divided by var2: ", ($var1 % $var2);
say "var1 to the power of var2: ", ($var1 ** $var2);