package Tfall::Text::MicroTemplate::Extended;
use strict;
use warnings;
use Text::MicroTemplate::Extended;

sub new {
    my $class = shift;
    my $mtf = Text::MicroTemplate::Extended->new(@_);
    bless {
        mtf => $mtf,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    return $self->{mtf}->render($stuff, @args);
}

1;

