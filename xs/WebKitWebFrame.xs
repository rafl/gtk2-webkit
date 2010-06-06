#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebFrame	PACKAGE = Gtk2::WebKit::WebFrame	PREFIX = webkit_web_frame_

PROTOTYPES: disable

#ifndef WEBKIT_DISABLE_DEPRECATED

WebKitWebFrame *
webkit_web_frame_new (class, view)
		WebKitWebView *view
	C_ARGS:
		view

#endif

WebKitWebView *
webkit_web_frame_get_web_view (frame)
		WebKitWebFrame *frame

const gchar *
webkit_web_frame_get_name (frame)
		WebKitWebFrame *frame

const gchar *
webkit_web_frame_get_title (frame)
		WebKitWebFrame *frame

const gchar *
webkit_web_frame_get_uri (frame)
		WebKitWebFrame *frame

WebKitWebFrame *
webkit_web_frame_get_parent (frame)
		WebKitWebFrame *frame

void
webkit_web_frame_load_uri (frame, uri)
		WebKitWebFrame *frame
		const gchar *uri

void
webkit_web_frame_load_string (frame, content, mime_type, encoding, base_uri)
		WebKitWebFrame *frame
		const gchar *content
		const gchar *mime_type
		const gchar *encoding
		const gchar *base_uri

void
webkit_web_frame_load_alternate_string (frame, content, base_url, unreachable_url)
		WebKitWebFrame *frame
		const gchar *content
		const gchar *base_url
		const gchar *unreachable_url

void
webkit_web_frame_load_request (frame, request)
		WebKitWebFrame *frame
		WebKitNetworkRequest *request

void
webkit_web_frame_stop_loading (frame)
		WebKitWebFrame *frame

void
webkit_web_frame_reload (frame)
		WebKitWebFrame *frame

WebKitWebFrame *
webkit_web_frame_find_frame (frame, name)
		WebKitWebFrame *frame
		const gchar *name

#TODO
#WEBKIT_API JSGlobalContextRef
#webkit_web_frame_get_global_context (WebKitWebFrame* frame);

GtkPrintOperationResult
webkit_web_frame_print_full (frame, operation, action)
		WebKitWebFrame *frame
		GtkPrintOperation *operation
		GtkPrintOperationAction action
	PREINIT:
		GError *error = NULL;
	C_ARGS:
		frame, operation, action, &error
	POSTCALL:
		if (error) {
			gperl_croak_gerror (NULL, error);
		}

void
webkit_web_frame_print (frame)
		WebKitWebFrame *frame

WebKitLoadStatus
webkit_web_frame_get_load_status (frame)
		WebKitWebFrame *frame

GtkPolicyType
webkit_web_frame_get_horizontal_scrollbar_policy (frame)
		WebKitWebFrame *frame

GtkPolicyType
webkit_web_frame_get_vertical_scrollbar_policy (frame)
		WebKitWebFrame *frame

WebKitWebDataSource *
webkit_web_frame_get_data_source (frame)
		WebKitWebFrame *frame

WebKitWebDataSource *
webkit_web_frame_get_provisional_data_source (frame)
		WebKitWebFrame *frame

WebKitSecurityOrigin *
webkit_web_frame_get_security_origin (frame)
		WebKitWebFrame *frame

WebKitNetworkResponse *
webkit_web_frame_get_network_response (frame)
		WebKitWebFrame *frame
