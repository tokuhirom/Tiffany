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
    my $tmpl = Tfall->new('t/tmpl/unknown.sass');
    is $tmpl->render('john'), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tfall::Text::Sass->new('t/tmpl/foo.sass');
    is $tmpl->render('john'), <<'...';
body {
  background-color: black;
  color: white;
}
...
}
{
    my $tmpl = Tfall::Text::Sass->new(\<<',,,');
body
  background-color: black
  color: white
,,,
    is $tmpl->render('john'), <<'...';
body {
  background-color: black;
  color: white;
}
...
}

done_testing;

