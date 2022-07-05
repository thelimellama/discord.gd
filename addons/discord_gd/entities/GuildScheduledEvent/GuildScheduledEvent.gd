# Represents a Discord guild scheduled event
class_name GuildScheduledEvent extends Dataclass

var id: String # The id of the scheduled event
var guild_id: String # The guild id which the scheduled event belongs to
var channel_id = null # [String] The channel id in which the scheduled event will be hosted, or null if `entity_type` is EXTERNAL
var creator_id = null # [String] The id of the user that created the scheduled event
var name: String # The name of the scheduled event (1-100 characters)
var description = null # [String] The description of the scheduled event (1-1000 characters)
var scheduled_start_time: String # The time the scheduled event will start
var scheduled_end_time = null # [String] The time the scheduled event will end, required if `entity_type` is EXTERNAL
var privacy_level: int # [GuildScheduledEventPrivacyLevel] The privacy level of the scheduled event
var status: int # [GuildScheduledEventStatus] The status of the scheduled event
var entity_type: int # [GuildScheduledEventEntityTypes] The type of the scheduled event
var entity_id = null # [String] The id of an entity associated with a guild scheduled event
var entity_metadata = null # [GuildScheduledEventEntityMetadata] Additional metadata for the guild scheduled event
var creator = null # [User] The user that created the scheduled event
var user_count = null # [int] The number of users subscribed to the scheduled event
var image = null # [String] The cover image hash of the scheduled event


# @hidden
func _init().("GuildScheduledEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("entity_metadata"):
		entity_metadata = GuildScheduledEventEntityMetadata.new().from_dict(p_dict.entity_metadata)
	if p_dict.has("creator"):
		creator = User.new().from_dict(p_dict.creator)

	return self
