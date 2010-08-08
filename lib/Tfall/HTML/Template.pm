package Tfall::HTML::Template;
use strict;
use warnings;
use HTML::Template;

sub new {
    my $class = shift;
    my %args = @_ == 1 ? %{$_[0]} : @_;
    bless {%args}, $class;
}

sub render {
    my ($self, $stuff, $args) = @_;

    my $type = ref $stuff ? 'scalarref' : 'filename';
    my $ht = HTML::Template->new($type => $stuff, %$self);
    $ht->param($args);
    return $ht->output();
}

1;
