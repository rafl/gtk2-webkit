#include "perl_webkit.h"

MODULE = Gtk2::WebKit::SecurityOrigin	PACKAGE = Gtk2::WebKit::SecurityOrigin	PREFIX = webkit_security_origin_

PROTOTYPES: disable

const gchar *
webkit_security_origin_get_protocol (security_origin)
		WebKitSecurityOrigin *security_origin

const gchar *
webkit_security_origin_get_host (security_origin)
		WebKitSecurityOrigin *security_origin

guint
webkit_security_origin_get_port (security_origin)
		WebKitSecurityOrigin *security_origin

guint64
webkit_security_origin_get_web_database_usage (security_origin)
		WebKitSecurityOrigin *security_origin

guint64
webkit_security_origin_get_web_database_quota (security_origin)
		WebKitSecurityOrigin *security_origin

void
webkit_security_origin_set_web_database_quota (security_origin, quota)
		WebKitSecurityOrigin *security_origin
		guint64 quota

#GList *
#webkit_security_origin_get_all_web_databases (security_origin)
#		WebKitSecurityOrigin *security_origin
