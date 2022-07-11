# Represents a Discord guild emojis update event
class_name GuildEmojisUpdateEvent extends Dataclass

var guild_id: String # Id of the guild
var emojis: Array # [Array] of [Emoji]

# @hidden
func _init().("GuildEmojisUpdateEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("emojis"):
		emojis = []
		for data in p_dict.emojis:
			emojis.append(Emoji.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "emojis")

	return dict
