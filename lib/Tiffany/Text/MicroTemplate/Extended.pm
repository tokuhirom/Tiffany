package Tiffany::Text::MicroTemplate::Extended;
use strict;
use warnings;
use Text::MicroTemplate::Extended;

sub new {
    my ($class, $args) = @_;
    $args ||= +{};
    my $mtf = Text::MicroTemplate::Extended->new(%$args);
    bless {
        mtf => $mtf,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    return $self->{mtf}->render($stuff, @args)->as_string;
}

1;

