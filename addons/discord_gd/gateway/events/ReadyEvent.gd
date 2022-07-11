# Represents a Discord ready event
class_name ReadyEvent extends Dataclass

var v: int # API version
var user: User # [User] Information about the user including email
var guilds: Array # [Array] of unavailable [Guild] The guilds the user is in (Only ids)
var session_id: String # Used for resuming connections
var shard = null # [Array] of two integers [shard_id, num_shards] The shard information associated with this session, if sent when identifying
var application: Application # [Application] Contains id and flags

# @hidden
func _init().("ReadyEvent"): return self

# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)
	if p_dict.has("guilds"):
		guilds = []
		for data in p_dict.guilds:
			guilds.append(Guild.new().from_dict(data))
	if p_dict.has("application"):
		application = Application.new().from_dict(p_dict.user)

	return self

# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "user")
	DiscordUtils.try_dataclass_to_dict(dict, "application")
	DiscordUtils.try_array_dataclass_to_dict(dict, "guilds")


	return dict
