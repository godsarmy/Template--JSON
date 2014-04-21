package Template::JSON::Template;

use strict;
use warnings;

use Template::JSON::Registry;
use Template::JSON::ProgramBuilder;

sub new {
    my $class = shift;
    my ($template_str, $more_formatters, $more_predicates,
        $undefined_str, $compile_options) = @_;

    my $r = Template::JSON::Registry->new();
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

sub _split_meta {
    my ($meta) = @_;
    
    my $n = length($meta);

    if ($n % 2 == 1) {
       die "$meta has an odd number of metacharacters";
    }
    return (substr($meta, 0, $n/2), substr($meta, $n/2, $n/2));
}

sub _compile_template {
    my ($template_str, $builder, $meta, $format_char, $default_formatter,
        $whitespace) = @_;

    if (!defined $meta) {
        $meta = '{}';
    }

    if (!defined $format_char) {
        $format_char = '|';
    }

    if (!defined $default_formatter) {
        $default_formatter = 'str';
    }

    if (!defined $whitespace) {
        $whitespace = 'smart';
    }

    my ($meta_left, $meta_right) = _split_meta($meta);
}

1;
