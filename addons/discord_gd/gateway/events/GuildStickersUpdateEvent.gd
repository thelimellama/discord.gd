# Represents a Discord guild stickers update event
class_name GuildStickersUpdateEvent extends Dataclass

var guild_id: String # Id of the guild
var stickers: Array # [Array] of [Sticker]

# @hidden
func _init().("GuildStickersUpdateEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("stickers"):
		stickers = []
		for data in p_dict.stickers:
			stickers.append(Sticker.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "stickers")

	return dict
