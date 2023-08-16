#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# if statement
print "Enter your last name (-1 to exit): ";
my $last_name = <STDIN>;
chomp $last_name;

if ($last_name ne "-1") {
    say "$last_name\'s Conditions Program";
}

say "";

# if-else statement
print "Enter your age: ";
my $age = <STDIN>;
chomp $age;

if ($age >= 18) {
    say "You are an adult!";
} else {
    say "You are a child!";
}

say "";

# Terenary operator
print "Enter the current temperature: ";
my $temperature = <STDIN>;
chomp $temperature;

my $weather = ($temperature > 25) ? "warm" : "cold";
say "The current weather is $weather!";

say "";

# unless statement
print "Enter your city (-1 to exit): ";
my $city = <STDIN>;
chomp $city;

unless ($city eq "-1") {
    say "$city is the most beautiful city in the world!";
}