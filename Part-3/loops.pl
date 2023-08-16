#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# for loop
say "Printing numbers less than 5..........";
for (my $i = 0; $i < 5; $i++) {
    print "$i\t";
}

say "";
say "";
say "";

# while loop
print "Please enter a number less than or equal to 10: ";
my $number = <STDIN>;
chomp $number;

if ($number <= 10) {
    say "Printing numbers less than $number..........";

    my $j = 0;
    while ($j < $number) {
        print "$j\t";
        $j++;
    }
} else {
    say "ERROR! The number $number is greater than 10.\n";
}

say "";
say "";
say "";

# until loop
say "Printing numbers from 1 to 10 in the descending order..........";
my $k = 10;
until ($k == 0) {
    print "$k\t";
    $k--;
}

say "";
say "";
say "";

# foreach loop
my @names = ("Dwight", "Jim", "Pam", "Michael", "Oscar", "Angela", "Kevin", "Andy", "Ryan", "Toby");
say "Printing the names..........";
foreach my $name (@names) {
    print "$name\t";
}

say "";
say "";
say "";

# do-while loop
say "Printing numbers from 1 to 10 in the ascending order..........";
my $l = 1;
do {
    print "$l\t";
    $l++;
} while ($l <= 10);

say "";