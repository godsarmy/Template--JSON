package Template::JSON::DictRegistry;

use strict;
use warnings;

use base qw(Template::JSON::FunctionRegistry);

sub new {
    my $class = shift;
    my ($func_dict) = @_;
    my $self = $class->SUPER::new();
    
    $self->{func_dict} = $func_dict;

    return $self;
}

sub lookup_with_type {
    my $self = shift;
    my ($user_str) = @_;

    return ($self->{func_dict}->{$user_str},
            undef,
            $self->decide_functype($user_str));
}

1;
