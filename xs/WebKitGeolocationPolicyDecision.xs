#include "perl_webkit.h"

MODULE = Gtk2::WebKit::GeolocationPolicyDecision	PACKAGE = Gtk2::WebKit::GeolocationPolicyDecision	PREFIX = webkit_geolocation_policy_decision_

PROTOTYPES: disable

void
webkit_geolocation_policy_allow (decision)
	WebKitGeolocationPolicyDecision *decision

void
webkit_geolocation_policy_deny (decision)
	WebKitGeolocationPolicyDecision *decision
