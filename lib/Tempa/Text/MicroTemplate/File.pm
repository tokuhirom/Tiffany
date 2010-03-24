package Tempa::Text::MicroTemplate::File;
use strict;
use warnings;
use parent 'Tempa::Base';
use Text::MicroTemplate::File;
use Try::Tiny;

sub render {
    my ($self, @args) = @_;
    my $mtf = Text::MicroTemplate::File->new(@{$self->{args}});
    try {
        $mtf->render_file($self->path, @args);
    } catch {
        $self->errstr($_);
        return undef;
    };
}

1;

