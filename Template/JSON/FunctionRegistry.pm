package Template::JSON::FunctionRegistry;;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    $self;
}

sub lookup {
    my $self= shift;
    my ($user_str) = @_;
}

1;
