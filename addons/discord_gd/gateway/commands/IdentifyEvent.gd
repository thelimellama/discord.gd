# Represents a Discord identify event
#
# Identify is sent during the initial handshake with the discord gateway and is partially used by the REST API
class_name IdentifyEvent extends DiscordDataclass

var token: String # Authentication token
var properties: IdentifyConnectionProperties # Connection properties like os, browser, and version
var compress = null # [bool] Whether this connection supports compression of packets (default is false) `optional`
var large_threshold = null # [int] Value between 50 and 250, total number of members where the gateway will stop sending offline members in the guild member list (default is 50) `optional`
var shard = null # [Array] of two integers [shard_id, num_shards] used for Guild Sharding `optional`
var presence = null # [UpdatePresenceEvent] Presence structure for initial presence information `optional`
var intents: GatewayIntents # The Gateway Intents you wish to receive


# @hidden
func _init().("IdentifyEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("properties"):
		properties = IdentifyConnectionProperties.new().from_dict(p_dict.properties)
	if p_dict.has("presence"):
		presence = UpdatePresenceEvent.new().from_dict(p_dict.presence)
	if p_dict.has("intents"):
		intents = GatewayIntents.new(p_dict.intents)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "properties")
	DiscordUtils.try_dataclass_to_dict(dict, "presence")
	DiscordUtils.try_bitfield_to_int(dict, "intents")

	return dict
