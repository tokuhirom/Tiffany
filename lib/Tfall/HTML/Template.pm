package Tfall::HTML::Template;
use strict;
use warnings;
use parent qw/Tfall::Base/;
use HTML::Template;
use Try::Tiny;

sub render {
    my ($self, $args) = @_;
    try {
        my $type = ref $self->{stuff} ? 'scalarref' : 'filename';
        my $ht = HTML::Template->new($type => $self->{stuff}, @{$self->{args}});
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
