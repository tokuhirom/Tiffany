package Tempa::Base;
use strict;
use warnings;
use parent qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors(qw/args errstr stuff/);

sub new {
    my ($class, $stuff, @args) = @_;
    bless {stuff => $stuff, args => \@args}, $class;
}

sub slurp {
    my $self = shift;
    open my $fh, '<', $self->stuff or do {
        $self->errstr("Cannot open file '@{[ $self->stuff ]}': $!");
        return undef;
    };
    do { local $/; <$fh> };
}

1;
