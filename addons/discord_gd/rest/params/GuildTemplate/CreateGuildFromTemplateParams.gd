# Params for create guild from template
class_name CreateGuildFromTemplateParams extends Dataclass

var name: String # Name of the guild (2-100 characters)
var image = null # [String] 128x128 image for the guild icon (Data URI scheme encoded)


# @hidden
func _init().("CreateGuildFromTemplateParams", {include_null_in_dict = false}): return self
