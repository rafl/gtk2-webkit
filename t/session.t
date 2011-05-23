use strict;
use warnings;
use Test::More;

use Gtk2 -init;
use Gtk2::WebKit;

my $session = Gtk2::WebKit->get_default_session;
isa_ok($session, 'Gtk2::SoupSession');

done_testing;
