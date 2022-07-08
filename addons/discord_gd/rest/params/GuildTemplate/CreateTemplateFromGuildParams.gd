# Params for create template from guild
class_name CreateTemplateFromGuildParams extends Dataclass

var name: String # Name of the template (1-100 characters)
var description = null # [String] Description of the template (0-120 characters)


# @hidden
func _init().("CreateTemplateFromGuildParams", {include_null_in_dict = false}): return self
