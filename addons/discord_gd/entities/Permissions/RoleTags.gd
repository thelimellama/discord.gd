# Represents a Discord role tags
class_name RoleTags extends Dataclass

var bot_id = null # [String] The id of the bot this role belongs to
var integration_id = null # [String] The id of the integration this role belongs to
var premium_subscriber = null # [bool] Whether this is the guild's premium subscriber role


# @hidden
func _init().("RoleTags"): return self
