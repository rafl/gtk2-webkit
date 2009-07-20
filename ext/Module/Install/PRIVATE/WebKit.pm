use strict;
use warnings;

package Module::Install::PRIVATE::WebKit;

use base qw/Module::Install::Base/;

our $VERSION = '0.01';

use Cwd;
use Gtk2::CodeGen;
use Glib::MakeHelper;
use ExtUtils::Depends;
use ExtUtils::PkgConfig;
use File::Spec::Functions qw/catfile/;

sub webkit {
    my ($self) = @_;

    mkdir 'build', 0777;

    my %pkgconfig;
    eval {
        %pkgconfig = ExtUtils::PkgConfig->find('webkit-1.0');
    };

    if (my $error = $@) {
        print STDERR $error;
        return;
    }

    Gtk2::CodeGen->parse_maps('webkit');
    Gtk2::CodeGen->write_boot(ignore => qr/^Gtk2::WebKit$/);

    our @xs_files = <xs/*.xs>;

    our $webkit = ExtUtils::Depends->new('Gtk2::WebKit', 'Gtk2');
    $webkit->set_inc($pkgconfig{cflags} . ($Module::Install::AUTHOR ? ' -Wall -Werror' : ''));
    $webkit->set_libs($pkgconfig{libs});
    $webkit->add_xs(@xs_files);
    $webkit->add_pm('lib/Gtk2/WebKit.pm', '$(INST_LIBDIR)/WebKit.pm');

    my $cwd = cwd();
    $webkit->add_typemaps(map { catfile($cwd, $_) } catfile('build', 'webkit.typemap'));

    $webkit->install(catfile('build', 'webkit-autogen.h'));
    $webkit->save_config(catfile('build', 'IFiles.pm'));

    $self->makemaker_args(
        $webkit->get_makefile_vars,
        MAN3PODS => {
            Glib::MakeHelper->do_pod_files(@xs_files),
        },
    );

    return 1;
}

package MY;

sub postamble {
    return Glib::MakeHelper->postamble_clean
         . Glib::MakeHelper->postamble_docs_full(
            DEPENDS   => $Module::Install::PRIVATE::WebKit::webkit,
            XS_FILES  => \@Module::Install::PRIVATE::WebKit::xs_files,
            COPYRIGHT => 'Copyright (C) 2008, Florian Ragwitz',
        );
}
1;
