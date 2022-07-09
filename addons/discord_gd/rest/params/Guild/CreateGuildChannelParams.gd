# Params for create guild channel
class_name CreateGuildChannelParams extends DiscordDataclass

var name: String # Channel name (1-100 characters)
var type = null setget __set_type # [ChannelTypes] Type of channel `optional` `nullable`
var topic = null setget __set_topic # [String] Channel topic (0-1024 characters) `optional` `nullable`
var bitrate = null setget __set_bitrate # [int] Bitrate (in bits) of the voice or stage channel; min 8000 `optional` `nullable`
var user_limit = null setget __set_user_limit # [int] User limit of the voice channel `optional` `nullable`
var rate_limit_per_user = null setget __set_rate_limit_per_user # [int] Amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission `MANAGE_MESSAGES` or `MANAGE_CHANNEL`, are unaffected `optional` `nullable`
var position = null setget __set_position # [int] Sorting position of the channel `optional` `nullable`
var permission_overwrites = null setget __set_permission_overwrites # [Array] of partial [Overwrite] Channel's permission overwrites `optional` `nullable`
var parent_id = null setget __set_parent_id # [String] Id of the parent category for a channel `optional` `nullable`
var nsfw = null setget __set_nsfw # [bool] Whether the channel is nsfw `optional` `nullable`
var rtc_region = null setget __set_rtc_region # [String] Channel voice region id of the voice or stage channel, automatic when set to null `optional` `nullable`
var video_quality_mode = null setget __set_video_quality_mode # [VideoQualityModes] Camera quality of the voice channel `optional` `nullable`
var default_auto_archive_duration = null setget __set_default_auto_archive_duration # [int] Default duration that the clients use (not the API) for newly created threads in the channel, in minutes, to automatically archive the thread after recent activity `optional` `nullable`

# @hidden
func _init().("CreateGuildChannelParams"): return self


func __set_type(p_type):
	__options__.set_props.type = true
	type = p_type


func __set_topic(p_topic):
	__options__.set_props.topic = true
	topic = p_topic


func __set_bitrate(p_bitrate):
	__options__.set_props.bitrate = true
	bitrate = p_bitrate


func __set_user_limit(p_user_limit):
	__options__.set_props.user_limit = true
	user_limit = p_user_limit


func __set_rate_limit_per_user(p_rate_limit_per_user):
	__options__.set_props.rate_limit_per_user = true
	rate_limit_per_user = p_rate_limit_per_user


func __set_position(p_position):
	__options__.set_props.position = true
	position = p_position


func __set_permission_overwrites(p_permission_overwrites):
	__options__.set_props.permission_overwrites = true
	permission_overwrites = p_permission_overwrites


func __set_parent_id(p_parent_id):
	__options__.set_props.parent_id = true
	parent_id = p_parent_id


func __set_nsfw(p_nsfw):
	__options__.set_props.nsfw = true
	nsfw = p_nsfw


func __set_rtc_region(p_rtc_region):
	__options__.set_props.rtc_region = true
	rtc_region = p_rtc_region


func __set_video_quality_mode(p_video_quality_mode):
	__options__.set_props.video_quality_mode = true
	video_quality_mode = p_video_quality_mode


func __set_default_auto_archive_duration(p_default_auto_archive_duration):
	__options__.set_props.default_auto_archive_duration = true
	default_auto_archive_duration = p_default_auto_archive_duration

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permission_overwrites") and p_dict.permission_overwrites != null:
		permission_overwrites = []
		for data in p_dict.permission_overwrites:
			permission_overwrites.append(Overwrite.new().from_dict(data))

	return self

func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "permission_overwrites")

	return dict
