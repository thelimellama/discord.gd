# Represents a Discord Sticker
class_name Sticker extends Dataclass

var id: String # Id of the sticker
var pack_id = null # [String] For standard stickers, id of the pack the sticker is from
var name: String # Name of the sticker
var description = null # [String] Description of the sticker
var tags: String # Autocomplete / suggestion tags for the sticker (max 200 characters)
var type: int # [StickerTypes] Type of sticker
var format_type: int # [StickerFormatTypes] Type of sticker format
var available = null #[bool] Whether this guild sticker can be used, may be false due to loss of Server Boosts
var guild_id = null # [String] Id of the guild that owns this sticker
var user = null # [User] The user that uploaded the guild sticker
var sort_value = null # [int] The standard sticker's sort order within its pack

var asset = null # [String] (Undocumented)

# @hidden
func _init().("Sticker"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("user"):
		dict.user = dict.user.to_dict()

	return dict
