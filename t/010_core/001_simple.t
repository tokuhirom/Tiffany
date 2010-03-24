use strict;
use warnings;
use Test::More;
use Tempa;

Tempa->register('tt' => 'Tempa::Template');
Tempa->register('mt' => 'Tempa::Text::MicroTemplate');

ok(Tempa->is_registered('mt'));
ok(!Tempa->is_registered('pt'));

done_testing;

