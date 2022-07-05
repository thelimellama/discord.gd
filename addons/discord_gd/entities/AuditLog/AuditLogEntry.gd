# Represents a Discord audit log entry
#
# Each audit log entry represents a single administrative action (or event) indicated by `action_type`.
class_name AuditLogEntry extends Dataclass

var target_id = null # [String] ID of the affected entity (webhook, user, role, etc.)
var changes = null # [Array] of [AuditLogChange] Changes made to the target_id
var user_id = null # [String] User or app that made the changes
var id: String # ID of the entry
var action_type: int # [AuditLogEvent] Type of action that occurred
var options = null # [OptionalAuditEntryInfo] Additional info for certain event types
var reason = null # [String] Reason for the change (1-512 characters)


# @hidden
func _init().("AuditLogEntry"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	changes = []
	if p_dict.has("changes"):
		for data in p_dict.changes:
			changes.append(AuditLogChange.new().from_dict(data))
	if p_dict.has("options"):
		options = OptionalAuditEntryInfo.new().from_dict(p_dict.options)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	if dict.has("changes"):
		for i in dict.changes.size():
			dict.changes[i] = changes[i].to_dict()
	if dict.has("options"):
		for i in dict.options.size():
			dict.options[i] = options[i].to_dict()

	return dict