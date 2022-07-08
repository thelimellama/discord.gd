# Params for modify guild template
class_name ModifyGuildTemplateParams extends Dataclass

var name: String # Name of the template (1-100 characters)
var description = null setget __set_description # [String] Description of the template (0-120 characters)

var __set_props = {} # @hidden

# @hidden
func _init().("ModifyGuildTemplateParams", {include_null_in_dict = false}): return self


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
