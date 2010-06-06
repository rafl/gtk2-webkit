#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebDatabase	PACKAGE = Gtk2::WebKit::WebDatabase	PREFIX = webkit_web_data_base_

PROTOTYPES: disable

WebKitSecurityOrigin *
webkit_web_database_get_security_origin (web_database)
		WebKitWebDatabase *web_database

const gchar *
webkit_web_database_get_name (web_database)
		WebKitWebDatabase *web_database

const gchar *
webkit_web_database_get_display_name (web_database)
		WebKitWebDatabase *web_database

guint64
webkit_web_database_get_expected_size (web_database)
		WebKitWebDatabase *web_database

guint64
webkit_web_database_get_size (web_database)
		WebKitWebDatabase *web_database

const gchar *
webkit_web_database_get_filename (web_database)
		WebKitWebDatabase *web_database

void
webkit_web_database_remove (web_database)
		WebKitWebDatabase *web_database

void
webkit_remove_all_web_databases (class)
	C_ARGS:

const gchar *
webkit_get_web_database_directory_path (class)
	C_ARGS:

void
webkit_set_web_database_directory_path (class, path)
		const gchar *path
	C_ARGS:
		path

void
webkit_get_default_web_database_quota (class)
	C_ARGS:

void
webkit_set_default_web_database_quota (class, default_quota)
		guint64 default_quota
	C_ARGS:
		default_quota
