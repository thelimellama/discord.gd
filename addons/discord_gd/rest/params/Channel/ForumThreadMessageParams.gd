# Params for a forum thread message
#
# When seding a message apps must provide at least one of `content`, `embeds`, `files`, or `sticker_ids`
class_name ForumThreadMessageParams extends DiscordDataclass

var content = null # [String] Message contents (up to 2000 characters) `optional`
var embeds = null # [Array] of [Embed] Embedded rich content (up to 6000 characters) `optional`
var allowed_mentions = null # [AllowedMentions] Allowed mentions for the message `optional`
var components = null # [Array] of [MessageActionRow] Components to include with the message `optional`
var sticker_ids = null # [Array] of [String] Ids of up to 3 stickers in the server to send in the message `optional`
var files = null # [Array] of [DiscordFile] Contents of the file(s) being sent `optional`
var attachments = null # [Array] of partial [Attachment] Attachment with filename and description `optional`
var flags = null # [MessageFlags] Message flags combined as a bitfield (only SUPPRESS_EMBEDS can be set) `optional`


# @hidden
func _init().("ForumThreadMessageParams"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("allowed_mentions"):
		allowed_mentions = AllowedMentions.new().from_dict(p_dict.allowed_mentions)
	if p_dict.has("embeds"):
		embeds = []
		for data in p_dict.embeds:
			embeds.append(Embed.new().from_dict(data))
	if p_dict.has("components"):
		components = []
		for data in p_dict.components:
			components.append(MessageActionRow.new().from_dict(data))
	if p_dict.has("attachments"):
		attachments = []
		for data in p_dict.attachments:
			attachments.append(Attachment.new().from_dict(data))
	DiscordUtils.try_files_from_dict(p_dict, "files", files)
	if p_dict.has("flags"):
		flags = MessageFlags.new(p_dict.flags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "embeds")
	DiscordUtils.try_array_dataclass_to_dict(dict, "components")
	DiscordUtils.try_array_dataclass_to_dict(dict, "attachments")
	DiscordUtils.try_dataclass_to_dict(dict, "allowed_mentions")
	DiscordUtils.try_bitfield_to_int(dict, "flags")

	return dict
