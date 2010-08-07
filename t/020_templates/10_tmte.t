use strict;
use warnings;
use Test::Requires 'Text::MicroTemplate::Extended';
use Test::More;
use Tfall;
use Tfall::Text::MicroTemplate::Extended;

{
    eval {
        my $tmpl = Tfall::Text::MicroTemplate::Extended->new();
        is $tmpl->render('t/tmpl/unknown.mt', 'john'), undef;
    };
    ok $@;
}

{
    my $tmpl = Tfall::Text::MicroTemplate::Extended->new(include_path => ['t/tmpl']);
    is $tmpl->render('foo', 'john'), "hello, john.\n";
}

done_testing;

