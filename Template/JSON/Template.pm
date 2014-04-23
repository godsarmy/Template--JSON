package Template::JSON::Template;

use strict;
use warnings;

use Template::JSON::Registry;
use Template::JSON::ProgramBuilder;

my $_toke_re_cache = {};

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

    if ($format_char ne '|' && $format_char ne ':') {
        die "Only format characters : and | are accepted (got $format_char)"
    }

    my $balance_counter = 0;
    my $comment_counter = 0;

    my $has_defined = 0;

    #foreach 
}

sub _tokenize {
    my ($template_str, $meta_left, $meta_right, $whitespace) = @_;

    my $trimlen = length($meta_left);
    my $token_re = _make_token_regex($meta_left, $meta_right);

    my $do_strip = ($whitespace eq 'strip-line')  # Do this outside loop
    my $do_strip_part = 0;

}

sub _make_token_regex {
    my ($meta_left, $meta_right) = @_;

    my $key = $meta_left.'__'.$meta_right;

    $_toke_re_cache{$key} = '(' . $meta_left . '\S.*?' . $meta_right . ')';

    return $_toke_re_cache{$key};
}
1;
