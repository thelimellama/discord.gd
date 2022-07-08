# Params for create guild channel
class_name CreateGuildChannelParams extends Dataclass

var name: String # Channel name (1-100 characters)
var type = null # [ChannelTypes] Type of channel
var topic = null # [String] Channel topic (0-1024 characters)
var bitrate = null # [int] Bitrate (in bits) of the voice or stage channel; min 8000
var user_limit = null # [int] User limit of the voice channel
var rate_limit_per_user = null # [int] Amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission `MANAGE_MESSAGES` or `MANAGE_CHANNEL`, are unaffected
var position = null # [int] Sorting position of the channel
var permission_overwrites = null # [Array] of partial [Overwrite] Channel's permission overwrites
var parent_id = null # [String] Id of the parent category for a channel
var nsfw = null # [bool] Whether the channel is nsfw
var rtc_region = null # [String] Channel voice region id of the voice or stage channel, automatic when set to null
var video_quality_mode = null # [int] Camera video quality mode of the voice channel
var default_auto_archive_duration = null # [int] Default duration that the clients use (not the API) for newly created threads in the channel, in minutes, to automatically archive the thread after recent activity

# @hidden
func _init().("CreateGuildChannelParams", {include_null_in_dict = true}): return self
