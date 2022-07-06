# Represents a Discord attachment
class_name Attachment extends Dataclass

var id: String # Id of the attachment
var filename: String # Name of file attached
var description = null # [String] Description for the file
var content_type = null # [String] The attachment's media type
var size: int # Size of file in bytes
var url: String	# Source url of file
var proxy_url: String # A proxied url of file
var height = null # [int] Height of file (if image)
var width = null # [int] Width of file (if image)
var ephemeral = null # [bool] Whether this attachment is ephemeral


# @hidden
func _init().("Attachment"): return self
