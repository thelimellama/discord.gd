# Represents a Discord StickerPack
class_name StickerPack extends DiscordDataclass

var id: String # Id of the sticker pack
var stickers: Array # [Array] of [Sticker] The stickers in the pack
var name: String # Name of the sticker pack
var sku_id: String # Id of the pack's SKU
var cover_sticker_id = null # [String] Id of a sticker in the pack which is shown as the pack's icon `optional`
var description: String # Description of the sticker pack
var banner_asset_id = null # [String] Id of the sticker pack's banner image `optional`


# @hidden
func _init().("StickerPack"): return self


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
