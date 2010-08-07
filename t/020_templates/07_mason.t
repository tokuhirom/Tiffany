use strict;
use warnings;
use Test::Requires 'Text::MicroMason';
use Test::More;
use Tfall;

{
    my $tmpl = Tfall->new('t/tmpl/foo.mason');
    is $tmpl->render(name => 'john'), "Hello, john\n";
}
{
    my $tmpl = Tfall->new('t/tmpl/unknown.mason');
    is $tmpl->render(name => 'john'), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tfall::Text::MicroMason->new('t/tmpl/foo.mason');
    is $tmpl->render(name => 'john'), "Hello, john\n";
}
{
    my $tmpl = Tfall::Text::MicroMason->new(\<<'...');
<%args>
    $name
</%args>
Hello, <% $name %>
...
    is $tmpl->render(name => 'john'), "Hello, john\n";
    diag $tmpl->errstr() if $tmpl->errstr;
}

done_testing;

