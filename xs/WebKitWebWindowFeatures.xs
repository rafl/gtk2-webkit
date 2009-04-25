#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebWindowFeatures	PACKAGE = Gtk2::WebKit::WebWindowFeatures	PREFIX = webkit_web_window_features_

PROTOTYPES: disable

WebKitWebWindowFeatures *
webkit_web_window_features_new (class)
	C_ARGS:

gboolean
webkit_web_window_features_equal (features1, features2)
		WebKitWebWindowFeatures *features1
		WebKitWebWindowFeatures *features2
