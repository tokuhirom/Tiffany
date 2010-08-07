package Tfall::Template::Declare;
use strict;
use warnings;
use Template::Declare;

sub new {
    my $class = shift;
    # T::D throws exception when strict => 1.
    # This is required for Tfall spec.
    Template::Declare->init( strict => 1, @_ );
    bless { }, $class;
}

sub render {
    my ($self, @args) = @_;
    Template::Declare->show(@args);
}

1;
