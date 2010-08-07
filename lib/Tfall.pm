package Tfall;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01';
use Carp;
use UNIVERSAL::require;

our $MAP = {
    'tt'    => 'Tfall::TT',
    'mt'    => 'Tfall::Text::MicroTemplate::File',
    'sass'  => 'Tfall::Text::Sass',
    'haml'  => 'Tfall::Text::Haml',
    'mason' => 'Tfall::Text::MicroMason',
};
my %loaded;

sub new {
    my ($class, $path, @args) = @_;
    if ($path =~ /\.([^.]+)$/) {
        if (my $klass = $MAP->{lc $1}) {
            $loaded{$klass}++ or do {
                $klass->use or die $@;
            };
            my $tmpl = $klass->new(@args);
            return bless { tmpl => $tmpl, path => $path}, $class;
        } else {
            Carp::croak("Cannot detect file type from file name: $path");
        }
    } else {
        Carp::croak("Cannot detect ext. from file name: $path");
    }
}

sub render {
    my ($self, @args) = @_;
    return $self->{tmpl}->render($self->{path}, @args);
}

sub errstr {
    my ($self) = @_;
    $self->{tmpl}->errstr;
}

sub is_registered {
    my ($class, $ext) = @_;
    return exists $MAP->{lc $ext};
}

sub lookup {
    my ($class, $ext) = @_;
    return $MAP->{lc $ext};
}

sub register {
    my ($class, $ext, $klass) = @_;
    $MAP->{lc $ext} = $klass;
}

1;
__END__

=encoding utf8

=head1 NAME

Tfall - Generic interface for Perl5 template engines.

=head1 SYNOPSIS

    use Tfall;

    my $tmpl = Tfall->new('/path/to/template.tt');
    $tmpl->render({name => 'John'}); # => string

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

=item $tmpl->errstr();

Get error string for last rendering.

=back

=head1 How to create new tfall engine.

Tfall's class can use L<Tfall::Base> as abstract base class.

Tfall::Base provides following methods.

=over 4

=item my $tmpl = Tfall::Base->new($stuff, @args);

Create new instance of tfall engine.

$sutff should allows Str for filename and ScalarRef for text.

=item $tmpl->args();

This method returns @args of Tfall::Base->new($stuff, @args).

This method is provided for author of Tfall::*.

=item $tmpl->stuff();

This method returns $stuff of Tfall::Base->new($stuff, @args).

This method is provided for author of Tfall::*.

=item $tmpl->slurp();

This method reads content from $tmpl->stuff().
This method makes plain string both ScalarRef and Str.

This method is provided for author of Tfall::*.

=back

Then, you can create new template wrapper with L<Tfall::Base>.

You should implement only one abstract method named B<render>.

For example, you can write TT bidingigs as following:

    package Tfall::TT;
    use strict;
    use warnings;
    use parent qw/Tfall::Base/;
    use Template;

    sub render {
        my ($self, @args) = @_;
        my $tt = Template->new(@{$self->{args}});
        $tt->process( $self->{stuff}, @args, \my $out )
            or do { $self->errstr( $tt->error ); return };
        $out;
    }

    1;

B<process> method MUST not throw any exceptions from template engine.
If the template engine raise exception, you should catch the exeception and set it to $self->errstr and return undef.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

L<Any::Template>, L<http://github.com/rtomayko/tilt>

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
