# Represents a Discord guild template
class_name GuildTemplate extends Dataclass

var code: String # The template code (unique Id)
var name: String # Template name
var description = null # [String] The description for the template
var usage_count: int # Number of times this template has been used
var creator_id: String # The Id of the user who created the template
var creator: User # [User] The user who created the template
var created_at: String # When this template was created
var updated_at: String # When this template was last synced to the source guild
var source_guild_id: String # The Id of the guild this template is based on
var serialized_source_guild: Guild # partial [Guild] The guild snapshot this template contains
var is_dirty = null # [bool] Whether the template has unsynced changes


# @hidden
func _init().("GuildTemplate"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("creator"):
		creator = User.new().from_dict(p_dict.creator)
	if p_dict.has("serialized_source_guild"):
		serialized_source_guild = Guild.new().from_dict(p_dict.serialized_source_guild)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("creator"):
		dict.creator = dict.creator.to_dict()
	if dict.has("serialized_source_guild"):
		dict.serialized_source_guild = dict.serialized_source_guild.to_dict()

	return dict
