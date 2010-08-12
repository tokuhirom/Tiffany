package Tiffany::JSON;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01_01';

use JSON 2;

sub new {
    my ($class, $args) = @_; $args ||= {};

    my $engine = JSON->new();
    while (my ($meth, $val) = each %$args) {
        $engine->$meth($val);
    }
    return bless { engine => $engine }, $class;
}

sub render {
    my ($self, @args) = @_;
    $self->{engine}->encode(@args);
}

1;
__END__

=encoding utf8

=head1 NAME

Tiffany::JSON - Tiffany adapter for JSON

=head1 SYNOPSIS

    use Tiffany;
    my $t = Tiffany->load('JSON');
    $t->render({foo => 'bar'});
    # => '{"foo":"bar"}'

=head1 DESCRIPTION

Tiffany::JSON is Tiffany adapter for JSON.pm.

=head1 OPTIONS

You can specify any options in HashRef. See the following code:

    Tiffany->load('JSON', +{ ascii => 1, canonical => 1});

This calls following methods internally.

    JSON->new()->ascii(1)->canonical(1);

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

L<Tiffany>, L<JSON>

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
