# Represents a Discord audit log
#
# Audit logs are created by Discord when an administrative action is performed in a guild. Viewing audit logs requires the `VIEW_AUDIT_LOG` permission.
class_name AuditLog extends DiscordDataclass

var audit_log_entries: Array # [Array] of [AuditLogEntry] List of audit log entries, sorted from most to least recent
var auto_moderation_rules: Array # [Array] of [AutoModerationRule] List of auto moderation rules referenced in the audit log
var guild_scheduled_events: Array # [Array] of [GuildScheduledEvent] List of guild scheduled events referenced in the audit log
var integrations: Array # [Array] of partial [Integration] List of partial integration objects
var threads: Array # [Array] of thread-specific [Channel] List of threads referenced in the audit log
var users: Array # [Array] of [User] List of users referenced in the audit log
var webhooks: Array # [Array] of [Webhook] List of webhooks referenced in the audit log


# @hidden
func _init().("AuditLog"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	if p_dict.has("audit_log_entries"):
		audit_log_entries = []
		for data in p_dict.audit_log_entries:
			audit_log_entries.append(AuditLogEntry.new().from_dict(data))
	if p_dict.has("auto_moderation_rules"):
		auto_moderation_rules = []
		for data in p_dict.auto_moderation_rules:
			auto_moderation_rules.append(AutoModerationRule.new().from_dict(data))
	if p_dict.has("guild_scheduled_events"):
		guild_scheduled_events = []
		for data in p_dict.guild_scheduled_events:
			guild_scheduled_events.append(GuildScheduledEvent.new().from_dict(data))
	if p_dict.has("integrations"):
		integrations = []
		for data in p_dict.integrations:
			integrations.append(Integration.new().from_dict(data))
	if p_dict.has("threads"):
		threads = []
		for data in p_dict.threads:
			threads.append(Channel.new().from_dict(data))
	if p_dict.has("users"):
		users = []
		for data in p_dict.users:
			users.append(User.new().from_dict(data))
	if p_dict.has("webhooks"):
		webhooks = []
		for data in p_dict.webhooks:
			webhooks.append(Webhook.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "audit_log_entries")
	DiscordUtils.try_array_dataclass_to_dict(dict, "auto_moderation_rules")
	DiscordUtils.try_array_dataclass_to_dict(dict, "guild_scheduled_events")
	DiscordUtils.try_array_dataclass_to_dict(dict, "integrations")
	DiscordUtils.try_array_dataclass_to_dict(dict, "threads")
	DiscordUtils.try_array_dataclass_to_dict(dict, "users")
	DiscordUtils.try_array_dataclass_to_dict(dict, "webhooks")

	return dict
