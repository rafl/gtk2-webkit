#include "perl_webkit.h"

MODULE = Gtk2::WebKit::NetworkResponse	PACKAGE = Gtk2::WebKit::NetworkResponse	PREFIX = webkit_network_response

PROTOTYPES: disable

WebKitNetworkResponse *
webkit_network_response_new (class, uri)
		const gchar *uri
	C_ARGS:
		uri

void
webkit_network_response_set_uri (response, uri)
		WebKitNetworkResponse *response
		const gchar *uri

const gchar *
webkit_network_response_get_uri (response)
		WebKitNetworkResponse *response

#SoupMessage *
#webkit_network_response_get_message (response)
#		WebKitNetworkResponse *response
