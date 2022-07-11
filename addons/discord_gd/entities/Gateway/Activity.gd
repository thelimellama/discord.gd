# Represents a Discord activity
class_name Activity extends Dataclass

var name: String # The activity's name
var type: int # [ActivityTypes] The activity's type
var url = null setget __set_url # [String] Stream url, is validated when type is 1 `optional` `nullable`
var created_at: int # Unix timestamp (in milliseconds) of when the activity was added to the user's session
var timestamps = null # [ActivityTimestamps] Unix timestamps for start and/or end of the game `optional`
var application_id = null # [String] Application id for the game `optional`
var details = null setget __set_details # [String] What the player is currently doing `optional` `nullable`
var state = null setget __set_state # [String]	The user's current party status `optional` `nullable`
var emoji = null setget __set_emoji # [ActivityEmoji] The emoji used for a custom status `optional` `nullable`
var party = null # [ActivityParty] Information for the current party of the player `optional`
var assets = null # [ActivityAssets] Images for the presence and their hover texts `optional`
var secrets = null # [ActivitySecrets] Secrets for Rich Presence joining and spectating `optional`
var instance = null # [bool] Whether or not the activity is an instanced game session `optional`
var flags = null # [int] Activity flags ORd together, describes what the payload includes `optional`
var buttons = null # [Array] of [ActivityButton] The custom buttons shown in the Rich Presence (max 2) `optional`


# @hidden
func _init().("Activity"): return self


func __set_url(p_url):
	__options__.set_props.url = true
	url = p_url


func __set_details(p_details):
	__options__.set_props.details = true
	details = p_details


func __set_state(p_state):
	__options__.set_props.state = true
	state = p_state


func __set_emoji(p_emoji):
	__options__.set_props.emoji = true
	emoji = p_emoji


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("timestamps"):
		timestamps = ActivityTimestamps.new().from_dict(p_dict.timestamps)
	if p_dict.has("emoji") and p_dict.emoji != null:
		emoji = ActivityEmoji.new().from_dict(p_dict.emoji)
	if p_dict.has("party"):
		party = ActivityParty.new().from_dict(p_dict.party)
	if p_dict.has("assets"):
		assets = ActivityAssets.new().from_dict(p_dict.assets)
	if p_dict.has("secrets"):
		secrets = ActivitySecrets.new().from_dict(p_dict.secrets)
	if p_dict.has("flags"):
		flags = ActivityFlags.new(p_dict.flags)
	if p_dict.has("buttons"):
		buttons = []
		for data in p_dict.buttons:
			buttons.append(ActivityButton.new().from_dict(data))

	return self

# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "timestamps")
	DiscordUtils.try_dataclass_to_dict(dict, "emoji")
	DiscordUtils.try_dataclass_to_dict(dict, "party")
	DiscordUtils.try_dataclass_to_dict(dict, "assets")
	DiscordUtils.try_dataclass_to_dict(dict, "secrets")
	DiscordUtils.try_array_dataclass_to_dict(dict, "buttons")
	DiscordUtils.try_bitfield_to_int(dict, "flags")

	return dict
