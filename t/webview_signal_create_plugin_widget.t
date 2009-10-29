use strict;
use warnings;
use Test::More;

use Gtk2 -init;
use Gtk2::WebKit;

my $view = Gtk2::WebKit::WebView->new;
$view->signal_connect('create-plugin-widget' => sub {
    my ($view, $mime_type, $uri, $args) = @_;

    isa_ok($view, 'Gtk2::WebKit::WebView');
    is($mime_type, 'x-application/gtk-test-widget');
    is_deeply($args, {
        all    => 'args',
        should => 'appear',
        in     => 'hash',
        height => 200,
        width  => 200,
        type   => 'x-application/gtk-test-widget',
    });

    Gtk2->main_quit;
    return Gtk2::Label->new('foo');
});

my $html = <<'EOH';
<html><body>
<embed type="x-application/gtk-test-widget" width="200" height="200" all="args" should="appear" in="hash" />
</html></body>
EOH

$view->load_html_string($html, 'file:///foo');

Gtk2->main;
done_testing;
