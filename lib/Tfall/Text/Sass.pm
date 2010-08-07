package Tfall::Text::Sass;
use strict;
use warnings;
use Text::Sass;
use Tfall::Util qw/slurp/;

sub new {
    my $class = shift;
    my $sass = Text::Sass->new();
    bless {
        sass => $sass,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    my $sass = $self->{sass};
    my $src = slurp($stuff);
    return $sass->sass2css($src);
}

1;
