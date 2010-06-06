#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebResource	PACKAGE = Gtk2::WebKit::WebResource	PREFIX = webkit_web_resource_

PROTOTYPES: disable

WebKitWebResource *
webkit_web_resource_new (class, data, url, mime_type, encoding, frame_name)
		SV *data
		const gchar *url
		const gchar *mime_type
		const gchar *encoding
		const gchar *frame_name
	PREINIT:
		STRLEN size;
		const gchar *c_data;
	INIT:
		c_data = SvPV (data, size);
	C_ARGS:
		c_data, size, url, mime_type, encoding, frame_name

SV *
webkit_web_resource_get_data (web_resource)
		WebKitWebResource *web_resource
	PREINIT:
		GString *data;
	CODE:
		data = webkit_web_resource_get_data (web_resource);
		RETVAL = newSVpvn (data->str, data->len);
	OUTPUT:
		RETVAL

const gchar *
webkit_web_resource_get_uri (web_resource)
		WebKitWebResource *web_resource

const gchar *
webkit_web_resource_get_mime_type (web_resource)
		WebKitWebResource *web_resource

const gchar *
webkit_web_resource_get_encoding (web_resource)
		WebKitWebResource *web_resource

const gchar *
webkit_web_resource_get_frame_name (web_resource)
		WebKitWebResource *web_resource
