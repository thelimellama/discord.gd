# Represents a Discord Application
class_name Application extends Dataclass

var id: String # The id of the app
var name: String # The name of the app
var icon = null # [String] The icon hash of the app
var description: String # The description of the app
var rpc_origins = null # [Array] of [String] An array of rpc origin urls, if rpc is enabled
var bot_public: bool # When false only app owner can join the app's bot to guilds
var bot_require_code_grant: bool # When true the app's bot will only join upon completion of the full oauth2 code grant flow
var terms_of_service_url = null # [String] The url of the app's terms of service
var privacy_policy_url = null # [String] The url of the app's privacy policy
var owner = null # [User] Partial user object containing info on the owner of the application
var verify_key: String # The hex encoded key for verification in interactions and the GameSDK's GetTicket
var team = null # [Team] If the application belongs to a team, this will be a list of the members of that team
var guild_id = null # [String] If this application is a game sold on Discord, this field will be the guild to which it has been linked
var primary_sku_id = null # [String] If this application is a game sold on Discord, this field will be the id of the "Game SKU" that is created, if exists
var slug = null # [String] If this application is a game sold on Discord, this field will be the URL slug that links to the store page
var cover_image = null # [String] The application's default rich presence invite cover image hash
var flags = null # [ApplicationFlags] The application's public flags
var tags = null # [Array] of [String] Up to 5 tags describing the content and functionality of the application
var install_params = null # [ApplicationInstallParams] Settings for the application's default in-app authorization link, if enabled
var custom_install_url = null # [String] The application's default custom authorization link, if enabled


# @hidden
func _init().("Application"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	icon = DiscordUitls.get_or_default(p_dict, "icon", null)
	rpc_origins = DiscordUitls.get_or_default(p_dict, "rpc_origins", null)
	terms_of_service_url = DiscordUitls.get_or_default(p_dict, "terms_of_service_url", null)
	privacy_policy_url = DiscordUitls.get_or_default(p_dict, "privacy_policy_url", null)
	if p_dict.has("owner"):	owner = User.new().from_dict(p_dict.owner)
	if p_dict.has("team"): team = Team.new().from_dict(p_dict.team) 
	guild_id = DiscordUitls.get_or_default(p_dict, "guild_id", null)
	primary_sku_id = DiscordUitls.get_or_default(p_dict, "primary_sku_id", null)
	slug = DiscordUitls.get_or_default(p_dict, "slug", null)
	cover_image = DiscordUitls.get_or_default(p_dict, "cover_image", null)
	if p_dict.has("flags"):	flags = ApplicationFlags.new(p_dict.flags)
	tags = DiscordUitls.get_or_default(p_dict, "tags", null)
	install_params = DiscordUitls.get_or_default(p_dict, "install_params", null)
	custom_install_url = DiscordUitls.get_or_default(p_dict, "custom_install_url", null)

