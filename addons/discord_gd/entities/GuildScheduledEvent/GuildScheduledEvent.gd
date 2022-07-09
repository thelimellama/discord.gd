# Represents a Discord guild scheduled event
#
# The following table shows requirements based on current entity type:
#
# |ENTITY TYPE | CHANNEL_ID | ENTITY_METADATA | SCHEDULED_END_TIME |
# | ------------|------------|----------------|--------------------|
# | STAGE_INSTANCE | value | `null` | no restriction |
# | VOICE | value | `null` | no restriction |
# | EXTERNAL | `null` | non-null location | value |
class_name GuildScheduledEvent extends DiscordDataclass

var id: String # The id of the scheduled event
var guild_id: String # The guild id which the scheduled event belongs to
var channel_id = null # [String] The channel id in which the scheduled event will be hosted, or null if `entity_type` is EXTERNAL `optional` `nullable`
var creator_id = null # [String] The id of the user that created the scheduled event `optional` `nullable`
var name: String # The name of the scheduled event (1-100 characters)
var description = null # [String] The description of the scheduled event (1-1000 characters) `optional` `nullable`
var scheduled_start_time: String # The time the scheduled event will start
var scheduled_end_time = null # [String] The time the scheduled event will end, required if `entity_type` is EXTERNAL `optional` `nullable`
var privacy_level: int # [GuildScheduledEventPrivacyLevel] The privacy level of the scheduled event
var status: int # [GuildScheduledEventStatus] The status of the scheduled event
var entity_type: int # [GuildScheduledEventEntityTypes] The type of the scheduled event
var entity_id = null # [String] The id of an entity associated with a guild scheduled event `nullable`
var entity_metadata = null # [GuildScheduledEventEntityMetadata] Additional metadata for the guild scheduled event `optional` `nullable`
var creator = null # [User] The user that created the scheduled event `optional`
var user_count = null # [int] The number of users subscribed to the scheduled event `optional`
var image = null # [String] The cover image hash of the scheduled event `optional` `nullable`

var sku_ids = null # [Array] (Undocumented) `optional`

# @hidden
func _init().("GuildScheduledEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("entity_metadata") and p_dict.entity_metadata != null:
		entity_metadata = GuildScheduledEventEntityMetadata.new().from_dict(p_dict.entity_metadata)
	if p_dict.has("creator"):
		creator = User.new().from_dict(p_dict.creator)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "entity_metadata")
	DiscordUtils.try_dataclass_to_dict(dict, "user")

	return dict
