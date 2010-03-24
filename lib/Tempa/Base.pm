package Tempa::Base;
use strict;
use warnings;
use parent qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors(qw/args errstr/);

sub new {
    my ($class, $path, @args) = @_;
    bless {path => $path, args => \@args}, $class;
}

1;
