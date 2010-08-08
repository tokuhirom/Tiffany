package Tfall::Text::Xslate;
use strict;
use warnings;
use Text::Xslate;

sub new {
    my $class = shift;
    my %args = @_ == 1 ? %{ $_[0] } : @_;

    my $xslate = Text::Xslate->new(%args);
    bless {
        xslate => $xslate,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;

    if (ref $stuff) {
        return $self->{xslate}->render_string($$stuff, @args);
    } else {
        return $self->{xslate}->render($stuff, @args);
    }
}

1;
