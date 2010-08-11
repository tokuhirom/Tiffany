use inc::Module::Install;
name 'Tiffany-JSON';
all_from 'lib/Tiffany/JSON.pm';

requires 'Tiffany';
requires 'JSON' => 2;
requires 'Test::More' => 0.88;

readme_markdown_from 'lib/Tiffany/JSON.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
