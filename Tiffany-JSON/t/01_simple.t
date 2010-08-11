use strict;
use warnings;
use Tiffany;
use Test::More;

{
    my $t = Tiffany->load('JSON');
    is $t->render({foo => 'bar'}), '{"foo":"bar"}';
}

{
    my $t = Tiffany->load('JSON', {space_after => 1, space_before => 1});
    is $t->render({foo => 'bar'}), '{"foo" : "bar"}', 'options works well';
}

done_testing;

