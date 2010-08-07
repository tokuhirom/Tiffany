use strict;
use warnings;
use Test::More;
use Tfall;

Tfall->register('tt' => 'Tfall::Template');
Tfall->register('mt' => 'Tfall::Text::MicroTemplate');

ok(Tfall->is_registered('mt'));
ok(!Tfall->is_registered('pt'));

done_testing;

