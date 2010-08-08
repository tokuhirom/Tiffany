package Tiffany::Template::Declare;
use strict;
use warnings;
use Template::Declare;

sub new {
    my ($class, $args) = @_;
    $args ||= +{};
    # T::D throws exception when strict => 1.
    # This is required for Tiffany spec.
    Template::Declare->init( strict => 1, %$args );
    bless { }, $class;
}

sub render {
    my ($self, @args) = @_;
    Template::Declare->show(@args);
}

1;
