#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# Define subroutine
sub multiply {
    my ($num1, $num2) = @_; # Pass parameters using the special array @_
    return $num1 * $num2; # Return values using the return keyword
}

say "Performing multiplications..........";
print "Please provide the first number for the multiplication: ";
my $num1 = <STDIN>;
chomp $num1;
print "Please provide the second number for the multiplication: ";
my $num2 = <STDIN>;
chomp $num2;

my $result = multiply($num1, $num2);

# Call the multiply function
say "The multiplication of the two numbers is: $result";