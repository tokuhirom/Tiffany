package Tfall::Text::Sass;
use strict;
use warnings;
use parent qw/Tfall::Base/;
use Text::Sass;

sub render {
    my ($self, @args) = @_;
    if (defined (my $src = $self->slurp)) {
        my $sass = Text::Sass->new();
        return $sass->sass2css($src);
    } else {
        return undef;
    }
}

1;
