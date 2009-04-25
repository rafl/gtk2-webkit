#include "perl_webkit.h"

MODULE = Gtk2::WebKit::Download	PACKAGE = Gtk2::WebKit::Download	PREFIX = webkit_download_

PROTOTYPES: disable

WebKitDownload *
webkit_download_new (class, request)
		WebKitNetworkRequest *request
	C_ARGS:
		request

void
webkit_download_start (download)
		WebKitDownload *download

void
webkit_download_cancel (download)
		WebKitDownload *download

const gchar *
webkit_download_get_uri (download)
		WebKitDownload *download

WebKitNetworkRequest *
webkit_download_get_network_request (download)
		WebKitDownload *download

const gchar *
webkit_download_get_suggested_filename (download)
		WebKitDownload *download

const gchar *
webkit_download_get_destination_uri (download)
		WebKitDownload *download

void
webkit_download_set_destination_uri (download, destination_uri)
		WebKitDownload *download
		const gchar *destination_uri

gdouble
webkit_download_get_progress (download)
		WebKitDownload *download

gdouble
webkit_download_get_elapsed_time (download)
		WebKitDownload *download

guint64
webkit_download_get_total_size (download)
		WebKitDownload *download

guint64
webkit_download_get_current_size (download)
		WebKitDownload *download

WebKitDownloadStatus
webkit_download_get_status (download)
		WebKitDownload *download
