# Represents a bitfield of Discord application flags
#
# `GATEWAY_PRESENCE`: Intent required for bots in 100 or more servers to receive presence_update events
#
# `GATEWAY_PRESENCE_LIMITED`: Intent required for bots in under 100 servers to receive presence_update events, found in Bot Settings
#
# `GATEWAY_GUILD_MEMBERS`: Intent required for bots in 100 or more servers to receive member-related events like guild_member_add. See list of member-related events under GUILD_MEMBERS
#
# `GATEWAY_GUILD_MEMBERS_LIMITED`: Intent required for bots in under 100 servers to receive member-related events like guild_member_add, found in Bot Settings. See list of member-related events under GUILD_MEMBERS
#
# `VERIFICATION_PENDING_GUILD_LIMIT`: Indicates unusual growth of an app that prevents verification
#
# `EMBEDDED`: Indicates if an app is embedded within the Discord client (currently unavailable publicly)
#
# `GATEWAY_MESSAGE_CONTENT`: Intent required for bots in 100 or more servers to receive message content
#
# `GATEWAY_MESSAGE_CONTENT_LIMITED`: Intent required for bots in under 100 servers to receive message content, found in Bot Settings
class_name ApplicationFlags extends BitField


# Default bit = 0
var default_bit = 0

enum FLAGS {
	GATEWAY_PRESENCE = 1 << 12,
	GATEWAY_PRESENCE_LIMITED = 1 << 13,
	GATEWAY_GUILD_MEMBERS = 1 << 14,
	GATEWAY_GUILD_MEMBERS_LIMITED = 1 << 15,
	VERIFICATION_PENDING_GUILD_LIMIT = 1 << 16,
	EMBEDDED = 1 << 17,
	GATEWAY_MESSAGE_CONTENT = 1 << 18,
	GATEWAY_MESSAGE_CONTENT_LIMITED = 1 << 19,
}


# @hidden
func _init(bits = default_bit).(bits): return self
