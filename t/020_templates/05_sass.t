use strict;
use warnings;
use Test::Requires 'Text::Sass';
use Test::More;
use Tfall;
use Tfall::Text::Sass;

Tfall->register('sass', 'Tfall::Text::Sass');

{
    my $tmpl = Tfall->new('t/tmpl/foo.sass');
    is $tmpl->render('john'), <<'...';
body {
  background-color: black;
  color: white;
}
...
}
{
    eval {
        my $tmpl = Tfall->new('t/tmpl/unknown.sass');
        $tmpl->render('john');
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

