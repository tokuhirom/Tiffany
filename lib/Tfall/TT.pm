package Tfall::TT;
use strict;
use warnings;
use parent qw/Tfall::Base/;
use Template;

sub render {
    my ($self, @args) = @_;
    my $tt = Template->new(@{$self->{args}});
    $tt->process( $self->{stuff}, @args, \my $out )
      or do { $self->errstr( $tt->error ); return };
    $out;
}

1;
