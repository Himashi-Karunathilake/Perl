# Define a class
package Student;

# Create a constructor to create new objects
sub new_student {
    my ($class, %args) = @_; # Capture the class name and arguments
    my $self = { # Create a hash reference to store the object's attributes
        name => $args{name},
        age => $args{age},
        country => $args{country},
    };

    bless $self, $class; # Bless the reference to the class name to create an object

    return $self; # Return the object
}

sub get_name {
    my ($self) = @_; # Capture the object
    return $self->{name}; # Return the name attribute
}

sub get_age {
    my ($self) = @_; # Capture the object
    return $self->{age}; # Return the age attribute
}

sub get_country {
    my ($self) = @_; # Capture the object
    return $self->{country}; # Return the country attribute
}

return 1; # Return true to indicate that the module has been successfully loaded