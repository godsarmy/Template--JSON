package Template::JSON::ProgramBuilder;

use strict;
use warnings;

use Template::JSON::CallableRegistry;
use Template::JSON::DictRegistry;

sub new {
    my $class = shift;
    my ($formatters, $predicates, $template_registry) = @_;

    my $section = Template::JSON::Section->new();
    my $self = {
        currenct_section => $section,
        stack => [$section],
    };

    if (ref($formatters) eq "HASH") {
        $formatters = Template::JSON::DictRegistry($formatters);
    } elsif (ref($formatters) eq "CODE") {
        $formatters = Template::JSON::CallableRegistry($formatters);
    }
    return bless $self, $class;
}

1;
