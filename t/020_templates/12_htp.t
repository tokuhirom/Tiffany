use strict;
use warnings;
use Test::Requires 'HTML::Template::Pro';
use Test::More;
use Tiffany;

SKIP: {
    local $TODO = 'I cannot find how to detect parsing error';
    eval {
        my $tmpl = Tiffany->load('HTML::Template::Pro');
        $tmpl->render('unknown.ht');
    };
    ok $@, 'throws exception when got error';
}

{
    my $tmpl = Tiffany::HTML::Template::Pro->new();
    is $tmpl->render('t/tmpl/foo.ht', {name => 'john'}), "Hello, john.\n";
}
{
    my $tmpl = Tiffany::HTML::Template::Pro->new();
    is $tmpl->render(\q{Hello, <TMPL_VAR NAME="name">.}, {name => 'john'}), "Hello, john.";
}

done_testing;

