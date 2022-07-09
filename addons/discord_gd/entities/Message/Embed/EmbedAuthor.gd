# Represents a Discord embed author
class_name EmbedAuthor extends DiscordDataclass

var name: String # Name of author
var url = null # [String] Url of author `optional`
var icon_url = null # [String] Url of author icon (only supports http(s) and attachments) `optional`
var proxy_icon_url = null # [String] A proxied url of author icon `optional`


# @hidden
func _init().("EmbedAuthor"): return self
