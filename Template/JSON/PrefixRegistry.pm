package Template::JSON::PrefixRegistry;;

use base qw(Template::JSON::FunctionRegistry);

sub new {
    my $class = shift;
    my ($functions) = @_;

    my $self = $class->SUPER::new();
    my $self->{functions} = $functions;
    return $self;
}

sub lookup {
    my $self = shift;
    my ($user_str) = @_;

    foreach my $obj (@{$self->{functions}}) {
        my ($prefix, $func) = @$obj;

        if ($user_str =~ /^$prefix/) {

            my $delimeter = substr($usr_str, length($prefix), 1);
            
            my @args = split($delimeter, $user_str);
            #remove the first element
            shift @args;

            return $func, \@args;
        }
    }
    return undef, [];
}

1;
