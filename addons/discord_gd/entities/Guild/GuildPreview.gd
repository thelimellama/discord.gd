# Represents a Discord guild preview
class_name GuildPreview extends Dataclass

var id: String # Guild Id
var name: String # Guild name (2-100 characters)
var icon = null # [String] Icon hash
var splash = null # [String] Splash hash
var discovery_splash = null # [String] Discovery splash hash
var emojis: Array # [Array] of [Emoji] Custom guild emojis
var features: Array # [Array] of [GuildFeatures] Enabled guild features
var approximate_member_count: int # Approximate number of members in this guild
var approximate_presence_count: int # Approximate number of online members in this guild
var description = null # [String] The description for the guild
var stickers: Array # [Array] of [Sticker] Custom guild stickers


# @hidden
func _init().("GuildPreview"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	emojis = []
	if p_dict.has("emojis"):
		for data in p_dict.emojis:
			emojis.append(Emoji.new().from_dict(data))
	stickers = []
	if p_dict.has("stickers"):
		for data in p_dict.stickers:
			stickers.append(Sticker.new().from_dict(data))
	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("emojis"):
		for i in dict.emojis.size():
			dict.emojis[i] = dict.emojis[i].to_dict()
	if dict.has("stickers"):
		for i in dict.stickers.size():
			dict.stickers[i] = dict.stickers[i].to_dict()

	return dict

