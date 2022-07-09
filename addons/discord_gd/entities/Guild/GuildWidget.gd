# Represents a Discord guild widget
class_name GuildWidget extends DiscordDataclass

var id: String # Guild id
var name: String # Guild name (2-100 characters)
var instant_invite = null # [String] Instant invite for the guilds specified widget invite channel `nullable`
var channels: Array # [Array] of partial [Channel] Voice and stage channels which are accessible by `@everyone`
var members: Array # [Array] of partial [User] Special widget user objects that includes users presence (Limit 100)
var presence_count: int # Number of online members in this guild


# @hidden
func _init().("GuildWidget"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("channels"):
		channels = []
		for data in p_dict.channels:
			channels.append(Channel.new().from_dict(data))
	if p_dict.has("members"):
		members = []
		for data in p_dict.members:
			members.append(User.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "channels")
	DiscordUtils.try_array_dataclass_to_dict(dict, "members")


	return dict
