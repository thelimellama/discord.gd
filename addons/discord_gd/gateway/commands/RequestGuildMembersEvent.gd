# Represents a Discord request guild members event
#
# You need to specify one of `query` or `user_ids`
#
# If `query` is specified `limit` also needs to be specified
class_name RequestGuildMembersEvent extends DiscordDataclass

var guild_id: String # Id of the guild to get members for
var query = null # [String] String that username starts with, or an empty string to return all members `optional`
var limit = null # [int] Maximum number of members to send matching the `query`; a limit of `0` can be used with an empty string `query` to return all members `optional`
var presences = null # [bool] Used to specify if we want the presences of the matched members `optional`
var user_ids = null # [Array] of [String] Used to specify which users you wish to fetch `optional`
var nonce = null # [String] Nonce to identify the Guild Members Chunk response	false `optional`


# @hidden
func _init().("RequestGuildMembersEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user_ids") and typeof(p_dict.user_ids) == TYPE_STRING:
		user_ids = [p_dict.user_ids]

	return self
