# Params for create guild scheduled event
class_name CreateGuildScheduledEventParams extends Dataclass

var channel_id = null # [String] The channel id of the scheduled event
var entity_metadata = null # [GuildScheduledEventEntityMetadata] The entity metadata of the scheduled event
var name: String # The name of the scheduled event
var privacy_level: int # [GuildScheduledEventPrivacyLevel] The privacy level of the scheduled event
var scheduled_start_time: String # The time to schedule the scheduled event
var scheduled_end_time = null # [String] The time when the scheduled event is scheduled to end
var description = null # [String] The description of the scheduled event
var entity_type: int # [GuildScheduledEventEntityTypes] The entity type of the scheduled event
var image = null # [String] The cover image of the scheduled event (Data URI scheme encoded)


# @hidden
func _init().("CreateGuildScheduledEventParams", {include_null_in_dict = false}): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("entity_metadata") and p_dict.entity_metadata != null:
		entity_metadata = GuildScheduledEventEntityMetadata.new().from_dict(p_dict.entity_metadata)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("entity_metadata") and dict.entity_metadata != null:
		dict.entity_metadata = dict.entity_metadata.to_dict()

	return dict
