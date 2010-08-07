use strict;
use warnings;
use Test::Requires 'Text::Sass';
use Test::More;
use Tfall;
use Tfall::Text::Sass;

{
    eval {
        my $tmpl = Tfall::Text::Sass->new();
        $tmpl->render('t/tmpl/unknown.sass', 'john');
    };
    ok $@;
}

{
    my $tmpl = Tfall::Text::Sass->new();
    is $tmpl->render('t/tmpl/foo.sass', 'john'), <<'...';
body {
  background-color: black;
  color: white;
}
...
}
{
    my $tmpl = Tfall::Text::Sass->new();
    my $stuff = <<',,,';
body
  background-color: black
  color: white
,,,
    is $tmpl->render(\$stuff, 'john'), <<'...';
body {
  background-color: black;
  color: white;
}
...
}

done_testing;

