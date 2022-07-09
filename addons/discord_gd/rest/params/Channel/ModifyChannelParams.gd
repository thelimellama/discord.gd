# Params for modify channel
#
# Based on the channel type the following properties can be modified:
# - Modify a Group DM: name, icon
# - Modify a Guild Channel: name, type, position, topic, nsfw, rate_limit_per_user, bitrate, user_limit, permission_overwrites, parent_id, rtc_region, video_quality_mode, default_auto_archive_duration
# - Modify a Thread: name, archived, auto_archive_duration, locked, invitable, rate_limit_per_user, flags
class_name ModifyChannelParams extends DiscordDataclass

var name = null # [String] 1-100 character channel name `optional`

var icon = null # [String] Icon (Data URI scheme encoded) `optional`

var type = null # [ChannelTypes] The type of channel; Only conversion between text and news is supported and only in guilds with the "NEWS" feature `optional`
var position = null setget __set_position # [int] The position of the channel in the left-hand listing `optional` `nullable`
var topic = null setget __set_topic # [String]	0-1024 character channel topic `optional` `nullable`
var nsfw = null setget __set_nsfw # [bool] Whether the channel is nsfw `optional` `nullable`
var rate_limit_per_user = null setget __set_rate_limit_per_user # [int] Amount of seconds a user has to wait before sending another message (0-21600) `optional` `nullable`
var bitrate = null setget __set_bitrate # [int] The bitrate (in bits) of the voice or stage channel; min 8000 `optional` `nullable`
var user_limit = null setget __set_user_limit # [int] The user limit of the voice channel; 0 refers to no limit, 1 to 99 refers to a user limit `optional` `nullable`
var permission_overwrites = null setget __set_permission_overwrites # [Array] of partial [Overwrite] Channel or category-specific permissions `optional` `nullable`
var parent_id = null setget __set_parent_id # [String] Id of the new parent category for a channel `optional` `nullable`
var rtc_region = null setget __set_rtc_region # [String] Channel voice region id, automatic when set to null `optional` `nullable`
var video_quality_mode = null setget __set_video_quality_mode # [int] The camera video quality mode of the voice channel `optional` `nullable`
var default_auto_archive_duration = null setget __set_default_auto_archive_duration # [int] The default duration that the clients use (not the API) for newly created threads in the channel, in minutes, to automatically archive the thread after recent activity `optional` `nullable`

var archived = null # [bool] Whether the thread is archived `optional`
var auto_archive_duration = null # [int] Duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080 `optional`
var locked = null # [bool] Whether the thread is locked; when a thread is locked, only users with `MANAGE_THREADS` permission can unarchive it `optional`
var invitable = null # [bool] Whether non-moderators can add other non-moderators to a thread; only available on private threads `optional`
var flags = null # [ChannelFlags] Channel flags combined as a bitfield; PINNED can only be set for threads in forum channels `optional`


# @hidden
func _init().("ModifyChannelParams"): return self


func __set_position(p_position):
	__options__.set_props.position = true
	position = p_position


func __set_topic(p_topic):
	__options__.set_props.topic = true
	topic = p_topic


func __set_nsfw(p_nsfw):
	__options__.set_props.nsfw = true
	nsfw = p_nsfw


func __set_rate_limit_per_user(p_rate_limit_per_user):
	__options__.set_props.rate_limit_per_user = true
	rate_limit_per_user = p_rate_limit_per_user


func __set_bitrate(p_bitrate):
	__options__.set_props.bitrate = true
	bitrate = p_bitrate


func __set_user_limit(p_user_limit):
	__options__.set_props.user_limit = true
	user_limit = p_user_limit


func __set_permission_overwrites(p_permission_overwrites):
	__options__.set_props.permission_overwrites = true
	permission_overwrites = p_permission_overwrites


func __set_parent_id(p_parent_id):
	__options__.set_props.parent_id = true
	parent_id = p_parent_id


func __set_rtc_region(p_rtc_region):
	__options__.set_props.rtc_region = true
	rtc_region = p_rtc_region


func __set_video_quality_mode(p_video_quality_mode):
	__options__.set_props.video_quality_mode = true
	video_quality_mode = p_video_quality_mode


func __set_default_auto_archive_duration(p_default_auto_archive_duration):
	__options__.set_props.default_auto_archive_duration = true
	default_auto_archive_duration = p_default_auto_archive_duration


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permission_overwrites") and p_dict.permission_overwrites != null:
		permission_overwrites = []
		for data in p_dict.permission_overwrites:
			permission_overwrites.append(Overwrite.new().from_dict(data))
	if p_dict.has("flags"):
		flags = ChannelFlags.new(p_dict.flags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "permission_overwrites")
	DiscordUtils.try_bitfield_to_int(dict, "flags")

	return dict
