package Tempa::HTML::Template;
use strict;
use warnings;
use parent qw/Tempa::Base/;
use HTML::Template;
use Try::Tiny;

sub render {
    my ($self, $args) = @_;
    try {
        my $ht = HTML::Template->new(filename => $self->{path}, @{$self->{args}});
        while (my ($k, $v) = each %$args) {
            $ht->param($k => $v);
        }
        return $ht->output();
    } catch {
        $self->errstr($_);
        return undef;
    };
}

1;
