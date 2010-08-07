use strict;
use warnings;
use Test::Requires 'Text::MicroMason';
use Test::More;
use Tfall::Text::MicroMason;

{
    eval {
        my $tmpl = Tfall::Text::MicroMason->new();
        $tmpl->render('t/tmpl/unknown.mason', name => 'john');
    };
    ok $@;
}

{
    my $tmpl = Tfall::Text::MicroMason->new();
    is $tmpl->render('t/tmpl/foo.mason', name => 'john'), "Hello, john\n";
}
{
    my $tmpl = Tfall::Text::MicroMason->new();
    my $t = \<<'...';
<%args>
    $name
</%args>
Hello, <% $name %>
...
    is $tmpl->render($t, name => 'john'), "Hello, john\n";
}

done_testing;

