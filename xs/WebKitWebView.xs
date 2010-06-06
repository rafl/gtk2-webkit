#include "perl_webkit.h"
#include <gperl_marshal.h>

STATIC void
store_sting (gpointer key, gpointer value, gpointer user_data)
{
	if (!hv_store ((HV *)user_data, (const char *)key, strlen ((const char *)key),
	               newSVGChar ((const gchar *)value), 0)) {
		croak ("failed to store in hash");
	}
}

STATIC SV *
string_hashtable_to_hashref (GHashTable *params)
{
	HV *hv = newHV ();
	g_hash_table_foreach (params, store_sting, hv);
	return newRV_noinc ((SV *)hv);
}

STATIC void
perl_webkit_web_view_marshall_create_plugin_widget (GClosure *closure,
                                                    GValue *return_value,
                                                    guint n_param_values,
                                                    const GValue *param_values,
                                                    gpointer invocant_hint,
                                                    gpointer marshal_data)
{
	dGPERL_CLOSURE_MARSHAL_ARGS;

	PERL_UNUSED_VAR (return_value);
	PERL_UNUSED_VAR (n_param_values);
	PERL_UNUSED_VAR (invocant_hint);

	GPERL_CLOSURE_MARSHAL_INIT (closure, marshal_data);

	ENTER;
	SAVETMPS;
	PUSHMARK (SP);

	GPERL_CLOSURE_MARSHAL_PUSH_INSTANCE (param_values);

	XPUSHs (sv_2mortal (newSVGChar (g_value_get_string (param_values + 1))));
	XPUSHs (sv_2mortal (newSVGChar (g_value_get_string (param_values + 2))));
	XPUSHs (sv_2mortal (string_hashtable_to_hashref ((GHashTable *)g_value_get_boxed (param_values + 3))));

	GPERL_CLOSURE_MARSHAL_PUSH_DATA;

	PUTBACK;

	GPERL_CLOSURE_MARSHAL_CALL (G_SCALAR);

	SPAGAIN;

	if (count != 1) {
		croak ("create-plugin-widget handlers need to return a single value");
	}

	g_value_set_object (return_value, SvGtkWidget (POPs));

	FREETMPS;
	LEAVE;
}

MODULE = Gtk2::WebKit::WebView	PACKAGE = Gtk2::WebKit::WebView	PREFIX = webkit_web_view_

PROTOTYPES: disable

BOOT:
	gperl_signal_set_marshaller_for (WEBKIT_TYPE_WEB_VIEW,
	                                 "create-plugin-widget",
	                                 perl_webkit_web_view_marshall_create_plugin_widget);

GtkWidget *
webkit_web_view_new (class)
	C_ARGS:

const gchar *
webkit_web_view_get_title (web_view)
		WebKitWebView *web_view

const gchar *
webkit_web_view_get_uri (web_view)
		WebKitWebView *web_view

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
webkit_web_view_reload_bypass_cache (web_view)
		WebKitWebView *web_view

void
webkit_web_view_load_uri (web_view, uri)
		WebKitWebView *web_view
		const gchar *uri

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

void
webkit_web_view_load_request (web_view, request)
		WebKitWebView *web_view
		WebKitNetworkRequest *request

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

WebKitWebInspector *
webkit_web_view_get_inspector (web_view)
		WebKitWebView *web_view

WebKitWebWindowFeatures *
webkit_web_view_get_window_features (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_can_show_mime_type (web_view, mime_type)
		WebKitWebView *web_view
		const gchar *mime_type

gboolean
webkit_web_view_get_transparent (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_transparent (web_view, flag)
		WebKitWebView *web_view
		gboolean flag

gfloat
webkit_web_view_get_zoom_level (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_zoom_level (web_view, zoom_level)
		WebKitWebView *web_view
		gfloat zoom_level

void
webkit_web_view_zoom_in (web_view)
		WebKitWebView *web_view

void
webkit_web_view_zoom_out (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_get_full_content_zoom (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_full_content_zoom (web_view, full_content_zoom)
		WebKitWebView *web_view
		gboolean full_content_zoom

#SoupSession *
#webkit_get_default_session (class)
#	C_ARGS:

const gchar *
webkit_web_view_get_encoding (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_custom_encoding (web_view, encoding)
		WebKitWebView *web_view
		const gchar *encoding

const gchar *
webkit_web_view_get_custom_encoding (web_view)
		WebKitWebView *web_view

void
webkit_web_view_move_cursor (web_view, step, count)
		WebKitWebView *web_view
		GtkMovementStep step
		gint count

WebKitLoadStatus
webkit_web_view_get_load_status (web_view)
		WebKitWebView *web_view

gdouble
webkit_web_view_get_progress (web_view)
		WebKitWebView *web_view

void
webkit_web_view_undo (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_can_undo (web_view)
		WebKitWebView *web_view

void
webkit_web_view_redo (web_view)
		WebKitWebView *web_view

gboolean
webkit_web_view_can_redo (web_view)
		WebKitWebView *web_view

void
webkit_web_view_set_view_source_mode (web_view, view_source_mode)
		WebKitWebView *web_view
		gboolean view_source_mode

gboolean
webkit_web_view_get_view_source_mode (web_view)
		WebKitWebView *web_view

#WebKitHitTestResult *
#webkit_web_view_get_hit_test_result (web_view, event)
#		WebKitWebView *web_view
#		GdkEventButton *event

const gchar *
webkit_web_view_get_icon_uri (web_view)
		WebKitWebView *web_view

void
webkit_set_cache_model (class, cache_model)
		WebKitCacheModel cache_model
	C_ARGS:
		cache_model

WebKitCacheModel
webkit_get_cache_model (class)
	C_ARGS:
