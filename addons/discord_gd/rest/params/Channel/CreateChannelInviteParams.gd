# Params for create create channel invite
class_name CreateChannelInviteParams extends DiscordDataclass

var max_age = null # [int] Duration of invite in seconds before expiry, or 0 for never. between 0 and 604800 (7 days) (default is 86400 (24 hours)) `optional`
var max_uses = null # [int] Max number of uses or 0 for unlimited. between 0 and 100 (default is 0) `optional`
var temporary = null # [bool] Whether this invite only grants temporary membership false `optional`
var unique = null # [bool] If true, don't try to reuse a similar invite (useful for creating many unique one time use invites) (default is false) `optional`
var target_type = null # [InviteTargetTypes] The type of target for this voice channel invite `optional`
var target_user_id = null # [String] The id of the user whose stream to display for this invite, required if `target_type` is 1, the user must be streaming in the channel `optional`
var target_application_id = null # [String] The id of the embedded application to open for this invite, required if `target_type` is 2, the application must have the `EMBEDDED` flag `optional`


# @hidden
func _init().("CreateChannelInviteParams"): return self
