package Tfall::Text::MicroMason;
use strict;
use warnings;
use Text::MicroMason;

sub new {
    my $class = shift;
    my %args = @_ == 1 ? %{ $_[0] } : @_;
    my $mason = Text::MicroMason->new(%args);
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
