# Represents a Discord channel
class_name Channel extends Dataclass

var id: String # The id of this channel
var type: int # [ChannelTypes] The type of channel
var guild_id = null # [String] The id of the guild (may be missing for some channel objects received over gateway guild dispatches)
var position = null # [int] Sorting position of the channel
var permission_overwrites = null # [Array] of [Overwrite] Explicit permission overwrites for members and roles
var name = null # [String] The name of the channel (1-100 characters)
var topic = null # [String] The channel topic (0-1024 characters)
var nsfw = null # [bool] Whether the channel is nsfw
var last_message_id = null # [String] The id of the last message sent in this channel (or thread channels)
var bitrate = null # [int] The bitrate (in bits) of the voice channel
var user_limit = null # [int] The user limit of the voice channel
var rate_limit_per_user = null # [int] Amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected
var recipients = null # [Array] of [User] The recipients of the DM
var icon = null # [String] Icon hash of the group DM
var owner_id = null # [String] Id of the creator of the group DM or thread
var application_id = null # [String] Application id of the group DM creator if it is bot-created
var parent_id = null # [String] For guild channels: id of the parent category for a channel (each parent category can contain up to 50 channels), for threads: id of the text channel this thread was created
var last_pin_timestamp = null # [String] When the last pinned message was pinned
var rtc_region = null # [String] Voice region id for the voice channel, automatic when set to null
var video_quality_mode = null # [VideoQualityModes] The camera video quality mode of the voice channel, 1 when not present
var message_count = null # [int] An approximate count of messages in a thread, stops counting at 50
var member_count = null # [int] An approximate count of users in a thread, stops counting at 50
var thread_metadata = null # [ThreadMetadata] Thread-specific fields not needed by other channels
var member = null # [ThreadMember] Thread member object for the current user, if they have joined the thread, only included on certain API endpoints
var default_auto_archive_duration = null # [int] Default duration that the clients (not the API) will use for newly created threads, in minutes, to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080
var permissions = null # [String] Computed permissions for the invoking user in the channel, including overwrites, only included when part of the resolved data received on a slash command interaction
var flags = null # [int] Channel flags combined as a bitfield


# @hidden
func _init().("Channel"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permission_overwrites"):
		permission_overwrites = []
		for data in p_dict.permission_overwrites:
			permission_overwrites.append(Overwrite.new().from_dict(data))
	if p_dict.has("recipients"):
		recipients = []
		for data in p_dict.recipients:
			recipients.append(User.new().from_dict(data))
	if p_dict.has("thread_metadata"):
		thread_metadata = ThreadMetadata.new().from_dict(p_dict.thread_metadata)
	if p_dict.has("member"):
		member = ThreadMember.new().from_dict(p_dict.member)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("permission_overwrites") and dict.permission_overwrites != null:
		for i in dict.permission_overwrites.size():
			dict.permission_overwrites[i] = dict.permission_overwrites[i].to_dict()
	if dict.has("recipients") and dict.recipients != null:
		for i in dict.recipients.size():
			dict.recipients[i] = dict.recipients[i].to_dict()
	if dict.has("thread_metadata") and dict.thread_metadata != null:
		dict.thread_metadata = dict.thread_metadata.to_dict()
	if dict.has("member") and dict.member != null:
		dict.member = dict.member.to_dict()
	return dict
