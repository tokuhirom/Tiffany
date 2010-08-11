use inc::Module::Install;
name 'Tiffany-View-JSON';
all_from 'lib/Tiffany/View/JSON.pm';

# requires '';


readme_markdown_from 'lib/Tiffany/View/JSON.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
