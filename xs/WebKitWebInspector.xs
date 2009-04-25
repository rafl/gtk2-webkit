#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebInspector	PACKAGE = Gtk2::WebKit::WebInspector	PREFIX = webkit_web_inspector_

PROTOTYPES: disable

WebKitWebView *
webkit_web_inspector_get_web_view (web_inspector)
		WebKitWebInspector *web_inspector

const gchar *
webkit_web_inspector_get_inspected_uri (web_inspector)
		WebKitWebInspector *web_inspector
