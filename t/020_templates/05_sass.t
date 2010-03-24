use strict;
use warnings;
use Test::Requires 'Text::Sass';
use Test::More;
use Tempa;
use Tempa::Text::Sass;

Tempa->register('sass', 'Tempa::Text::Sass');

{
    my $tmpl = Tempa->new('t/tmpl/foo.sass');
    is $tmpl->render('john'), <<'...';
body {
  background-color: black;
  color: white;
}
...
}
{
    my $tmpl = Tempa->new('t/tmpl/unknown.sass');
    is $tmpl->render('john'), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tempa::Text::Sass->new('t/tmpl/foo.sass');
    is $tmpl->render('john'), <<'...';
body {
  background-color: black;
  color: white;
}
...
}
{
    my $tmpl = Tempa::Text::Sass->new(\<<',,,');
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

