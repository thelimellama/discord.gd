# Represents a Discord guild preview
class_name GuildPreview extends DiscordDataclass

var id: String # Guild id
var name: String # Guild name (2-100 characters)
var icon = null # [String] Icon hash `nullable`
var splash = null # [String] Splash hash `nullable`
var discovery_splash = null # [String] Discovery splash hash `nullable`
var emojis: Array # [Array] of [Emoji] Custom guild emojis
var features: Array # [Array] of [GuildFeatures] Enabled guild features
var approximate_member_count: int # Approximate number of members in this guild
var approximate_presence_count: int # Approximate number of online members in this guild
var description = null # [String] The description for the guild `nullable`
var stickers: Array # [Array] of [Sticker] Custom guild stickers


# @hidden
func _init().("GuildPreview"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("emojis"):
		emojis = []
		for data in p_dict.emojis:
			emojis.append(Emoji.new().from_dict(data))
	if p_dict.has("stickers"):
		stickers = []
		for data in p_dict.stickers:
			stickers.append(Sticker.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "emojis")
	DiscordUtils.try_array_dataclass_to_dict(dict, "stickers")

	return dict

