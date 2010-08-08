package Tfall::Template::Semantic;
use strict;
use warnings;
use Template::Semantic;

sub new {
    my $class = shift;
    my %args = @_ == 1 ? %{ $_[0] } : @_;
    my $ts = Template::Semantic->new(%args);
    bless {
        ts => $ts,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    $self->{ts}->process( $stuff, @args);
}

1;
