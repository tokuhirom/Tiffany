package Tfall::Text::Markdown;
use strict;
use warnings;
use parent qw/Tfall::Base/;
use Text::Markdown;

sub render {
    my ($self, @args) = @_;
    if (defined (my $src = $self->slurp)) {
        return Text::Markdown->new(@{ $self->args })->markdown($src);
    } else {
        return undef;
    }
}

1;
