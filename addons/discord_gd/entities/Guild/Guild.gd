# Represents a Discord Guild
class_name Guild extends DiscordDataclass

var id: String # Guild id
var name: String # Guild name (2-100 characters, excluding trailing and leading whitespace)
var icon = null # [String] Icon hash `nullable`
var icon_hash = null # [String] Icon hash, returned when in the template object `optional` `nullable`
var splash = null # [String] Splash hash `nullable`
var discovery_splash = null # [String] Discovery splash hash; only present for guilds with the `DISCOVERABLE` feature `nullable`
var owner = null # [bool] True if the user is the owner of the guild `optional`
var owner_id: String # Id of owner
var permissions = null # [Permissions] Total permissions for the user in the guild (excludes overwrites) `optional`
var region = null # [String] Voice region id for the guild (deprecated) `optional` `nullable`
var afk_channel_id = null # [String] Id of afk channel `nullable`
var afk_timeout: int # Afk timeout in seconds
var widget_enabled = null # [bool] True if the server widget is enabled `optional`
var widget_channel_id = null # [String] The channel id that the widget will generate an invite to, or null if set to no invite `optional` `nullable`
var verification_level: int # [GuildVerificationLevel] Verification level required for the guild
var default_message_notifications: int # [DefaultMessageNotificationLevel] Default message notifications level
var explicit_content_filter: int # [ExplicitContentFilterLevel] Explicit content filter level
var roles: Array # [Array] of [Role] Roles in the guild
var emojis: Array # [Array] of [Emoji] Custom guild emojis
var features: Array # [Array] of [GuildFeatures] Enabled guild features
var mfa_level: int # [MFALevel] Required MFA level for the guild
var application_id = null # [String] Application id of the guild creator if it is bot-created `nullable`
var system_channel_id = null # [String] The id of the channel where guild notices such as welcome messages and boost events are posted `nullable`
var system_channel_flags = null # [SystemChannelFlags] System channel flags
var rules_channel_id = null # [String] The id of the channel where Community guilds can display rules and/or guidelines `nullable`
var max_presences = null # [int] The maximum number of presences for the guild (null is always returned, apart from the largest of guilds) `optional` `nullable`
var max_members = null # [int] The maximum number of members for the guild `optional`
var vanity_url_code = null # [String] The vanity url code for the guild `nullable`
var description = null # [String] The description of a guild `nullable`
var banner = null # [String] Banner hash `nullable`
var premium_tier: int # [PremiumTier] (Server Boost level)
var premium_subscription_count = null # [int] The number of boosts this guild currently has `optional`
var preferred_locale: String # The preferred locale of a Community guild; used in server discovery and notices from Discord, and sent in interactions; defaults to "en-US"
var public_updates_channel_id = null # [String] The id of the channel where admins and moderators of Community guilds receive notices from Discord `nullable`
var max_video_channel_users = null # [int] The maximum amount of users in a video channel `optional`
var approximate_member_count = null # [int] Approximate number of members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true `optional`
var approximate_presence_count = null # [int] Approximate number of non-offline members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true `optional`
var welcome_screen = null # [WelcomeScreen] The welcome screen of a Community guild, shown to new members, returned in an Invite's guild object `optional`
var nsfw = null # [bool] (Undocumented)
var nsfw_level: int # [GuildNSFWlevel] Guild NSFW Level
var stickers = null # [Array] of [Sticker] Custom guild stickers `optional`
var premium_progress_bar_enabled: bool # Whether the guild has the boost progress bar enabled

#! The following fields are only set in `GUILD_CREATE` event
var joined_at = null # [String] When this guild was joined at
var large = null # [bool] True if this is considered a large guild
var unavailable = null # [bool] True if this guild is unavailable due to an outage
var member_count = null # [int] Total number of members in this guild
var voice_states = null # [Array] of partial [VoiceState] States of members currently in voice channels; lacks the `guild_id` key
var members = null # Array of [GuildMember] Users in the guild
var channels = null # [Array] of [Channel] Channels in the guild
var threads = null # [Array] of [Channel] All active threads in the guild that current user has permission to view
var presences = null # [Array] of partial [PresenceUpdateEvent] Presences of the members in the guild, will only include non-offline members if the size is greater than large threshold
var stage_instances = null # [Array] of [StageInstance] Stage instances in the guild
var guild_scheduled_events = null # [Array] of [GuildScheduledEvent] The scheduled events in the guild

var hub_type = null # (Undocumented) `optional`
var flags = null # (Undocumented) `optional`


# @hidden
func _init().("Guild"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permissions") and p_dict.permissions != null:
		permissions = Permissions.new(p_dict.permissions)
	if p_dict.has("roles"):
		roles = []
		for data in p_dict.roles:
			roles.append(Role.new().from_dict(data))
	if p_dict.has("emojis"):
		emojis = []
		for data in p_dict.emojis:
			emojis.append(Emoji.new().from_dict(data))
	if p_dict.has("system_channel_flags"):
		system_channel_flags = SystemChannelFlags.new(p_dict.system_channel_flags)
	if p_dict.has("welcome_screen"):
		welcome_screen = WelcomeScreen.new().from_dict(p_dict.welcome_screen)
	if p_dict.has("stickers"):
		stickers = []
		for data in p_dict.stickers:
			stickers.append(Sticker.new().from_dict(data))
	if p_dict.has("voice_states"):
		voice_states = []
		for data in p_dict.voice_states:
			voice_states.append(VoiceState.new().from_dict(data))
	if p_dict.has("members"):
		members = []
		for data in p_dict.members:
			members.append(GuildMember.new().from_dict(data))
	if p_dict.has("channels"):
		channels = []
		for data in p_dict.channels:
			channels.append(Channel.new().from_dict(data))
	if p_dict.has("threads"):
		threads = []
		for data in p_dict.threads:
			threads.append(Channel.new().from_dict(data))
	if p_dict.has("presences"):
		presences = []
		for data in p_dict.presences:
			presences.append(PresenceUpdateEvent.new().from_dict(data))
	if p_dict.has("stage_instances"):
		stage_instances = []
		for data in p_dict.stage_instances:
			stage_instances.append(StageInstance.new().from_dict(data))
	if p_dict.has("guild_scheduled_events"):
		guild_scheduled_events = []
		for data in p_dict.guild_scheduled_events:
			guild_scheduled_events.append(GuildScheduledEvent.new().from_dict(data))
	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_bitfield_to_int(dict, "permissions", true)
	DiscordUtils.try_bitfield_to_int(dict, "system_channel_flags")
	DiscordUtils.try_array_dataclass_to_dict(dict, "roles")
	DiscordUtils.try_array_dataclass_to_dict(dict, "emojis")
	DiscordUtils.try_array_dataclass_to_dict(dict, "stickers")
	DiscordUtils.try_dataclass_to_dict(dict, "welcome_screen")
	DiscordUtils.try_array_dataclass_to_dict(dict, "voice_states")
	DiscordUtils.try_array_dataclass_to_dict(dict, "members")
	DiscordUtils.try_array_dataclass_to_dict(dict, "channels")
	DiscordUtils.try_array_dataclass_to_dict(dict, "threads")
	DiscordUtils.try_array_dataclass_to_dict(dict, "presences")
	DiscordUtils.try_array_dataclass_to_dict(dict, "stage_instances")
	DiscordUtils.try_array_dataclass_to_dict(dict, "guild_scheduled_events")

	return dict
