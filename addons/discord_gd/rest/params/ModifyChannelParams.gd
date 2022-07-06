# Params for modify channel
class_name ModifyChannelParams extends Dataclass

var name = null # [String] 1-100 character channel name
var icon = null # [String] Base64 encoded icon
var type = null # [int] [ChannelTypes] The type of channel; Only conversion between text and news is supported and only in guilds with the "NEWS" feature
var position = null # [int] The position of the channel in the left-hand listing
var topic = null # [String]	0-1024 character channel topic
var nsfw = null # [bool] Whether the channel is nsfw
var rate_limit_per_user = null # [int] Amount of seconds a user has to wait before sending another message (0-21600)
var bitrate = null # [int] The bitrate (in bits) of the voice or stage channel; min 8000
var user_limit = null # [int] The user limit of the voice channel; 0 refers to no limit, 1 to 99 refers to a user limit
var permission_overwrites = null # [Array] of partial [Overwrite] Channel or category-specific permissions
var parent_id = null # [String] Id of the new parent category for a channel
var rtc_region = null # [String] Channel voice region id, automatic when set to null
var video_quality_mode = null # [int] The camera video quality mode of the voice channel
var default_auto_archive_duration = null # [int] The default duration that the clients use (not the API) for newly created threads in the channel, in minutes, to automatically archive the thread after recent activity
var archived = null # [bool] Whether the thread is archived
var auto_archive_duration = null # [int] Duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080
var locked = null # [bool] Whether the thread is locked; when a thread is locked, only users with `MANAGE_THREADS` permission can unarchive it
var invitable = null # [bool] Whether non-moderators can add other non-moderators to a thread; only available on private threads
var flags = null # [ChannelFlags] Channel flags combined as a bitfield; PINNED can only be set for threads in forum channels


# @hidden
func _init().("ModifyChannelParams", {include_null_in_dict = false}): return self

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
	var dict = .to_dict().duplicate(true)

	if dict.has("permission_overwrites"):
		for i in dict.permission_overwrites:
			dict.permission_overwrites[i] = dict.permission_overwrites[i].to_dict()
	if dict.has("flags"):
		dict.flags = dict.flags.bitfield

	return dict
