package Tempa::Base;
use strict;
use warnings;
use parent qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors(qw/args errstr path/);

sub new {
    my ($class, $path, @args) = @_;
    bless {path => $path, args => \@args}, $class;
}

sub slurp {
    my $self = shift;
    open my $fh, '<', $self->path or do {
        $self->errstr("Cannot open file '@{[ $self->path ]}': $!");
        return undef;
    };
    do { local $/; <$fh> };
}

1;
