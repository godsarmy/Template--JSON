package Template::JSON;

use strict;
use warnings;

use Template::JSON::Template;

sub expand {
    my ($template_str, $data, $args) = @_;
    my $template = Template::JSON::Template->new($template_str, $args);
    return $template->expand($data);
}

sub _compile_template {

}

1;
