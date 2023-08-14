#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# String concatenation
say "===== String Concatenation =====";
my $first_name = "Dwight";
my $last_name = "Schrute";
my $full_name = $first_name . " " . $last_name;
say "Full Name: $full_name";

say "";

# String interpolation
say "===== String Interpolation =====";
my $var = "The Office";
say "var = \"The Office\"";
say "This is an interpolated string where the string is encapsulated in double quotes. Welcome to $var!";
say 'This is a non-interpolated string where the string is encapsulated in single quotes. Welcome to $var!';

say "";

# String repetition
say "===== String Repetition =====";
my $repeatString = "Hello " x 5;
say "$repeatString";

say "";

# String length
say "===== String Length =====";
my $string = "Hello World!";
say "Length of the string \"$string\": ", length($string);

say "";

# Substrings
say "===== Substrings =====";
my $substring = substr($string, 0, 5);
say "Substring of \"$string\" from index 0 to 5: $substring";

say "";

# String replacement
say "===== String Replacement =====";
say "String before replacement: $string";
my $stringReplace = $string;
$stringReplace =~ s/World/Perl/;
say "String after replacement: $stringReplace";