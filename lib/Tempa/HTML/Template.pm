package Tempa::HTML::Template;
use strict;
use warnings;
use HTML::Template;
use Try::Tiny;

sub new {
    my ($class, $path, @args) = @_;
    bless {path => $path, args => \@args}, $class;
}

sub render {
    my ($self, $args) = @_;
    try {
        my $ht = HTML::Template->new(filename => $self->{path}, @{$self->{args}});
        while (my ($k, $v) = each %$args) {
            $ht->param($k => $v);
        }
        return $ht->output();
    } catch {
        $self->{errstr} = $_;
        return undef;
    };
}

sub errstr {
    my ($self) = @_;
    $self->{errstr};
}

1;
