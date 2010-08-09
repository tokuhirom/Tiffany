use strict;
use warnings;
use Test::Requires 'Text::ClearSilver';
use Test::More;
use Tiffany;
use Tiffany::Text::ClearSilver;
use Scalar::Util qw/blessed/;

{
    eval {
        my $tmpl = Tiffany::Text::ClearSilver->new();
        is $tmpl->render('t/tmpl/unknown.cs', 'john'), undef;
    };
    ok $@;
}

{
    my $tmpl = Tiffany::Text::ClearSilver->new({load_path => ['t/tmpl']});
    my $out = $tmpl->render('foo.cs', 'john');
    is $out, "hello, john.\n";
    ok !blessed($out);
}

done_testing;

