# Params for create message
#
# At least one of `content`, `embeds`, `sticker_ids`, or `files` is required.
class_name CreateMessageParams extends Dataclass

var content = null # [String] Message contents (up to 2000 characters)
var tts = null # [bool] True if this is a TTS message
var embeds = null # [Array] of [Embed] Embedded rich content (up to 6000 characters)
var allowed_mentions = null # [AllowedMention] Allowed mentions for the message
var message_reference = null # [MessageReference] Include to make your message a reply
var components = null # [Array] of [MessageActionRow] Components to include with the message
var sticker_ids = null # [Array] of [String] Ids of up to 3 stickers in the server to send in the message
var files = null # [Array] of [PoolByteArray] Contents of the file being sent
var payload_json = null # [String] JSON-encoded body of non-file params, only for multipart/form-data requests
var attachments = null # [Array] of partial [Attachment] Attachment objects with filename and description
var flags = null # [MessageFlags] Message flags combined as a bitfield (only `SUPPRESS_EMBEDS` can be set)


# @hidden
func _init().("CreateMessageParams", {include_null_in_dict = false}): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("embeds"):
		embeds = []
		for data in p_dict.embeds:
			embeds.append(Embed.new().from_dict(data))
	if p_dict.has("allowed_mentions"):
		allowed_mentions = AllowedMention.new().from_dict(p_dict.allowed_mentions)
	if p_dict.has("message_reference"):
		message_reference = MessageReference.new().from_dict(p_dict.message_reference)
	if p_dict.has("components"):
		components = []
		for data in p_dict.components:
			components.append(MessageActionRow.new().from_dict(data))
	if p_dict.has("attachments"):
		attachments = []
		for data in p_dict.attachments:
			attachments.append(Attachment.new().from_dict(data))
	if p_dict.has("flags"):
		flags = MessageFlags.new(p_dict.flags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("embeds"):
		embeds = []
		for i in dict.embeds.size():
			dict.embeds[i] = dict.embeds[i].to_dict()
	if dict.has("allowed_mentions"):
		dict.allowed_mentions = dict.allowed_mentions.to_dict()
	if dict.has("message_reference"):
		dict.message_reference = dict.message_reference.to_dict()
	if dict.has("components"):
		for i in dict.components.size():
			dict.components[i] = dict.components[i].to_dict()
	if dict.has("attachments"):
		for i in dict.attachments.size():
			dict.attachments[i] = dict.attachments[i].to_dict()
	if dict.has("flags"):
		dict.flags = dict.flags.bitfield

	return dict
