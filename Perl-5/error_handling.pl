#!/usr/bin/perl

use strict;
use warnings;
use feature "say";
use Try::Tiny;

# die Function
say "To open an existing file, please provide the input file name as error_handling.txt.\nTo try out the \"die\" function, please provide the input file name as non_existent_file.txt.";
print "\nPlease provide the name of the input file: ";
my $dieInputFile = <STDIN>;
chomp $dieInputFile;

say "";

# Open the file in read mode
open(my $fh, '<', $dieInputFile) or die "ERROR! Could not open file: $!";
say "Please find the file contents below: ";
say "";

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    say $line;
}

say "";
say "";
say "";

# warn Function
say "To open an existing file, please provide the input file name as error_handling.txt.\nTo try out the \"warn\" function, please provide the input file name as too_large_file.txt.";
print "\nPlease provide the name of the input file: ";
my $warnInputFile = <STDIN>;
chomp $warnInputFile;

say "";

# Open the file in read mode
open($fh, '<', $warnInputFile) or warn "WARNING! Could not open file: $!";
say "Please find the file contents below: ";
say "";

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    say $line;
}

say "";
say "";
say "";

# eval Block
say "To open an existing file, please provide the input file name as error_handling.txt.\nTo try out the \"eval\" block, please provide the input file name as corrupted_file.txt.";
print "\nPlease provide the name of the input file: ";
my $evalInputFile = <STDIN>;
chomp $evalInputFile;

say "";

# Open the file in read mode
eval {
    open($fh, '<', $evalInputFile) or die "ERROR! Could not open file: $!";
};
if ($@) {
    say "ERROR! Could not open file: $@";
}
say "Please find the file contents below: ";
say "";

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    say $line;
}

say "";
say "";
say "";

# Try::Tiny Module
say "To open an existing file, please provide the input file name as error_handling.txt.\nTo try out the \"Try::Tiny\" module, please provide the input file name as missing_file.txt.";
print "\nPlease provide the name of the input file: ";
my $tryTinyInputFile = <STDIN>;
chomp $tryTinyInputFile;

say "";

# Open the file in read mode
try {
    open($fh, '<', $tryTinyInputFile) or die "ERROR! Could not open file: $!";
} catch {
    warn "ERROR! Could not open file: $_\n";
};
say "Please find the file contents below: ";
say "";

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    say $line;
}