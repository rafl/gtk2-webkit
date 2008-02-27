#!/usr/bin/env perl

use strict;
use warnings;
use Cwd;
use ExtUtils::MakeMaker;
use File::Spec::Functions qw/catfile/;

my %PREREQ_PM = (
        'Gtk2'                => 0,
        'ExtUtils::Depends'   => 0,
        'ExtUtils::PkgConfig' => 0,
);

unless (eval <<'EOD') {
use Gtk2::CodeGen;
use Glib::MakeHelper;
use ExtUtils::Depends;
use ExtUtils::PkgConfig;
1;
EOD
    warn "$@\n";
    WriteMakefile(
            PREREQ_FATAL => 1,
            PREREQ_PM    => \%PREREQ_PM,
    );
}

mkdir 'build', 0777;

my %pkgconfig = ExtUtils::PkgConfig->find('webkit-1.0');

Gtk2::CodeGen->parse_maps('webkit');
Gtk2::CodeGen->write_boot(ignore => qr/^Gtk2::WebKit$/);

our @xs_files = <xs/*.xs>;

our $webkit = ExtUtils::Depends->new('Gtk2::WebKit', 'Gtk2');
$webkit->set_inc($pkgconfig{cflags} . ' -Wall -Werror');
$webkit->set_libs($pkgconfig{libs});
$webkit->add_xs(@xs_files);
$webkit->add_pm('lib/Gtk2/WebKit.pm', '$(INST_LIBDIR)/WebKit.pm');

my $cwd = cwd();
$webkit->add_typemaps(map { catfile($cwd, $_) } catfile('build', 'webkit.typemap'));

$webkit->install(catfile('build', 'webkit-autogen.h'));
$webkit->save_config(catfile('build', 'IFiles.pm'));

WriteMakefile(
    NAME          => 'Gtk2::WebKit',
    VERSION_FROM  => 'lib/Gtk2/WebKit.pm',
    ABSTRACT_FROM => 'lib/Gtk2/WebKit.pm',
    AUTHOR        => 'Florian Ragwitz <rafl@debian.org>',
    LICENSE       => 'perl',
    PREREQ_PM     => \%PREREQ_PM,
    XSPROTOARG    => '-noprototypes',
    MAN3PODS      => {
        Glib::MakeHelper->do_pod_files(@xs_files),
    },
    $webkit->get_makefile_vars,
);

package MY;

sub postamble {
    return Glib::MakeHelper->postamble_clean
        . Glib::MakeHelper->postamble_docs_full(
            DEPENDS   => $::webkit,
            XS_FILES  => \@::xs_files,
            COPYRIGHT => 'Copyright (C) 2008, Florian Ragwitz',
        );
}
