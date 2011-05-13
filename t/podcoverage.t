#!perl

use strict;
use warnings;
use Test::More;

use Gtk2; # so the type system can be used

eval 'use Test::Pod::Coverage';
plan skip_all => 'Set TEST_POD to enable this' unless $ENV{TEST_POD};
plan skip_all => 'Test::Pod::Coverage required' if $@;

my @modules = map { 'Gtk2::WebKit::' . $_ } qw/
    NetworkRequest
    WebBackForwardList
    WebFrame
    WebHistoryItem
    WebSettings
    WebView
/;

plan tests => @modules + 1;

pod_coverage_ok('Gtk2::WebKit', { also_private => [qw/dl_load_flags/] });
pod_coverage_ok($_) for @modules;
