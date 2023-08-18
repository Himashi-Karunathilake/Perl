#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

say "=============== Reading from a File ===============";

print "Please provide the name of the input file: ";
my $inputFile = <STDIN>;
chomp $inputFile;

# Open the file in read mode
open(my $fh, '<', $inputFile) or die "ERROR! Could not open file: $!";

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    say $line;
}

# Close the file
close($fh);

say "";
say "";
say "";

say "=============== Appending to a File ===============";

print "Please provide the name of the input file: ";
my $appendFile = <STDIN>;
chomp $appendFile;

# Open the file in append mode
open($fh, '>>', $appendFile) or die "ERROR! Could not open file: $!";

# Append to the file
print "Please provide the text to append to the file: ";
my $text = <STDIN>;
chomp $text;
say $fh $text;

# Close the file
close($fh);

say "";
say "SUCCESS! The text has been appended to the file. Please find the modified file contents below:";
say "";
say "";

# Open the file again in read mode
open($fh, '<', $appendFile) or die "ERROR! Could not open file: $!";

# Read and print the modified file contents
while (my $line = <$fh>) {
    chomp $line;
    say $line;
}

# Close the file
close($fh);

say "";
say "";
say "";
say "=============== Writing to a File ===============";

print "Please provide the name of the output file: ";
my $outputFile = <STDIN>;
chomp $outputFile;

# Open the file in write mode
open($fh, '>', $outputFile) or die "ERROR! Could not open file: $!";

# Read the input from the user
print 'Please provide the text to write to the file (provide your input as a single line by using \n for line breaks): ';
$text = <STDIN>;
chomp $text;

# Replace "\n" with actual newline characters
$text =~ s/\\n/\n/g;

# Write to the file
say $fh $text;

# Close the file
close($fh);

say "";
say "SUCCESS! The text has been written to the file.";