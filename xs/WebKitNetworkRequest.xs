#include "perl_webkit.h"

MODULE = Gtk2::WebKit::NetworkRequest	PACKAGE = Gtk2::WebKit::NetworkRequest	PREFIX = webkit_network_request_

PROTOTYPES: disable

WebKitNetworkRequest *
webkit_network_request_new (class, uri)
		const gchar *uri
	C_ARGS:
		uri

void
webkit_network_request_set_uri (request, uri)
		WebKitNetworkRequest *request
		const gchar *uri

const gchar *
webkit_network_request_get_uri (request)
		WebKitNetworkRequest *request
