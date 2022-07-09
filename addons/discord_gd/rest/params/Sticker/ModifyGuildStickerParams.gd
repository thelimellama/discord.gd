# Params for modify guild sticker
class_name ModifyGuildStickerParams extends DiscordDataclass


var name = null # [String] Name of the sticker (2-30 characters) `optional`
var description = null setget __set_description # [String] Description of the sticker (2-100 characters) `optional` `nullable`
var tags = null # [String] Autocomplete/suggestion tags for the sticker (max 200 characters) `optional`


# @hidden
func _init().("ModifyGuildStickerParams"): return self


func __set_description(p_description):
	__options__.set_props.description = true
	description = p_description
