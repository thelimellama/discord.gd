# Represents a Discord embed footer
class_name EmbedFooter extends Dataclass

var text: String # Footer text
var icon_url = null # [String] Url of footer icon (only supports http(s) and attachments)
var proxy_icon_url = null # [String] A proxied url of footer icon


# @hidden
func _init().("EmbedFooter"): return self
