#!/usr/bin/perl

# Objective of the Project: The following tool can be used for to securely store and retrieve passwords.

use strict;
use warnings;
use feature "say";
use Crypt::CBC;
use MIME::Base64;
use Term::ReadKey;
use Time::HiRes qw(sleep);

my $password_file = "passwords.txt"; # File containing the stored passwords
my $key_file = "secret.txt"; # File containing the secret key
my $encryption_key = load_secret_key($key_file);

sub prompt_for_password {
    my ($prompt) = @_;
    my $password;

    print $prompt;
    ReadMode('noecho');
    chomp($password = <STDIN>);
    ReadMode('normal');
    print "\n";

    return $password;
}

sub store_password {
    my ($service, $password) = @_;
    my $salt = generate_salt();
    my $encrypted_password = encrypt_password($password, $salt);
    my $encoded_password = encode_base64($encrypted_password);
    open(my $fh, '>>', $password_file) or die "ERROR! Could not open file '$password_file': $!";
    say $fh "$service:$salt:$encoded_password";
    close($fh);
}

sub generate_salt {
    my $length = 16;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $salt = '';
    $salt .= $chars[rand(@chars)] for (1..$length);
    return $salt;
}

sub encrypt_password {
    my ($password, $salt) = @_;
    my $cipher = Crypt::CBC->new(-key => $encryption_key, -cipher => 'Rijndael');
    my $encrypted_password = $cipher->encrypt($password . $salt);
    return $encrypted_password;
}

sub load_secret_key {
    my ($file) = @_;
    my $key;

    open my $fh, '<', $file or die "ERROR! Unable to open key file '$file': $!";
    $key = <$fh>;
    close($fh);

    chomp($key);

    unless ($key) {
        die "ERROR! Encryption key not found in '$file'.";
    }

    return $key;
}

sub retrieve_password {
    my ($service) = @_;
    open(my $fh, '<', $password_file) or die "ERROR! Could not open file '$password_file': $!";
    while (my $line = <$fh>) {
        chomp $line;
        my ($stored_service, $stored_salt, $encoded_password) = split(':', $line, 3);
        if (defined $stored_service && defined $stored_salt && defined $encoded_password && $stored_service eq $service) {
            close($fh);
            my $encrypted_password = decode_base64($encoded_password);
            return decrypt_password($encrypted_password, $stored_salt);
        }
    }
    close($fh);
    return undef;
}

sub decrypt_password {
    my ($encrypted_password, $salt) = @_;
    my $cipher = Crypt::CBC->new(-key => $encryption_key, -cipher => 'Rijndael');
    my $decrypted_password = $cipher->decrypt($encrypted_password);
    return substr($decrypted_password, 0, -length($salt));
}

sub main_menu {
    while (1) {
        say "\nPassword Manager Menu:";
        say "1. Store a Password";
        say "2. Retrieve a Password";
        say "3. Exit";
        print "\nEnter your choice (1/2/3): ";
        my $choice = <STDIN>;
        chomp $choice;

        if ($choice == 1) {
            say "\nStoring a password..............";
            print "\nEnter the service name: ";
            my $service = <STDIN>;
            chomp $service;

            my $password1 = prompt_for_password("Enter the password: ");
            my $password2 = prompt_for_password("Confirm the password: ");

            if ($password1 eq $password2) {
                store_password($service, $password1);
                say "\nPassword stored successfully!";
                say "\nReturning to main menu.............."
            } else {
                say "\nERROR! Passwords do not match. Password not stored.";
                say "\nReturning to main menu.............."
            }
        } elsif ($choice == 2) {
            say "\nRetrieving a password..............";
            print "\nEnter the service name to retrieve the password: ";
            my $service = <STDIN>;
            chomp $service;
            my $password = retrieve_password($service);

            if ($password) {
                my $filename = "temp_file_for_password"; # Specify the filename
                open(my $output_fh, '>', $filename) or die "ERROR! Could not open file '$filename': $!";
                print $output_fh "Service Name: $service\n";
                print $output_fh "Password: $password\n";
                close($output_fh);

                say "\nPassword retrieved and saved to '$filename'. This file will be cleared in 60 seconds.\n";

                # Sleep for 1 minute (60 seconds) before removing the file
                sleep(60);

                open(my $clear_fh, '>', $filename) or die "ERROR! Could not open file '$filename': $!";
                print $clear_fh "Service Name: \n";
                print $clear_fh "Password: \n";
                close($clear_fh);

                say "\nThe file has been cleared.";
                say "\nReturning to main menu..............";
            } else {
                say "\nERROR! Password not found for $service.";
                say "\nReturning to main menu..............";
            }
        } elsif ($choice == 3) {
            last;
        } else {
            say "\nInvalid choice. Please try again.";
            say "\nReturning to main menu..............";
        }
    }
}

# Start of the program
say "=============== WELCOME TO PASSWORD MANAGER ===============";

main_menu();

say "\n=============== THANK YOU FOR USING PASSWORD MANAGER ===============";