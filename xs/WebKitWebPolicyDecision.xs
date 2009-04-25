#include "perl_webkit.h"

MODULE = Gtk2::WebKit::WebPolicyDecision	PACKAGE = Gtk2::WebKit::WebPolicyDecision	PREFIX = webkit_web_policy_decision_

PROTOTYPES: disable

void
webkit_web_policy_decision_use (decision)
		WebKitWebPolicyDecision *decision

void
webkit_web_policy_decision_ignore (decision)
		WebKitWebPolicyDecision *decision

void
webkit_web_policy_decision_download (decision)
		WebKitWebPolicyDecision *decision
