#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# Declare an array
my @names = ("Dwight", "Jim", "Pam");

# Print the second element - "Jim"
say "The second element of the array: ", $names[1];

say "";

# Print the complete array with a delimiter (comma and space)
say "The complete array: ", join(", ", @names);

say "";

# Add an element to the end of the array
push @names, "Michael";
say "The updated array after adding an element to the end: ", join(", ", @names);

say "";

# Add an element to the beginning of the array
unshift @names, "Ryan";
say "The updated array after adding an element to the beginning: ", join(", ", @names);

say "";

# Remove an element from the end of the array
pop @names;
say "The updated array after removing an element from the end: ", join(", ", @names);

say "";

# Remove an element from the beginning of the array
shift @names;
say "The updated array after removing an element from the beginning: ", join(", ", @names);

say "";

# Obtain the size of the array
my $size = scalar @names;
say "The size of the array (no. of elements): ", $size;