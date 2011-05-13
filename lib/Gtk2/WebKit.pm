package Gtk2::WebKit;

use strict;
use warnings;
use Gtk2;
use base qw/DynaLoader/;

our $VERSION = '0.09';

sub dl_load_flags { 0x01 }

__PACKAGE__->bootstrap($VERSION);

=head1 NAME

Gtk2::WebKit - Web content engine library for Gtk2

=head1 SYNOPSIS

    use Gtk2 -init;
    use Gtk2::WebKit;

    my $window = Gtk2::Window->new;
    my $sw     = Gtk2::ScrolledWindow->new;
    my $view   = Gtk2::WebKit::WebView->new;

    $sw->add($view);
    $window->add($sw);

    $view->open('http://perldition.org');

    $window->show_all;
    Gtk2->main;

=head1 DESCRIPTION

WebKit is a web content engine, derived from KHTML and KJS from KDE, and
used primarily in Apple's Safari browser.  It is made to be embedded in
other applications, such as mail readers, or web browsers.

It is able to display content such as HTML, SVG, XML, and others. It also
supports DOM, XMLHttpRequest, XSLT, CSS, Javascript/ECMAscript and more.

For more information about WebKit visit

=over 2

=item L<http://webkit.org/>

=item L<http://live.gnome.org/WebKit>

=back

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-gtk2-webkit@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

Florian Ragwitz  C<< <rafl@debian.org> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, 2009  Florian Ragwitz C<< <rafl@debian.org> >>.

This is free software, licensed under:

  The GNU Lesser General Public License Version 2.1, February 1999

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut

1;
