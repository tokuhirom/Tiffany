use inc::Module::Install;
name 'Tiffany';
all_from 'lib/Tiffany.pm';

test_requires 'Test::Requires';

no_index directory => 'eg';

readme_markdown_from 'lib/Tiffany.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
