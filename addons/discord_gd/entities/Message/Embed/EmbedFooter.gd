# Represents a Discord embed footer
class_name EmbedFooter extends DiscordDataclass

var text: String # Footer text
var icon_url = null # [String] Url of footer icon (only supports http(s) and attachments) `optional`
var proxy_icon_url = null # [String] A proxied url of footer icon `optional`


# @hidden
func _init().("EmbedFooter"): return self
