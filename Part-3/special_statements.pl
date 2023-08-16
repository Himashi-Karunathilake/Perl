#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

sub add {
    my ($num1, $num2) = @_;
    return $num1 + $num2;
}

# last statement
say "Printing numbers till 13 is met..........";
for (my $i = 0; $i < 20; $i++) {
    if ($i == 13) {
        last;
    }
    print "$i\t";
}

say "";
say "";
say "";

# next statement
say "Printing odd numbers less than 20..........";
for (my $j = 0; $j < 20; $j++) {
    if ($j % 2 == 0) {
        next;
    }
    print "$j\t";
}

say "";
say "";
say "";

# return statement
say "Proceeding to add two numbers..........";
print "Enter the first number: ";
my $num1 = <STDIN>;
chomp $num1;
print "Enter the second number: ";
my $num2 = <STDIN>;
chomp $num2;

my $sum = add($num1, $num2);

say "The sum of the two numbers are: $sum";