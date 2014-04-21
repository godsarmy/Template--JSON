package Template::JSON::CallableRegistry;

use strict;
use warnings;

use base qw(Template::JSON::FunctionRegistry);

sub new {
    my $class = shift;
    my ($func) = @_;
    my $self = $class->SUPER::new();

    $self->{func} = $func;

    return $self;
}

sub lookup_with_type {
    my $self = shift;
    my ($user_str) = @_;

    return ($self->{func}($user_str),
            undef,
            $self->decide_functype($user_str));
}
1;
