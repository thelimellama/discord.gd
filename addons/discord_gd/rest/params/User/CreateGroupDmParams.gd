# Params for create group dm
class_name CreateGroupDmParams extends DiscordDataclass


var access_tokens: Array # [Array] of [String] Access tokens of users that have granted your app the `gdm.join` scope
var nicks: Dictionary  # [Dictionary] A dictionary of user ids to their respective nicknames

# @hidden
func _init().("CreateGroupDmParams"): return self
