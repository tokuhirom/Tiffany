package Tfall::Text::MicroTemplate::File;
use strict;
use warnings;
use Text::MicroTemplate::File;

sub new {
    my $class = shift;
    my $mtf = Text::MicroTemplate::File->new(@_);
    bless {
        mtf => $mtf,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;

    my $mtf = $self->{mtf};
    if (ref $stuff) {
        $mtf->parse(${$stuff});
        $mtf->build()->(@args)->as_string;
    } else {
        $mtf->render_file($stuff, @args)->as_string;
    }
}

1;

