package Tiffany::Text::Xslate;
use strict;
use warnings;
use Text::Xslate;

sub new {
    my ($class, $args) = @_;
    $args ||= +{};

    my $xslate = Text::Xslate->new($args);
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
