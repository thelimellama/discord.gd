# Represents a bitfield of Discord system channel flags
#
# `SUPPRESS_JOIN_NOTIFICATIONS`: Suppress member join notifications
#
# `SUPPRESS_PREMIUM_SUBSCRIPTIONS`: Suppress server boost notifications
#
# `SUPPRESS_GUILD_REMINDER_NOTIFICATIONS`: Suppress server setup tips
#
# `SUPPRESS_JOIN_NOTIFICATION_REPLIES`: Hide member join sticker reply buttons
class_name SystemChannelFlags extends BitField


# Default bit = 0
var default_bit = 0

enum FLAGS {
	NONE = 0,
	SUPPRESS_JOIN_NOTIFICATIONS = 1 << 0,
	SUPPRESS_PREMIUM_SUBSCRIPTIONS = 1 << 1,
	SUPPRESS_GUILD_REMINDER_NOTIFICATIONS = 1 << 2,
	SUPPRESS_JOIN_NOTIFICATION_REPLIES = 1 << 3,
}


# @hidden
func _init(bits = default_bit).("SystemChannelFlags", bits): return self
