# Params for modify guild emoji
class_name ModifyGuildEmojiParams extends Dataclass


var name: String # Name of the emoji
var roles: Array # [Array] of [String] Ids of roles allowed to use this emoji


# @hidden
func _init().("ModifyGuildEmojiParams", {include_null_in_dict = false}): return self
