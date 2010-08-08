package Tfall::Text::MicroTemplate::Extended;
use strict;
use warnings;
use Text::MicroTemplate::Extended;

sub new {
    my $class = shift;
    my %args = @_ == 1 ? %{ $_[0] } : @_;
    my $mtf = Text::MicroTemplate::Extended->new(%args);
    bless {
        mtf => $mtf,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    return $self->{mtf}->render($stuff, @args)->as_string;
}

1;

