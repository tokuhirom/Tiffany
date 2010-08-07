package Sinatraish;
use strict;
use warnings;
use parent qw/Exporter/;
use Plack::Request;
use Plack::Response;
# use Data::Section::Simple;
use Router::Simple::Sinatraish;
use Tfall;

our @EXPORT = qw/walk view_opt/;

sub import {
    Router::Simple::Sinatraish->export_to_level(1);
    __PACKAGE__->export_to_level(1);
}

my $view_class;
my @view_opt;
sub view_opt {
    ($view_class, @view_opt) = @_;
}

sub walk () {
    my $caller = caller(0);
    # my $data_section = Data::Section::Simple->new($caller)->get_data_section // die;
    my $router = $caller->router;
    "Tfall::$view_class"->require;
    sub {
        my $env = shift;
        my $req = Plack::Request->new($env);
        my $c = Sinatraish::Context->new(req => $req);
        if ( my $route = $router->match($env) ) {
            $route->{code}->($c);
            # use Data::Dumper; warn Dumper($c->res);
            return $c->res->finalize;
        }
        else {
            return [ 404, [], ['not found'] ];
        }
    }
}

package Sinatraish::Context;
use Mouse;
use Tfall::TT;

has req => (is => 'ro', isa => 'Plack::Request', required =>1);
has res => (
    is      => 'ro',
    isa     => 'Plack::Response',
    default => sub { Plack::Response->new(200, ['Content-Type' => 'text/html; charset=utf-8'], 'no content') }
);
# has data_section => (is => 'ro', isa => 'HashRef');

sub render {
    my ($self, $path, @args) = @_;

    my $tfall = "Tfall::$view_class"->new(@view_opt);
    my $html = $tfall->render($path, @args);
    $self->res->header('Content-Length' => length($html));
    $self->res->body($html);
}

no Mouse;__PACKAGE__->meta->make_immutable;

1;
