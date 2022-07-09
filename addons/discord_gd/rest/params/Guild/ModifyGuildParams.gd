# Params for modify guild
class_name ModifyGuildParams extends DiscordDataclass


var name = null # [String] Guild name `optional`
var verification_level = null setget __set_verification_level # [GuildVerificationLevel] Verification level `optional` `nullable`
var default_message_notifications = null setget __set_default_message_notifications # [DefaultMessageNotificationLevel] Default message notification level `optional` `nullable`
var explicit_content_filter = null setget __set_explicit_content_filter # [ExplicitContentFilterLevel] Explicit content filter level `optional` `nullable`
var afk_channel_id = null setget __set_afk_channel_id # [String] Id for afk channel `optional` `nullable`
var afk_timeout = null # [int] Afk timeout in seconds `optional`
var icon = null setget __set_icon # [String] 1024x1024 png/jpeg/gif image for the guild icon (can be animated gif when the server has the `ANIMATED_ICON` feature) (Data URI scheme encoded) `optional` `nullable`
var owner_id = null # [String] User id to transfer guild ownership to (current user must be owner) `optional`
var splash = null setget __set_splash # [String] 16:9 png/jpeg image for the guild splash (when the server has the `INVITE_SPLASH` feature) (Data URI scheme encoded) `optional` `nullable`
var discovery_splash = null setget __set_discovery_splash # [String] 16:9 png/jpeg image for the guild discovery splash (when the server has the `DISCOVERABLE` feature) (Data URI scheme encoded) `optional` `nullable`
var banner = null setget __set_banner # [String] 16:9 png/jpeg image for the guild banner (when the server has the `BANNER` feature; can be animated gif when the server has the `ANIMATED_BANNER` feature) (Data URI scheme encoded) `optional` `nullable`
var system_channel_id = null setget __set_system_channel_id # [String] Id of the channel where guild notices such as welcome messages and boost events are posted `optional` `nullable`
var system_channel_flags = null # [SystemChannelFlags] system channel flags `optional`
var rules_channel_id = null setget __set_rules_channel_id # [String] Id of the channel where Community guilds display rules and/or guidelines `optional` `nullable`
var public_updates_channel_id = null setget __set_public_updates_channel_id # [String] Id of the channel where admins and moderators of Community guilds receive notices from Discord `optional` `nullable`
var preferred_locale = null setget __set_preferred_locale # [String] The preferred locale of a Community guild used in server discovery and notices from Discord; defaults to "en-US" `optional` `nullable`
var features = null # [Array] of [GuildFfeature] Enabled guild features `optional`
var description = null setget __set_description # [String] Description for the guild `optional` `nullable`
var premium_progress_bar_enabled = null # [bool] Whether the guild's boost progress bar should be enabled `optional`



# @hidden
func _init().("ModifyGuildParams"): return self


func __set_verification_level(p_verification_level):
	__options__.set_props.verification_level = true
	verification_level = p_verification_level


func __set_default_message_notifications(p_default_message_notifications):
	__options__.set_props.default_message_notifications = true
	default_message_notifications = p_default_message_notifications


func __set_explicit_content_filter(p_explicit_content_filter):
	__options__.set_props.explicit_content_filter = true
	explicit_content_filter = p_explicit_content_filter


func __set_afk_channel_id(p_afk_channel_id):
	__options__.set_props.afk_channel_id = true
	afk_channel_id = p_afk_channel_id


func __set_icon(p_icon):
	__options__.set_props.icon = true
	icon = p_icon


func __set_splash(p_splash):
	__options__.set_props.splash = true
	splash = p_splash


func __set_discovery_splash(p_discovery_splash):
	__options__.set_props.discovery_splash = true
	discovery_splash = p_discovery_splash


func __set_banner(p_banner):
	__options__.set_props.banner = true
	banner = p_banner


func __set_system_channel_id(p_system_channel_id):
	__options__.set_props.system_channel_id = true
	system_channel_id = p_system_channel_id


func __set_rules_channel_id(p_rules_channel_id):
	__options__.set_props.rules_channel_id = true
	rules_channel_id = p_rules_channel_id


func __set_public_updates_channel_id(p_public_updates_channel_id):
	__options__.set_props.public_updates_channel_id = true
	public_updates_channel_id = p_public_updates_channel_id


func __set_preferred_locale(p_preferred_locale):
	__options__.set_props.preferred_locale = true
	preferred_locale = p_preferred_locale


func __set_description(p_description):
	__options__.set_props.description = true
	description = p_description


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("system_channel_flags"):
		system_channel_flags = SystemChannelFlags.new(p_dict.system_channel_flags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_bitfield_to_int(dict, "system_channel_flags")

	return dict
