# Represents a Discord Invite
class_name Invite extends Dataclass

var code: String # The invite code (unique Id)
var guild = null # Partial [Guild] The guild this invite is for
var channel = null # Partial [Channel] The channel this invite is for
var inviter = null # [User] The user who created the invite
var type = null # (Undocumented)
var target_type = null # [InviteTargetTypes] The type of target for this voice channel invite
var target_user = null # [User] The user whose stream to display for this voice channel stream invite
var target_application = null # Partial [Application] The embedded application to open for this voice channel embedded application invite
var approximate_presence_count = null # [int] Approximate count of online members, returned from the GET /invites/<code> endpoint when with_counts is true
var approximate_member_count = null # [int] Approximate count of total members, returned from the GET /invites/<code> endpoint when with_counts is true
var expires_at = null # [String] The expiration date of this invite, returned from the GET /invites/<code> endpoint when with_expiration is true
var guild_scheduled_event = null # [GuildScheduledEvent] Guild scheduled event data, only included if `guild_scheduled_event_id` contains a valid guild scheduled event id

var uses = null # [int] Number of times this invite has been used
var max_uses = null # [int] Max number of times this invite can be used
var max_age = null # [int] Duration (in seconds) after which the invite expires
var temporary = null # [bool] Whether this invite only grants temporary membership
var created_at = null # [String] When this invite was created


# @hidden
func _init().("Invite"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("guild"):
		guild = Guild.new().from_dict(p_dict.guild)
	if p_dict.has("channel") and p_dict.channel != null:
		channel = Channel.new().from_dict(p_dict.channel)
	if p_dict.has("inviter") and p_dict.inviter != null:
		inviter = User.new().from_dict(p_dict.inviter)
	if p_dict.has("target_user") and p_dict.target_user != null:
		target_user = User.new().from_dict(p_dict.target_user)
	if p_dict.has("target_application") and p_dict.target_application != null:
		target_application = Application.new().from_dict(p_dict.target_application)
	if p_dict.has("guild_scheduled_event") and p_dict.guild_scheduled_event != null:
		guild_scheduled_event = GuildScheduledEvent.new().from_dict(p_dict.guild_scheduled_event)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("guild"):
		dict.guild = dict.guild.to_dict()
	if dict.has("channel") and dict.channel != null:
		dict.channel = dict.channel.to_dict()
	if dict.has("inviter"):
		dict.inviter = dict.inviter.to_dict()
	if dict.has("target_user"):
		dict.target_user = dict.target_user.to_dict()
	if dict.has("target_application"):
		dict.target_application = dict.target_application.to_dict()
	if dict.has("guild_scheduled_event"):
		dict.guild_scheduled_event = dict.guild_scheduled_event.to_dict()

	return dict

