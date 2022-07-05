# Represents a Discord optional audit entry info
class_name OptionalAuditEntryInfo extends Dataclass

var application_id = null # [String] ID of the app whose permissions were targeted
var channel_id = null # [String] Channel in which the entities were targeted
var count = null # [String] Number of entities that were targeted
var delete_member_days = null # [String] Number of days after which inactive members were kicked
var id = null # [String] ID of the overwritten entity
var members_removed = null # [String] Number of members removed by the prune
var message_id = null # [String] ID of the message that was targeted
var role_name = null # [String] Name of the role if type is "0" (not present if type is "1")
var type = null # [String] Type of overwritten entity - role ("0") or member ("1")


# @hidden
func _init().("OptionalAuditEntryInfo"): return self
