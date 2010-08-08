package Tfall::TT;
use strict;
use warnings;
use Template;

sub new {
    my $class = shift;
    my %args = @_ == 1 ? %{ $_[0] } : @_;
    my $tt = Template->new(%args);
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
