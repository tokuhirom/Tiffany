package Tfall::Text::Xslate;
use strict;
use warnings;
use Text::Xslate;

sub new {
    my $class = shift;

    my $xslate = Text::Xslate->new(@_);
    bless {
        xslate => $xslate,
    }, $class;
}

sub render {
    my ($self, @args) = @_;

    return $self->{xslate}->render(@args);
}

1;
