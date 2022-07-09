# Represents a Discord connection that a user has attached
class_name UserConnection extends DiscordDataclass

var id: String # Id of the connection account
var name: String # The username of the connection account
var type: String # The service of the connection (twitch, youtube)
var revoked = null # [bool] Whether the connection is revoked `optional`
var integrations = null # [Array] of partial [Integration] `optional`
var verified: bool # Whether the connection is verified
var friend_sync: bool # Whether friend sync is enabled for this connection
var show_activity: bool # Whether activities related to this connection will be shown in presence updates
var visibility: int # [UserConnectionVisibilityTypes] Visibility of this connection


# @hidden
func _init().("UserConnection"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("integrations"):
		integrations = []
		for data in p_dict.integrations:
			integrations.append(Integration.new().from_dict(data))

	return self


# @hidden
func to_dict() ->Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "integrations")

	return dict
