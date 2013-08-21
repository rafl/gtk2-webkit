#include "perl_webkit.h"

MODULE = Gtk2::WebKit	PACKAGE = Gtk2::WebKit	PREFIX = webkit_

PROTOTYPES: disable

guint
webkit_major_version (class)
	C_ARGS:

guint
webkit_minor_version (class)
	C_ARGS:

guint
webkit_micro_version (class)
	C_ARGS:

gboolean
webkit_check_version (class, major, minor, micro)
		gint major
		gint minor
		gint micro
	CODE:
		RETVAL = WEBKIT_CHECK_VERSION (major, minor, micro);
	OUTPUT:
		RETVAL


#ifdef GLIB_SOUP_PERL

int
HAS_GLIB_SOUP (class)
	CODE:
		RETVAL = 1;
	OUTPUT:
		RETVAL

SoupSession *
webkit_get_default_session (class)
	C_ARGS:

#endif


BOOT:
#include "register.xsh"
#include "boot.xsh"
	if (!g_thread_supported ()) {
		g_thread_init (NULL);
	}
