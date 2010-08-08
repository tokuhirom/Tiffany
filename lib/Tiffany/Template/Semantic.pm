package Tiffany::Template::Semantic;
use strict;
use warnings;
use Template::Semantic;

sub new {
    my ($class, $args) = @_;
    $args ||= +{};
    my $ts = Template::Semantic->new(%$args);
    bless {
        ts => $ts,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    $self->{ts}->process( $stuff, @args);
}

1;
