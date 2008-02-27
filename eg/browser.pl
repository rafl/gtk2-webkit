#!/usr/bin/env perl

use strict;
use warnings;
use Gtk2 -init;
use Gtk2::WebKit;

my $view = Gtk2::WebKit::WebView->new;

my $sw = Gtk2::ScrolledWindow->new;
$sw->add($view);

my $win = Gtk2::Window->new;
$win->set_default_size(800, 600);
$win->signal_connect(destroy => sub { Gtk2->main_quit });
$win->add($sw);
$win->show_all;

$view->open( $ARGV[0] // 'http://perldition.org' );

Gtk2->main;
