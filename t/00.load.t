use Test::More tests => 1;

use Gtk2 -init;

BEGIN {
use_ok( 'Gtk2::WebKit' );
}

diag( "Testing Gtk2::WebKit $Gtk2::WebKit::VERSION" );
