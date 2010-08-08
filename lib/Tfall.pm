package Tfall;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01_05';

1;
__END__

=encoding utf8

=head1 NAME

Tfall - Generic interface for Perl5 template engines.

=head1 SYNOPSIS

    use Tfall::Text::Xslate;

    my $tmpl = Tfall::Text::Xslate->new();
    $tmpl->render(\'Hello, <: $name :>', {name => 'John'});
    # => "Hello, John"

=head1 DESCRIPTION

Tfall is generic interface for Perl5 template engines.

=head1 The Tfall Protocol

The Tfall protocol is based on duck typing.

=over 4

=item my $tfall = Tfall::Thing->new(@args);

The module SHOULD have B<new> method.

This method creates new instance of Tfall module.

@args should pass to the constructor of template engine.

=item $tmpl->render($stuff, @args);

The module SHOULD have B<render> method.

This method rendering template with @args.

If template engine found any errors, this method MUST throw exception.

If the template engine throws any exceptions, Tfall module SHOULD pass through.

B<$stuff> SHOULD allows Str for filename. And the module MAY allows ScalarRef for text.

This method MUST return plain string. Do not return blessed reference.

=back

=head1 HOW TO USE IT IN MY WEB APPLICATION FRAMEWORK?

Example code is here: eg/sinatraish/.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

L<Any::Template>, L<http://github.com/rtomayko/tilt>

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
