package Tfall::Template::Semantic;
use strict;
use warnings;
use parent qw/Tfall::Base/;
use Template::Semantic;
use Try::Tiny;

sub render {
    my ($self, @args) = @_;
    try {
        my $ts = Template::Semantic->new(@{$self->{args}});
        $ts->process( $self->{stuff}, @args);
    } catch {
        $self->errstr($_);
        return undef;
    };
}

1;
