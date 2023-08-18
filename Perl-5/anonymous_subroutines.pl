#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# Create an anonymous subroutine and store it in a variable
my $add = sub {
    my ($num1, $num2) = @_;
    return $num1 + $num2;
};

say "=============== Performing Additions ===============";

print "Please provide the first number for the addition: ";
my $num1 = <STDIN>;
chomp $num1;
print "Please provide the second number for the addition: ";
my $num2 = <STDIN>;
chomp $num2;

# Call the anonymous subroutine
say "Calling the anonymous subroutine..........";
my $result = $add->($num1, $num2);
say "The addition of the two numbers is: $result";