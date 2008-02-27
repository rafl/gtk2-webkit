#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebBackForwardList	PACKAGE = Gtk2::WebKit::WebBackForwardList	PREFIX = webkit_web_back_forward_list_

WebKitWebBackForwardList *
webkit_web_back_forward_list_new_with_web_view (class, web_view)
		WebKitWebView *web_view
	C_ARGS:
		web_view

void
webkit_web_back_forward_list_go_forward (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

void
webkit_web_back_forward_list_go_back (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

gboolean
webkit_web_back_forward_list_contains_item (web_back_forward_list, history_item)
		WebKitWebBackForwardList *web_back_forward_list
		WebKitWebHistoryItem *history_item

void
webkit_web_back_forward_list_go_to_item (web_back_forward_list, history_item)
		WebKitWebBackForwardList *web_back_forward_list
		WebKitWebHistoryItem *history_item

void
webkit_web_back_forward_list_get_forward_list_with_limit (web_back_forward_list, limit)
		WebKitWebBackForwardList *web_back_forward_list
		gint limit
	PREINIT:
		GList *list, *i;
	PPCODE:
		list = webkit_web_back_forward_list_get_forward_list_with_limit (web_back_forward_list, limit);

		for (i = list; i; i = g_list_next (i)) {
			XPUSHs (newSVWebKitWebHistoryItem (i->data));
		}

		g_list_free (list);

void
webkit_web_back_forward_list_get_back_list_with_limit (web_back_forward_list, limit)
		WebKitWebBackForwardList *web_back_forward_list
		gint limit
	PREINIT:
		GList *list, *i;
	PPCODE:
		list = webkit_web_back_forward_list_get_back_list_with_limit (web_back_forward_list, limit);

		for (i = list; i; i = g_list_next (i)) {
			XPUSHs (newSVWebKitWebHistoryItem (i->data));
		}

		g_list_free (list);

WebKitWebHistoryItem *
webkit_web_back_forward_list_get_back_item (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

WebKitWebHistoryItem *
webkit_web_back_forward_list_get_current_item (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

WebKitWebHistoryItem *
webkit_web_back_forward_list_get_forward_item (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

WebKitWebHistoryItem *
webkit_web_back_forward_list_get_nth_item (web_back_forward_list, index)
		WebKitWebBackForwardList *web_back_forward_list
		gint index

gint
webkit_web_back_forward_list_get_back_length (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

gint
webkit_web_back_forward_list_get_forward_length (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

gint
webkit_web_back_forward_list_get_limit (web_back_forward_list)
		WebKitWebBackForwardList *web_back_forward_list

void
webkit_web_back_forward_list_set_limit (web_back_forward_list, limit)
		WebKitWebBackForwardList *web_back_forward_list
		gint limit
