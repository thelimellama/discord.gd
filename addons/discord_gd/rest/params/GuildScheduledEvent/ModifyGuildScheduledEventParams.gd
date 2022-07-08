# Params for modify guild scheduled event
class_name ModifyGuildScheduledEventParams extends Dataclass

var channel_id = null setget __set_channel_id # [String] The channel id of the scheduled event, set to null if changing entity type to `EXTERNAL`
var entity_metadata = null setget __set_entity_metadata # [GuildScheduledEventEntityMetadata] The entity metadata of the scheduled event
var name = null # [String] The name of the scheduled event
var privacy_level = null # [GuildScheduledEventPrivacyLevel] The privacy level of the scheduled event
var scheduled_start_time = null # [String] The time to schedule the scheduled event
var scheduled_end_time = null # [String] The time when the scheduled event is scheduled to end
var description = null setget __set_description # [String] The description of the scheduled event
var entity_type = null # [GuildScheduledEventEntityType] The entity type of the scheduled event
var status = null # [GuildScheduledEventEntityStatus] The status of the scheduled event
var image = null # [String] the cover image of the scheduled event (Data URI scheme encoded)

var __set_props = {} # @hidden


# @hidden
func _init().("ModifyGuildScheduledEventParams", {include_null_in_dict = false, print_exclude = ["__set_props"]}): return self


func __set_channel_id(p_channel_id):
	__set_props.channel_id = true
	channel_id = p_channel_id


func __set_entity_metadata(p_entity_metadata):
	__set_props.entity_metadata = true
	entity_metadata = p_entity_metadata


func __set_description(p_description):
	__set_props.description = true
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
	var set_props = __set_props.keys()
	for prop in set_props: dict[prop] = get(prop)
	dict = dict.duplicate(true)
	dict.erase("__set_props")

	if dict.has("entity_metadata") and dict.entity_metadata != null:
		dict.entity_metadata = dict.entity_metadata.to_dict()


	return dict
