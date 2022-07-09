# Params for create guild emoji
class_name CreateGuildEmojiParams extends DiscordDataclass


var name: String # Name of the emoji
var image: String # The 128x128 emoji image (Data URI scheme encoded)
var roles: Array # [Array] of [String] Ids of roles allowed to use this emoji


# @hidden
func _init().("CreateGuildEmojiParams"): return self
