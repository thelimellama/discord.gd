# Params for create template from guild
class_name CreateTemplateFromGuildParams extends DiscordDataclass

var name: String # Name of the template (1-100 characters)
var description = null setget __set_description # [String] Description of the template (0-120 characters) `optional`


# @hidden
func _init().("CreateTemplateFromGuildParams"): return self

func __set_description(p_description):
	__options__.set_props.description = true
	description = p_description
