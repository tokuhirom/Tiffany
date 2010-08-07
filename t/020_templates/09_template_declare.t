use strict;
use warnings;
use Test::Requires 'Template::Declare';
use Test::More;
use Tfall;
use Tfall::Template::Declare;

{
    package MyPage;
    use Template::Declare::Tags; # defaults to 'HTML'
    use base 'Template::Declare';

    template simple => sub {
        my ($class, $name) = @_;
        html {
            head {} body {
                p { "Hello, $name." };
            }
        }
    };
}

{
    eval {
        my $tmpl = Tfall::Template::Declare->new();
        $tmpl->render('unknown');
    };
    ok $@;
}

{
    my $tmpl = Tfall::Template::Declare->new(dispatch_to => ['MyPage']);
    like $tmpl->render('simple', 'john'), qr/Hello, john./;
}

done_testing;


