# Represents a Discord embed video
class_name EmbedVideo extends DiscordDataclass

var url = null # Source url of video `optional`
var proxy_url = null # [String]	A proxied url of the video `optional`
var height = null # [int] Height of video `optional`
var width = null # [int] Width of video `optional`


# @hidden
func _init().("EmbedVideo"): return self
