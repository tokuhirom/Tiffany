package Tfall;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01';

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

=head1 METHODS

=over 4

=item my $tmpl = Tfall->new($path[, @args]);

This method is factory method for Tfall::* classes.

Destination class is determined by $path's extension.
For example, you passed $path as 'foo.tt', then you got instance of Tfall::TT.

=item Tfall->register($ext, $class);

This method associates a filename pattern with a specific template implementation. To use TT for files ending in a .foo extension:

    Tfall->register('bar', 'Tfall::TT');

=item Tfall->is_registered($ext)

You can check the $ext as registered or not.

=item my $klass = Tfall->lookup($ext);

Lookup template engine from $ext.

=back

=head1 Template Engine Class

=over 4

=item $tmpl->render(@args);

This method rendering template with @args.

If got error, this method returns 'undef'.This method never die if got parse error.

=back

=head1 How to create new tfall engine.

=over 4

=item my $tmpl = Tfall::Base->new(@args);

Create new instance of tfall engine.

$sutff should allows Str for filename and ScalarRef for text.

=back

Then, you can create new template wrapper with L<Tfall::Base>.

You should implement only one abstract method named B<render>.

For example, you can write TT bindings as following:

    # XXX broken
    package Tfall::TT;
    use strict;
    use warnings;
    use Template;

    sub render {
        my ($self, @args) = @_;
        my $tt = Template->new(@{$self->{args}});
        $tt->process( $self->{stuff}, @args, \my $out )
            or die $tt->error;
        $out;
    }

    1;

B<process> method MUST not throw any exceptions from template engine.
If the template engine raise exception, you should catch the exception and set it to $self->errstr and return undef.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

L<Any::Template>, L<http://github.com/rtomayko/tilt>

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
