use inc::Module::Install;
name 'Tempa';
all_from 'lib/Tempa.pm';

requires 'Test::Requires';


readme_markdown_from 'lib/Tempa.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
