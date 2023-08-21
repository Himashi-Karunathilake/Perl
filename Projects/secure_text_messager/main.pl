#!/usr/bin/perl

# Objective of the Project: The following tool can be used for encrypted communication between two users.

use strict;
use warnings;
use feature "say";
use Crypt::CBC;
use Term::ReadKey;

sub obtain_message {
    print "Enter your message: ";
    my $message = <STDIN>;
    chomp($message);
    return $message;
}

sub encrypt_message {
    my $message = shift;
    my $cipher = shift;
    my $encrypted_message = $cipher->encrypt($message);
    return $encrypted_message;
}

sub decrypt_message {
    my $encrypted_message = shift;
    my $cipher = shift;
    my $decrypted_message = $cipher->decrypt($encrypted_message);
    return $decrypted_message;
}

say "=============== WELCOME TO SECURE CHAT MESSAGING ===============";
say "";

# Obtain user names
print "What is your name? ";
my $user_a = <STDIN>;
chomp($user_a);
print "Who would you like to chat with? ";
my $user_b = <STDIN>;
chomp($user_b);

say "";

# Obtain the encryption key (16, 24, or 32 bytes for 128, 192, or 256 bits)
print "Enter the encryption / secret key you would like to use: ";

# Disable terminal echo while reading the encryption key
ReadMode('noecho');
my $encryption_key = ReadLine(0);
chomp($encryption_key);

# Restore terminal echo
ReadMode('restore');

# Initialize the CBC cipher with Rijndael (AES) algorithm
my $cipher = Crypt::CBC->new(
    -key    => $encryption_key,
    -cipher => 'Rijndael',
    -header => 'none',
    -iv     => '1234567890123456' # IV should be exactly 16 bytes long
);

say "";

# Initialize the conversation flag
my $continue = 1;

while ($continue) {
    print "\n~~~~~~~~~~ $user_a, you are connected to $user_b. ~~~~~~~~~~\n\nWould you like to message $user_b (y/n)? ";
    my $response_a = <STDIN>;
    chomp($response_a);

    if ($response_a eq "y") {
        # Obtain the message from User A
        my $message_a = obtain_message();

        # Encrypt the message
        my $encrypted_message_a = encrypt_message($message_a, $cipher);

        say "\nYour message has been encrypted: $encrypted_message_a";

        # User B receives the message
        say "\n\n\n$user_b, you have received a message from $user_a.\nDecrypting message..........";
        my $decrypted_message_b = decrypt_message($encrypted_message_a, $cipher);
        say "\n\nDecrypted message: $decrypted_message_b";

        say "";

        print "$user_b, would you like to message $user_a (y/n)? ";
        my $response_b = <STDIN>;
        chomp($response_b);

        if ($response_b eq "y") {
            # User B replies
            my $reply_b = obtain_message();

            # Encrypt the reply
            my $encrypted_reply_b = encrypt_message($reply_b, $cipher);

            say "\nYour message has been encrypted: $encrypted_reply_b";

            # User A receives the reply
            say "\n\n\n$user_a, you have received a message from $user_b.\nDecrypting message..........";
            my $decrypted_reply_a = decrypt_message($encrypted_reply_b, $cipher);
            say "\n\nDecrypted message: $decrypted_reply_a";

            say "";
        } else {
            say "\nNo message sent.";
            $continue = 0; # End the conversation if User B choose not to send a message
        }
    } else {
        say "\nNo message sent.";
        $continue = 0; # End the conversation if User A choose not to send a message
    }
}

say "\n=============== THE CHAT HAD ENDED GOODBYE! ===============";