# Represents a Discord allowed mention
class_name AllowedMention extends Dataclass

var parse = null # [Array] of [AllowedMentionTypes] An array of allowed mention types to parse from the content
var roles = null # [Array] of [String] List of role ids to mention (Max size of 100)
var users = null # [Array] of [String] List of user ids to mention (Max size of 100)
var replied_user = null # [bool] For replies, whether to mention the author of the message being replied to (default false)

# @hidden
func _init().("AllowedMention"): return self
