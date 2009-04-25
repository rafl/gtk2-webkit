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
