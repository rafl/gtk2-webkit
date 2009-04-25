#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebNavigationAction	PACKAGE = Gtk2::WebKit::WebNavigationAction	PREFIX = webkit_web_navigation_action_

PROTOTYPES: disable

WebKitWebNavigationReason
webkit_web_navigation_action_get_reason (navigation_action)
		WebKitWebNavigationAction *navigation_action

void
webkit_web_navigation_action_set_reason (navigation_action, reason)
		WebKitWebNavigationAction *navigation_action
		WebKitWebNavigationReason reason

const gchar *
webkit_web_navigation_action_get_original_uri (navigation_action)
		WebKitWebNavigationAction *navigation_action

void
webkit_web_navigation_action_set_original_uri (navigation_action, original_uri)
		WebKitWebNavigationAction *navigation_action
		const gchar *original_uri

gint
webkit_web_navigation_action_get_button (navigation_action)
		WebKitWebNavigationAction *navigation_action

gint
webkit_web_navigation_action_get_modifier_state (navigation_action)
		WebKitWebNavigationAction *navigation_action
