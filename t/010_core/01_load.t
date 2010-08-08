use strict;
use warnings;
use Test::Requires 'Text::Xslate';
use Tfall;
use Test::More;

my $tmpl = Tfall->load( 'Text::Xslate', { syntax => 'TTerse' } );
is $tmpl->render( \'Hello, [% name %]', { name => 'John' } ), 'Hello, John';

done_testing;

