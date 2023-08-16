#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

# Add the current directory to @INC
use lib '.';

# Import the Student module
use Student;

say "=============== Welcome to the Student Management System! ===============";

print "Would you like to add a new student record (y/n)? ";
my $createRecord = <STDIN>;
chomp $createRecord;

say "";

if ($createRecord eq "y") {
    print "Please provide the student's name: ";
    my $name = <STDIN>;
    chomp $name;
    print "Please provide the student's age: ";
    my $age = <STDIN>;
    chomp $age;
    print "Please provide the student's country: ";
    my $country = <STDIN>;
    chomp $country;

    # Create a new student record
    my $student = Student->new_student(
        name => $name,
        age => $age,
        country => $country,
    );

    # Retrieve student data
    my $studentName = $student->get_name();
    my $studentAge = $student->get_age();
    my $studentCountry = $student->get_country();

    say "";

    say "SUCCESS! A new student record has been created for $studentName.\n[AGE: $studentAge, COUNTRY: $studentCountry]";
} elsif ($createRecord eq "n") {
    say "EXITING... Thank you for using the Student Management System. Goodbye!";
} else {
    say "ERROR! Invalid input. Please try again.";
}