package Tfall::Text::Xslate;
use strict;
use warnings;
use parent qw/Tfall::Base/;
use Text::Xslate;
use Try::Tiny;

sub render {
    my ($self, @args) = @_;

    my $tt = Text::Xslate->new(@{$self->{args}});
    my $out;
    try {
        my $out = $tt->process( $self->{stuff}, @args );
    } catch {
        $self->errstr( $_ );
    };
    $out;
}

1;
