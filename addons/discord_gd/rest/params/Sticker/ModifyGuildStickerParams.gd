# Params for modify guild sticker
class_name ModifyGuildStickerParams extends Dataclass


var name = null # [String] Name of the sticker (2-30 characters)
var description = null setget __set_description # [String] Description of the sticker (2-100 characters)
var tags = null # [String] Autocomplete/suggestion tags for the sticker (max 200 characters)

var __set_props = {} # @hidden


# @hidden
func _init().("ModifyGuildStickerParams", {include_null_in_dict = false, print_exclude = ["__set_props"]}): return self


func __set_description(p_description):
	__set_props.description = true
	description = p_description


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()
	var set_props = __set_props.keys()
	for prop in set_props: dict[prop] = get(prop)
	dict = dict.duplicate(true)
	dict.erase("__set_props")

	return dict
