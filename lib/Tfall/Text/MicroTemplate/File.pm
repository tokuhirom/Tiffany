package Tfall::Text::MicroTemplate::File;
use strict;
use warnings;
use parent 'Tfall::Base';
use Text::MicroTemplate::File;
use Try::Tiny;

sub render {
    my ($self, @args) = @_;
    my $mtf = Text::MicroTemplate::File->new(@{$self->{args}});
    try {
        if (ref $self->stuff) {
            $mtf->parse(${$self->stuff});
            $mtf->build()->(@args);
        } else {
            $mtf->render_file($self->stuff, @args);
        }
    } catch {
        $self->errstr($_);
        return undef;
    };
}

1;

