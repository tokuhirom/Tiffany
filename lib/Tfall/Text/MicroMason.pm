package Tfall::Text::MicroMason;
use strict;
use warnings;
use Text::MicroMason;

sub new {
    my $class = shift;
    my $mason = Text::MicroMason->new(@_);
    bless {
        mason => $mason,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;

    $self->{mason}->execute(
        (ref $stuff ? ('text' => ${$stuff}) : ('file' => $stuff)),
        @args
    );
}

1;
