# Represents a Discord guild members chunk event
class_name GuildMembersChunkEvent extends Dataclass

var guild_id: String # The id of the guild
var members: Array # [Array] of [GuildMember] Set of guild members
var chunk_index: int # The chunk index in the expected chunks for this response (0 <= chunk_index < chunk_count)
var chunk_count: int # The total number of expected chunks for this response
var not_found = null # [Array] if passing an invalid id to `REQUEST_GUILD_MEMBERS`, it will be returned here `optional`
var presences = null # [Array] of [PresenceUpdateEvent] If passing true to `REQUEST_GUILD_MEMBERS`, presences of the returned members will be here `optional`
var nonce = null # string The nonce used in the `REQUEST_GUILD_MEMBERS` `optional`

# @hidden
func _init().("GuildMembersChunkEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("members"):
		members = []
		for data in p_dict.members:
			members.append(GuildMember.new().from_dict(data))
	if p_dict.has("presences"):
		presences = []
		for data in p_dict.presences:
			presences.append(PresenceUpdateEvent.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "members")
	DiscordUtils.try_array_dataclass_to_dict(dict, "presences")

	return dict
