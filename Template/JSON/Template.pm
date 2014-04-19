package Template::JSON::Template;

use strict;
use warnings;

use Template::JSON::Registry;
use Template::JSON::ProgramBuilder;

sub new {
    my $class = shift;
    my ($template_str, $more_formatters, $more_predicates,
        $undefined_str, $compile_options) = @_;

    my $r = Template::JSON::Registry->new()
    my $builder = Template::JSON::ProgramBuilder($more_formatters,
                                                 $more_predicates,
                                                 $r);

    my $self = {
        group => undef,
        undefined_str => $undefined_str,
    };

    if ($template_str) {
        ($self->{_program},
         $self->{has_defines}) = _compile_template($template_str,
                                                   $builder,
                                                   $compile_options);
    }
    return bless $self, $class
}

sub _from_section {
    my $self = shift;
}

sub _statements {
    my $self = shift;

}

1;
