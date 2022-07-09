# Helpers for formatting Discord ids in messages
class_name DiscordFormatting

const TimestampStyles = {
	SHORT_DATE_TIME = "f", # 20 April 2021 16:20 (default)
	SHORT_TIME = "t", # 16:20
	LONG_TIME = "T", # 16:20:30
	SHORT_DATE = "d", # 20/04/2021
	LONG_DATE = "D", # 20 April 2021
	LONG_DATE_TIME = "F", # Tuesday, 20 April 2021 16:20
	RELATIVE_TIME = "R", # 2 months ago
}

# Formats a user id
static func format_user(p_user_id: String) -> String:
	return "<@%s>" % p_user_id

# Formats a channel id
static func format_channel(p_channel_id: String) -> String:
	return "<#%s>" % p_channel_id


# Formats a role id
static func format_role(p_role_id: String) -> String:
	return "<@&%s>" % p_role_id


# Formats a custom emoji name, id
static func format_custom_emoji(p_name: String, p_id: String) -> String:
	return "<:%s:%s>" % [p_name, p_id]


# Formats an animated custom emoji name, id
static func format_custom_emoji_animated(p_name: String, p_id: String) -> String:
	return "<a:%s:%s>" % [p_name, p_id]


# Formats a unix timestamp (with optional style [TimestampStyles])
static func format_unix_timestamp(p_unix_timestamp: String, p_style = TimestampStyles.SHORT_DATE_TIME) -> String:
	return "<t:%s:%s>" % [p_unix_timestamp, p_style]
