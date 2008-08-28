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
		guint major
		guint minor
		guint micro
	CODE:
		RETVAL = WEBKIT_CHECK_VERSION (major, minor, micro);
	OUTPUT:
		RETVAL

BOOT:
#include "register.xsh"
#include "boot.xsh"
