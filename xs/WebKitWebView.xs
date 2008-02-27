#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebView	PACKAGE = Gtk2::WebKit::WebView	PREFIX = webkit_web_view_

GtkWidget *
webkit_web_view_new (class)
	C_ARGS:

void
webkit_web_view_set_maintains_back_forward_list (web_view, flag)
		WebKitWebView *web_view
		gboolean flag

WebKitWebBackForwardList *
webkit_web_view_get_back_forward_list (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_go_to_back_forward_item (web_view, item)
		WebKitWebView *web_view
		WebKitWebHistoryItem *item

gboolean
webkit_web_view_can_go_back (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_can_go_back_or_forward (web_view, steps)
		WebKitWebView *web_view
		gint steps

gboolean
webkit_web_view_can_go_forward (web_view)
		WebKitWebView *web_view

void
webkit_web_view_go_back (web_view)
		WebKitWebView *web_view

void
webkit_web_view_go_back_or_forward (web_view, steps)
		WebKitWebView *web_view
		gint steps

void
webkit_web_view_go_forward (web_view)
		WebKitWebView *web_view

void
webkit_web_view_stop_loading (web_view)
		WebKitWebView *web_view

void
webkit_web_view_open (web_view, uri)
		WebKitWebView *web_view
		const gchar *uri

void
webkit_web_view_reload (web_view)
		WebKitWebView *web_view

void
webkit_web_view_load_string (web_view, content, content_mime_type, content_encoding, base_uri)
		WebKitWebView *web_view
		const gchar *content
		const gchar *content_mime_type
		const gchar *content_encoding
		const gchar *base_uri

void
webkit_web_view_load_html_string (web_view, content, base_uri)
		WebKitWebView *web_view
		const gchar *content
		const gchar *base_uri

gboolean
webkit_web_view_search_text (web_view, string, case_sensitive, forward, wrap)
		WebKitWebView *web_view
		const gchar *string
		gboolean case_sensitive
		gboolean forward
		gboolean wrap

guint
webkit_web_view_mark_text_matches (web_view, string, case_sensitive, limit)
		WebKitWebView *web_view
		const gchar *string
		gboolean case_sensitive
		guint limit

void
webkit_web_view_set_highlight_text_matches (web_view, highlight)
		WebKitWebView *web_view
		gboolean highlight

void
webkit_web_view_unmark_text_matches (web_view)
		WebKitWebView *web_view

WebKitWebFrame *
webkit_web_view_get_main_frame (web_view)
		WebKitWebView *web_view

WebKitWebFrame *
webkit_web_view_get_focused_frame (web_view)
		WebKitWebView *web_view

void
webkit_web_view_execute_script (web_view, script)
		WebKitWebView *web_view
		const gchar *script

gboolean
webkit_web_view_can_cut_clipboard (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_can_copy_clipboard (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_can_paste_clipboard (web_view)
		WebKitWebView *web_view

void
webkit_web_view_cut_clipboard (web_view)
		WebKitWebView *web_view

void
webkit_web_view_copy_clipboard (web_view)
		WebKitWebView *web_view

void
webkit_web_view_paste_clipboard (web_view)
		WebKitWebView *web_view

void
webkit_web_view_delete_selection (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_has_selection (web_view)
		WebKitWebView *web_view

void
webkit_web_view_select_all (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_get_editable (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_editable (web_view, flag)
		WebKitWebView *web_view
		gboolean flag

GtkTargetList *
webkit_web_view_get_copy_target_list (web_view)
		WebKitWebView *web_view

GtkTargetList *
webkit_web_view_get_paste_target_list (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_settings (web_view, settings)
		WebKitWebView *web_view
		WebKitWebSettings *settings

WebKitWebSettings *
webkit_web_view_get_settings (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_get_transparent (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_transparent (web_view, flag)
		WebKitWebView *web_view
		gboolean flag
