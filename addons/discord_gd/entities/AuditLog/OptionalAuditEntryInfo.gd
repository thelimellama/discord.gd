# Represents a Discord optional audit entry info
class_name OptionalAuditEntryInfo extends DiscordDataclass

var application_id = null # [String] Id of the app whose permissions were targeted `optional`
var channel_id = null # [String] Channel in which the entities were targeted `optional`
var count = null # [String] Number of entities that were targeted `optional`
var delete_member_days = null # [String] Number of days after which inactive members were kicked `optional`
var id = null # [String] Id of the overwritten entity `optional`
var members_removed = null # [String] Number of members removed by the prune `optional`
var message_id = null # [String] Id of the message that was targeted `optional`
var role_name = null # [String] Name of the role if type is "0" (not present if type is "1") `optional`
var type = null # [String] Type of overwritten entity - role ("0") or member ("1") `optional`


# @hidden
func _init().("OptionalAuditEntryInfo"): return self
