# Represents a Discord Application
class_name Application extends DiscordDataclass

var id: String # The id of the app
var name: String # The name of the app
var icon = null # [String] The icon hash of the app `nullable`
var description: String # The description of the app
var rpc_origins = null # [Array] of [String] An array of rpc origin urls, if rpc is enabled `optional`
var bot_public: bool # When false only app owner can join the app's bot to guilds
var bot_require_code_grant: bool # When true the app's bot will only join upon completion of the full OAuth2 code grant flow
var terms_of_service_url = null # [String] The url of the app's terms of service `optional`
var privacy_policy_url = null # [String] The url of the app's privacy policy `optional`
var owner = null # [User] Partial user object containing info on the owner of the application `optional`
var verify_key: String # The hex encoded key for verification in interactions and the GameSDK's GetTicket
var team = null # [Team] If the application belongs to a team, this will be a list of the members of that team `nullable`
var guild_id = null # [String] If this application is a game sold on Discord, this field will be the guild to which it has been linked `optional`
var primary_sku_id = null # [String] If this application is a game sold on Discord, this field will be the id of the "Game SKU" that is created, if exists `optional`
var slug = null # [String] If this application is a game sold on Discord, this field will be the URL slug that links to the store page `optional`
var cover_image = null # [String] The application's default rich presence invite cover image hash `optional`
var flags = null # [ApplicationFlags] The application's public flags `optional`
var tags = null # [Array] of [String] Up to 5 tags describing the content and functionality of the application `optional`
var install_params = null # [ApplicationInstallParams] Settings for the application's default in-app authorization link, if enabled `optional`
var custom_install_url = null # [String] The application's default custom authorization link, if enabled `optional`

var bot = null # (Undocumented)
var summary = null # [String] (Deprecated will be removed in v11)
var type = null # [int] (Undocumented)

# @hidden
func _init().("Application"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("owner"):
		owner = User.new().from_dict(p_dict.owner)
	if p_dict.has("team") and p_dict.team != null:
		team = Team.new().from_dict(p_dict.team)
	if p_dict.has("install_params"):
		install_params = ApplicationInstallParams.new().from_dict(p_dict.install_params)
	if p_dict.has("flags"):
		flags = ApplicationFlags.new(p_dict.flags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "owner")
	DiscordUtils.try_dataclass_to_dict(dict, "team")
	DiscordUtils.try_dataclass_to_dict(dict, "install_params")
	DiscordUtils.try_bitfield_to_int(dict, "flags")

	return dict
