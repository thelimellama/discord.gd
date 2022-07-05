# Represents a Discord audit log
#
# Audit logs are created by Discord when an administrative action is performed in a guild. Viewing audit logs requires the `VIEW_AUDIT_LOG` permission.
class_name AuditLog extends Dataclass

var audit_log_entries: Array # [Array] of [AuditLogEntry] List of audit log entries, sorted from most to least recent
var auto_moderation_rules: Array # [Array] of [AutoModerationRule] List of auto moderation rules referenced in the audit log
var guild_scheduled_events: Array # [Array] of [GuildScheduledEvent] List of guild scheduled events referenced in the audit log
var integrations: Array # [Array] of partial [Integration] List of partial integration objects
var threads: Array # [Array] of thread-specific [Channel] List of threads referenced in the audit log
var users: Array # [Array] of [User] List of users referenced in the audit log
var webhooks: Array # [Array] of [Webhook] List of webhooks referenced in the audit log


# @hidden
func _init().("AuditLog"): return self

func from_dict(p_dict: Dictionary):
	audit_log_entries = []
	if p_dict.has("audit_log_entries"):
		for data in p_dict.audit_log_entries:
			audit_log_entries.append(AuditLogEntry.new().from_dict(data))

	auto_moderation_rules = []
	if p_dict.has("auto_moderation_rules"):
		for data in p_dict.auto_moderation_rules:
			auto_moderation_rules.append(AutoModerationRule.new().from_dict(data))

	guild_scheduled_events = []
	if p_dict.has("guild_scheduled_events"):
		for data in p_dict.guild_scheduled_events:
			guild_scheduled_events.append(GuildScheduledEvent.new().from_dict(data))

	integrations = []
	if p_dict.has("integrations"):
		for data in p_dict.integrations:
			integrations.append(Integration.new().from_dict(data))

	threads = []
	if p_dict.has("threads"):
		for data in p_dict.threads:
			threads.append(Channel.new().from_dict(data))

	users = []
	if p_dict.has("users"):
		for data in p_dict.users:
			print("has users : ", data)
			users.append(User.new().from_dict(data))

	webhooks = []
	if p_dict.has("webhooks"):
		for data in p_dict.webhooks:
			webhooks.append(Webhook.new().from_dict(data))

	return self
