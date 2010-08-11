use strict;
use warnings;
use Tiffany;

{
    my $t = Tiffany->load('JSON');
    is $t->render();
}


