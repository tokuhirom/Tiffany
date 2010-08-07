package Tfall::Text::MicroMason;
use strict;
use warnings;
use parent 'Tfall::Base';
use Text::MicroMason;
use Try::Tiny;

sub render {
    my ($self, @args) = @_;

    try {
        my $mason = Text::MicroMason->new(@{$self->args});
        $mason->execute(
            (ref $self->stuff ? ('text' => ${$self->stuff}) : ('file' => $self->stuff)),
            @args
        );
    } catch {
        $self->errstr($_);
        return undef;
    }
}

1;
