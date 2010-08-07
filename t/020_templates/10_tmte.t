use strict;
use warnings;
use Test::Requires 'Text::MicroTemplate::Extended';
use Test::More;
use Tfall;
use Tfall::Text::MicroTemplate::Extended;
use Scalar::Util qw/blessed/;

{
    eval {
        my $tmpl = Tfall::Text::MicroTemplate::Extended->new();
        is $tmpl->render('t/tmpl/unknown.mt', 'john'), undef;
    };
    ok $@;
}

{
    my $tmpl = Tfall::Text::MicroTemplate::Extended->new(include_path => ['t/tmpl']);
    my $out = $tmpl->render('foo', 'john');
    is $out, "hello, john.\n";
    ok !blessed($out);
}

done_testing;

