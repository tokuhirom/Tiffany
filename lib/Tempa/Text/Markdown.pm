package Tempa::Text::Markdown;
use strict;
use warnings;
use parent qw/Tempa::Base/;
use Text::Markdown;

sub render {
    my ($self, @args) = @_;
    my $src = do {
        open my $fh, '<', $self->path or do {
            $self->errstr("Cannot open file '@{[ $self->path ]}': $!");
            return undef;
        };
        local $/;
        <$fh>;
    };
    return Text::Markdown->new(@{ $self->args })->markdown($src);
}

1;
