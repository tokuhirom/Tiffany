package Tfall::TT;
use strict;
use warnings;
use Template;

sub new {
    my $class = shift;

    my $tt = Template->new(@_);
    bless {
        tt => $tt,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;

    $self->{tt}->process( $stuff, @args, \my $out )
      or do { $self->errstr( $self->{tt}->error ); return };
    $out;
}

1;
