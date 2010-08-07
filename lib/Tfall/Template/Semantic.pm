package Tfall::Template::Semantic;
use strict;
use warnings;
use Template::Semantic;

sub new {
    my $class = shift;
    my $ts = Template::Semantic->new(@_);
    bless {
        ts => $ts,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    $self->{ts}->process( $stuff, @args);
}

1;
