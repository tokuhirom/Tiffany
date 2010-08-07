package Tfall::Text::Markdown;
use strict;
use warnings;
use Text::Markdown;
use Tfall::Util qw/slurp/;

sub new {
    my $class = shift;
    my $mkdn = Text::Markdown->new(@_);
    bless {
        mkdn => $mkdn,
    }, $class;
}

sub render {
    my ($self, $stuff, @args) = @_;
    my $src = slurp($stuff);
    return $self->{mkdn}->markdown($src);
}

1;
