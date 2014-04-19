package Template::JSON;

use strict;
use warnings;

sub new {
    my $class = shift;
    my ($template_str, $compile_options) = @_;
    my $self = {
        group => undef,
    };
    return bless $self, $class
}

sub _from_section {
    my $self = shift;
}

sub _statements {
    my $self = shift;

}

######################################
# None class method
######################################
sub expand {
    my ($template_str, $data, $args) = @_;
    my $template = Template::JSON->new($template_str, $args);
    return $template->expand($data);
}

sub _compile_template {

}

1;
