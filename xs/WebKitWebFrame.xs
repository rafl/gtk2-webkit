#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebFrame	PACKAGE = Gtk2::WebKit::WebFrame	PREFIX = webkit_web_frame_

PROTOTYPES: disable

WebKitWebFrame *
webkit_web_frame_new (class, view)
		WebKitWebView *view
	C_ARGS:
		view

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
