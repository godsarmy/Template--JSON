package Template::JSON::FunctionRegistry;

use strict;
use warnings;

use Template::JSON::Constant qw($SIMPLE_FUNC $ENHANCED_FUNC);

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    $self;
}

sub lookup {
    my $self= shift;
    my ($user_str) = @_;
}

sub decide_functype {
    my $self = shift;
    my ($user_str) = @_;

    if (substr($user_str, 0, 1) =~ /^[a-z]$/) {
        return $SIMPLE_FUNC;
    } else {
        return $ENHANCED_FUNC;
    }
}
1;
