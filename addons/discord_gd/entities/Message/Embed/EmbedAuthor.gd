# Represents a Discord embed author
class_name EmbedAuthor extends Dataclass

var name: String # Name of author
var url = null # [String] Url of author
var icon_url = null # [String] Url of author icon (only supports http(s) and attachments)
var proxy_icon_url = null # [String] A proxied url of author icon


# @hidden
func _init().("EmbedAuthor"): return self
