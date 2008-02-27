#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebSettings	PACKAGE = Gtk2::WebKit::WebSettings	PREFIX = webkit_web_settings_

WebKitWebSettings *
webkit_web_settings_new (class)
	C_ARGS:

WebKitWebSettings *
webkit_web_settings_copy (web_settings)
		WebKitWebSettings *web_settings
