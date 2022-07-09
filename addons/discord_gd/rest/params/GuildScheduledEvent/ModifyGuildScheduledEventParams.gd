# Params for modify guild scheduled event
class_name ModifyGuildScheduledEventParams extends DiscordDataclass

var channel_id = null setget __set_channel_id # [String] The channel id of the scheduled event, set to null if changing entity type to `EXTERNAL` `optional` `nullable`
var entity_metadata = null setget __set_entity_metadata # [GuildScheduledEventEntityMetadata] The entity metadata of the scheduled event `optional` `nullable`
var name = null # [String] The name of the scheduled event `optional`
var privacy_level = null # [GuildScheduledEventPrivacyLevel] The privacy level of the scheduled event `optional`
var scheduled_start_time = null # [String] The time to schedule the scheduled event `optional`
var scheduled_end_time = null # [String] The time when the scheduled event is scheduled to end `optional`
var description = null setget __set_description # [String] The description of the scheduled event `optional` `nullable`
var entity_type = null # [GuildScheduledEventEntityType] The entity type of the scheduled event `optional`
var status = null # [GuildScheduledEventEntityStatus] The status of the scheduled event `optional`
var image = null # [String] the cover image of the scheduled event (Data URI scheme encoded) `optional`

# @hidden
func _init().("ModifyGuildScheduledEventParams"): return self


func __set_channel_id(p_channel_id):
	__options__.set_props.channel_id = true
	channel_id = p_channel_id


func __set_entity_metadata(p_entity_metadata):
	__options__.set_props.entity_metadata = true
	entity_metadata = p_entity_metadata


func __set_description(p_description):
	__options__.set_props.description = true
	description = p_description


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("entity_metadata") and p_dict.entity_metadata != null:
		entity_metadata = GuildScheduledEventEntityMetadata.new().from_dict(p_dict.entity_metadata)


	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "entity_metadata")

	return dict
