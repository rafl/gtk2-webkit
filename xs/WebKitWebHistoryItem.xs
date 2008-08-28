#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebHistoryItem	PACKAGE = Gtk2::WebKit::WebHistoryItem	PREFIX = webkit_web_history_item_

PROTOTYPES: disable

WebKitWebHistoryItem *
webkit_web_history_item_new (class)
	C_ARGS:

WebKitWebHistoryItem *
webkit_web_history_item_new_with_data (class, uri, title)
		const gchar *uri
		const gchar *title
	C_ARGS:
		uri, title

const gchar *
webkit_web_history_item_get_title (web_history_item)
		WebKitWebHistoryItem *web_history_item

const gchar *
webkit_web_history_item_get_alternate_title (web_history_item)
		WebKitWebHistoryItem *web_history_item

void
webkit_web_history_item_set_alternate_title (web_history_item, title)
		WebKitWebHistoryItem *web_history_item
		const gchar *title

const gchar *
webkit_web_history_item_get_uri (web_history_item)
		WebKitWebHistoryItem *web_history_item

const gchar *
webkit_web_history_item_get_original_uri (web_history_item)
		WebKitWebHistoryItem *web_history_item

gdouble
webkit_web_history_item_get_last_visited_time (web_history_item)
		WebKitWebHistoryItem *web_history_item
