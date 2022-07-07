# Params for create guild auto moderation rule
class_name CreateChannelInvite extends Dataclass

var max_age = null # [int] Duration of invite in seconds before expiry, or 0 for never. between 0 and 604800 (7 days) (default is 86400 (24 hours))
var max_uses = null # [int] Max number of uses or 0 for unlimited. between 0 and 100 (default is 0)
var temporary = null # [bool] Whether this invite only grants temporary membership false
var unique = null # [bool] If true, don't try to reuse a similar invite (useful for creating many unique one time use invites) (default is false)
var target_type = null # [InviteTargetTypes] The type of target for this voice channel invite
var target_user_id = null # [String] The id of the user whose stream to display for this invite, required if `target_type` is 1, the user must be streaming in the channel
var target_application_id = null # [String] The id of the embedded application to open for this invite, required if `target_type` is 2, the application must have the `EMBEDDED` flag


# @hidden
func _init().("CreateChannelInvite", {include_null_in_dict = false}): return self
