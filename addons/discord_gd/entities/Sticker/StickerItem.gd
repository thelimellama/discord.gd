# Represents a Discord StickerItem
class_name StickerItem extends DiscordDataclass

var id: String # Id of the sticker
var name: String # Name of the sticker
var format_type: int # [StickerFormatTypes] Type of sticker format

# @hidden
func _init().("StickerItem"): return self
