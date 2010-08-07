use inc::Module::Install;
name 'Tfall';
all_from 'lib/Tfall.pm';

test_requires 'Test::Requires';
requires 'parent';
requires 'Try::Tiny';
requires 'UNIVERSAL::require';
requires 'Class::Accessor::Fast';

readme_markdown_from 'lib/Tfall.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
