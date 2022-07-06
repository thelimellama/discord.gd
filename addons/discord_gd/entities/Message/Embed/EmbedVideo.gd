# Represents a Discord embed video
class_name EmbedVideo extends Dataclass

var url = null # Source url of video
var proxy_url = null # [String]	A proxied url of the video
var height = null # [int] Height of video
var width = null # [int] Width of video


# @hidden
func _init().("EmbedVideo"): return self
