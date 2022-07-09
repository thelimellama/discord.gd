# Represents a Discord audit log entry
#
# Each audit log entry represents a single administrative action (or event) indicated by `action_type`.
class_name AuditLogEntry extends DiscordDataclass

var target_id = null # [String] Id of the affected entity (webhook, user, role, etc) `nullable`
var changes = null # [Array] of [AuditLogChange] Changes made to the target_id `optional`
var user_id = null # [String] User or app that made the changes `nullable`
var id: String # Id of the entry
var action_type: int # [AuditLogEvent] Type of action that occurred
var options = null # [OptionalAuditEntryInfo] Additional info for certain event types `optional`
var reason = null # [String] Reason for the change (1-512 characters) `optional`


# @hidden
func _init().("AuditLogEntry"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("changes"):
		changes = []
		for data in p_dict.changes:
			changes.append(AuditLogChange.new().from_dict(data))
	if p_dict.has("options"):
		options = OptionalAuditEntryInfo.new().from_dict(p_dict.options)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "changes")
	DiscordUtils.try_dataclass_to_dict(dict, "options")

	return dict
