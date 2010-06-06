#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebDataSource	PACKAGE = Gtk2::WebKit::WebDataSource	PREFIX = webkit_web_data_source_

PROTOTYPES: disable

WebKitWebDataSource *
webkit_web_data_source_new (class)
	C_ARGS:

WebKitWebDataSource *
webkit_web_data_source_new_with_request (class, request)
		WebKitNetworkRequest *request
	C_ARGS:
		request

WebKitWebFrame *
webkit_web_data_source_get_web_frame (data_source)
		WebKitWebDataSource *data_source

WebKitNetworkRequest *
webkit_web_data_source_get_initial_request (data_source)
		WebKitWebDataSource *data_source

WebKitNetworkRequest *
webkit_web_data_source_get_request (data_source)
		WebKitWebDataSource *data_source

const gchar *
webkit_web_data_source_get_encoding (data_source)
		WebKitWebDataSource *data_source

gboolean
webkit_web_data_source_is_loading (data_source)
		WebKitWebDataSource *data_source

SV *
webkit_web_data_source_get_data (data_source)
		WebKitWebDataSource *data_source
	PREINIT:
		GString *data;
	CODE:
		data = webkit_web_data_source_get_data (data_source);
		RETVAL = newSVpvn (data->str, data->len);
	OUTPUT:
		RETVAL

WebKitWebResource *
webkit_web_data_source_get_main_resource (data_source)
		WebKitWebDataSource *data_source

const gchar *
webkit_web_data_source_get_unreachable_uri (data_source)
		WebKitWebDataSource *data_source

void
webkit_web_data_source_get_subresources (data_source)
		WebKitWebDataSource *data_source
	PREINIT:
		GList *resources, *i;
	PPCODE:
		resources = webkit_web_data_source_get_subresources (data_source);

		for (i = resources; i; i = i->next) {
			XPUSHs (newSVWebKitWebResource (i->data));
		}

		g_list_free (resources);
