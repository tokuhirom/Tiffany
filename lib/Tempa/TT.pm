package Tempa::TT;
use strict;
use warnings;
use Template;

sub new {
    my ($class, $path, @args) = @_;
    my $tt = Template->new(@args);
    bless {path => $path, tt => $tt}, $class;
}

sub render {
    my ($self, @args) = @_;
    $self->{tt}->process($self->{path}, @args, \my $out)
        or return;
    $out;
}

sub errstr {
    my ($self, ) = @_;
    $self->{tt}->error;
}

1;
