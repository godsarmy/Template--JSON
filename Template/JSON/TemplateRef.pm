package Template::JSON::TemplateRef;

use strict;
use warnings;

sub new {
    my $class = shift;
    my ($name, $template) = @_;
    my $self = bless {
        'name' => $name,
        'template' => $template,
    }, $class;
    $self;
}

sub resolve{
    my $self = shift;
    my ($context) = @_;

    if ($self->{template}) {
        return $self->{template};
    } elsif ($context->{group}) {
        return $context->{group}->get($name);
    } else {
        return undef;
    }
}
1;
