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
      or die $self->{tt}->error;
    $out;
}

1;
