#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# Creating a hash
my %marks = (
    "Dwight" => 95,
    "Jim" => 75,
    "Pam" => 85
);

# Accessing the value of a key - "Dwight"
say "The value of the key \"Dwight\": ", $marks{"Dwight"};

say "";

# Accessing a complete hash
say "The complete hash: ";
foreach my $key (keys %marks) {
    say "\t$key: $marks{$key}";
}

say "";

# Adding a new key-value pair
$marks{"Michael"} = 65;
say "The updated hash after adding a new key-value pair: ";
foreach my $key (keys %marks) {
    say "\t$key: $marks{$key}";
}

say "";

# Modifying the value of an existing key
$marks{"Jim"} = 80;
say "The updated hash after modifying the value of an existing key - \"Jim\": ";
foreach my $key (keys %marks) {
    say "\t$key: $marks{$key}";
}

say "";

# Removing a key-value pair
delete $marks{"Michael"};
say "The updated hash after removing a key-value pair - \"Michael\": ";
foreach my $key (keys %marks) {
    say "\t$key: $marks{$key}";
}

say "";

# Check if a key exists in the hash 
if (exists $marks{"Pam"}) {
    say "The key \"Pam\" exists in the hash.";
} else {
    say "The key \"Pam\" does not exist in the hash.";
}

say "";

# Hash slices
my @keys = ("Dwight", "Jim");
my @values = @marks{@keys};
say "The hash slice for the keys \"Dwight\" and \"Jim\": ", join(", ", @values);

say "";

# Nested hashes
my %report = (
    "Dwight" => {
        "Maths" => 95,
        "English" => 85
    },
    "Jim" => {
        "Maths" => 75,
        "English" => 65
    },
    "Pam" => {
        "Maths" => 85,
        "English" => 95
    }
);

# Accessing a value in a nested hash - "Dwights's Maths Marks"
say "Dwight's Maths Marks: ", $report{"Dwight"}{"Maths"};

say "";

# Accessing a complete nested hash
say "The complete nested hash: ";
foreach my $key (keys %report) {
    say "\t$key: ";
    foreach my $subkey (keys %{$report{$key}}) {
        say "\t\t$subkey: $report{$key}{$subkey}";
    }
}