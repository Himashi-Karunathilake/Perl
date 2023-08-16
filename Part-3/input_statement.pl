#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

print "Enter your first name: ";

# Read the input from the user and assign it to a variable
my $first_name = <STDIN>;

# Remove the newline character from the input
chomp $first_name;

say "Hi $first_name!";

say "";

# Obtain the name of the file to be read
print "Enter the name of the file to be read (with the file extension): ";
my $file_name = <STDIN>;
chomp $file_name;

# Read input from the file
open my $file, '<', $file_name or die "Error! Cannot open file: $!";
my $i = 1;
while (<$file>) {
    chomp;
    print "Line $i of file: $_\n";
    $i++;
}

close $file;