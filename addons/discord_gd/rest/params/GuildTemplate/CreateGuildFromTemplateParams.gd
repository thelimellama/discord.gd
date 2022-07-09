# Params for create guild from template
class_name CreateGuildFromTemplateParams extends DiscordDataclass

var name: String # Name of the guild (2-100 characters)
var image = null # [String] 128x128 image for the guild icon (Data URI scheme encoded) `optional`


# @hidden
func _init().("CreateGuildFromTemplateParams"): return self
