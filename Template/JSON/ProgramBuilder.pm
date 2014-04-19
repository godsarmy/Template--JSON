package Template::JSON::ProgramBuilder;

use strict;
use warnings;

use Template::JSON::CallalbeRegistry;
use Template::JSON::DictRegistry;

sub new {
    my $class = shift;
    my ($formatters, $predicates, $template_registry) = @_;

    my $section = Template::JSON::Section->new();
    $self = {
        currenct_section => $section,
        stack => [$section],
    };

    if (ref($formatters) eq "HASH") {
        $formatters = Template::JSON::DictRegistry($formatters);
    } elsif (ref($formatters) eq "CODE") {
        $formatters = Template::JSON::CallalbeRegistry($formatters);
    }
    return bless $self, $class;
}

1;
