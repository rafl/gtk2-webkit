#!/usr/bin/env perl

use strict;
use warnings;
use lib 'ext';
use inc::Module::Install;

name 'Gtk2-WebKit';
license 'lgpl';
perl_version '5.008';
all_from 'lib/Gtk2/WebKit.pm';

webkit or exit;

requires 'Gtk2';

configure_requires 'Gtk2::CodeGen';
configure_requires 'Glib::MakeHelper';
configure_requires 'ExtUtils::Depends';
configure_requires 'ExtUtils::PkgConfig';

test_requires 'Test::More' => '0.89';

no_index directory => qw/inc ext/;
auto_provides;

WriteAll;
