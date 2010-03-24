use strict;
use warnings;
use Test::Requires 'Template::Semantic';
use Test::More;
use Tempa;
use Tempa::Template::Semantic;

{
    my $tmpl = Tempa::Template::Semantic->new('t/tmpl/foo.ts');
    is $tmpl->render({'#name' => 'john'}), qq{<html xmlns="http://www.w3.org/1999/xhtml">Hello, <div id="name">john</div>.</html>\n};
}

done_testing;

