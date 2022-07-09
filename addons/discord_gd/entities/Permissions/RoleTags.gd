# Represents a Discord role tags
class_name RoleTags extends DiscordDataclass

var bot_id = null # [String] The id of the bot this role belongs to `optional`
var integration_id = null # [String] The id of the integration this role belongs to `optional`
var premium_subscriber = null # [bool] Whether this is the guild's premium subscriber role `optional`


# @hidden
func _init().("RoleTags"): return self
