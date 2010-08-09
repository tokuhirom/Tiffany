use Test::More;
eval "use Test::Synopsis 0.06";
plan skip_all => "Test::Synopsis required for testing" if $@;
all_synopsis_ok();
