# Represents a Discord Guild
class_name Guild extends Dataclass

var id: String # Guild id
var name: String # Guild name (2-100 characters, excluding trailing and leading whitespace)
var icon: String # Icon hash
var icon_hash = null # [String] Icon hash, returned when in the template object
var splash = null # [String] Splash hash
var discovery_splash = null # [String] Discovery splash hash; only present for guilds with the `DISCOVERABLE` feature
var owner = null # [bool] True if the user is the owner of the guild
var owner_id: String # Id of owner
var permissions = null # [String] Total permissions for the user in the guild (excludes overwrites)
var region = null # [String] Voice region id for the guild (deprecated)
var afk_channel_id = null # [String] Id of afk channel
var afk_timeout: int # Afk timeout in seconds
var widget_enabled = null # [bool] True if the server widget is enabled
var widget_channel_id = null # [String] The channel id that the widget will generate an invite to, or null if set to no invite
var verification_level: int # [GuildVerificationLevel] Verification level required for the guild
var default_message_notifications: int # [DefaultMessageNotificationLevel] Default message notifications level
var explicit_content_filter: int # [ExplicitContentFilterLevel] Explicit content filter level
var roles: Array # [Array] of [Role] Roles in the guild
var emojis: Array # [Array] of [Emoji] Custom guild emojis
var features: Array # [Array] of [GuildFeatures] Enabled guild features
var mfa_level: int # [MFALevel] Required MFA level for the guild
var application_id = null # [String] Application id of the guild creator if it is bot-created
var system_channel_id = null # [String] The id of the channel where guild notices such as welcome messages and boost events are posted
var system_channel_flags: SystemChannelFlags # [SystemChannelFlags] System channel flags
var rules_channel_id = null # [String] The id of the channel where Community guilds can display rules and/or guidelines
var max_presences = null # [int] The maximum number of presences for the guild (null is always returned, apart from the largest of guilds)
var max_members = null # [int] The maximum number of members for the guild
var vanity_url_code = null # [String] The vanity url code for the guild
var description = null # [String] The description of a guild
var banner = null # [String] Banner hash
var premium_tier: int # [PremiumTier] (Server Boost level)
var premium_subscription_count = null # [int] The number of boosts this guild currently has
var preferred_locale: String # The preferred locale of a Community guild; used in server discovery and notices from Discord, and sent in interactions; defaults to "en-US"
var public_updates_channel_id = null # [String] The id of the channel where admins and moderators of Community guilds receive notices from Discord
var max_video_channel_users = null # [int] The maximum amount of users in a video channel
var approximate_member_count = null # [int] Approximate number of members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true
var approximate_presence_count = null # [int] Approximate number of non-offline members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true
var welcome_screen = null # [WelcomeScreen] The welcome screen of a Community guild, shown to new members, returned in an Invite's guild object
var nsfw_level: int # [GuildNSFWlevel] Guild NSFW Level
var stickers = null # [Array] of [Sticker] Custom guild stickers
var premium_progress_bar_enabled: bool # Whether the guild has the boost progress bar enabled


# @hidden
func _init().("Guild"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	roles = []
	if p_dict.has("roles"):
		for data in p_dict.roles:
			roles.append(Role.new().from_dict(data))
	emojis = []
	if p_dict.has("emojis"):
		for data in p_dict.emojis:
			emojis.append(Emoji.new().from_dict(data))
	system_channel_flags = SystemChannelFlags.new(p_dict.system_channel_flags)
	if p_dict.has("welcome_screen"):
		welcome_screen = WelcomeScreen.new().from_dict(p_dict.welcome_screen)
	stickers = []
	if p_dict.has("stickers"):
		for data in p_dict.stickers:
			stickers.append(Sticker.new().from_dict(data))
	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("roles"):
		for i in dict.roles.size():
			dict.roles[i] = dict.roles[i].to_dict()
	if dict.has("emojis"):
		for i in dict.emojis.size():
			dict.emojis[i] = dict.emojis[i].to_dict()
	dict.system_channel_flags = dict.system_channel_flags.bitfield
	if dict.has("welcome_screen") and dict.welcome_screen != null:
		dict.welcome_screen = dict.welcome_screen.to_dict()
	if dict.has("stickers"):
		for i in dict.stickers.size():
			dict.stickers[i] = dict.stickers[i].to_dict()

	return dict
