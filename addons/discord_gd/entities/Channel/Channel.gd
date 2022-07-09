# Represents a Discord channel
class_name Channel extends DiscordDataclass

var id: String # The id of this channel
var type: int # [ChannelTypes] The type of channel
var guild_id = null # [String] The id of the guild (may be missing for some channel objects received over gateway guild dispatches) `optional`
var position = null # [int] Sorting position of the channel `optional`
var permission_overwrites = null # [Array] of [Overwrite] Explicit permission overwrites for members and roles `optional`
var name = null # [String] The name of the channel (1-100 characters) `optional` `nullable`
var topic = null # [String] The channel topic (0-1024 characters) `optional` `nullable`
var nsfw = null # [bool] Whether the channel is nsfw `optional`
var last_message_id = null # [String] The id of the last message sent in this channel (or thread channels) `optional` `nullable`
var bitrate = null # [int] The bitrate (in bits) of the voice channel `optional`
var user_limit = null # [int] The user limit of the voice channel `optional`
var rate_limit_per_user = null # [int] Amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected `optional`
var recipients = null # [Array] of [User] The recipients of the DM `optional`
var icon = null # [String] Icon hash of the group DM `optional` `nullable`
var owner_id = null # [String] Id of the creator of the group DM or thread `optional`
var application_id = null # [String] Application id of the group DM creator if it is bot-created `optional`
var parent_id = null # [String] For guild channels: id of the parent category for a channel (each parent category can contain up to 50 channels), for threads: id of the text channel this thread was created `optional` `nullable`
var last_pin_timestamp = null # [String] When the last pinned message was pinned `optional` `nullable`
var rtc_region = null # [String] Voice region id for the voice channel, automatic when set to null `optional` `nullable`
var video_quality_mode = null # [VideoQualityModes] The camera video quality mode of the voice channel, 1 when not present `optional`
var message_count = null # [int] An approximate count of messages in a thread, stops counting at 50 `optional`
var member_count = null # [int] An approximate count of users in a thread, stops counting at 50 `optional`
var thread_metadata = null # [ThreadMetadata] Thread-specific fields not needed by other channels `optional`
var member = null # [ThreadMember] Thread member object for the current user, if they have joined the thread, only included on certain API endpoints `optional`
var default_auto_archive_duration = null # [int] Default duration that the clients (not the API) will use for newly created threads, in minutes, to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080 `optional`
var permissions = null # [Permissions] Computed permissions for the invoking user in the channel, including overwrites, only included when part of the resolved data received on a slash command interaction `optional`
var flags = null # [int] Channel flags combined as a bitfield `optional`

var total_message_sent = null # [int] (Undocumented) `optional`
var member_ids_preview = null # [Array] of [String] (Undocumented) `optional`
var available_tags = null # (Undocumented) `optional`
var template = null # (Undocumented) `optional`
var default_reaction_emoji = null # (Undocumented) `optional`

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
	if p_dict.has("permissions"):
		permissions = Permissions.new(p_dict.permissions)
	if p_dict.has("flags"):
		flags = ChannelFlags.new(p_dict.flags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "permission_overwrites")
	DiscordUtils.try_array_dataclass_to_dict(dict, "recipients")
	DiscordUtils.try_dataclass_to_dict(dict, "thread_metadata")
	DiscordUtils.try_dataclass_to_dict(dict, "member")
	DiscordUtils.try_bitfield_to_int(dict, "flags")
	DiscordUtils.try_bitfield_to_int(dict, "permissions", true)

	return dict
