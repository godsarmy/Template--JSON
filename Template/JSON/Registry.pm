package Template::JSON::Registry;

use strict;
use warnings;

use Template::JSON::Constant qw($TEMPLATE_FORMATTER);
use base qw(Template::JSON::FunctionRegistry);

sub new {
    my $class = shift;
    my ($owner) = @_;
    my $self = $class->SUPER::new();
    $self->{owner} = $owner;

    return $self;
}

sub lookup_with_type {
    my ($self) = shift;
    my ($user_str) = @_;

    my $prefix = 'template ';
    my $ref = undef;

    if ($user_str =~ /^$prefix/) {
        my $name = substr($user_str, length($prefix));

        if ($name eq 'SELF') {
            $ref = Template::JSON::TemplateRef(undef, $self->{owner}) 
        } else {
            $ref = Template::JSON::TemplateRef($name) 
        }
    }
    return ($ref, [], $TEMPLATE_FORMATTER);
}

=pod

Each template owns a template regiestry

=cut

1;
