# Params for edit message
class_name EditMessageParams extends DiscordDataclass

var content = null setget __set_content # [String] Message contents (up to 2000 characters) `optional` `nullable`
var embeds = null setget __set_embeds # [Array] of [Embed] Embedded rich content (up to 6000 characters) `optional` `nullable`
var flags = null setget __set_flags # [MessageFlags] Edit the flags of a message (only `SUPPRESS_EMBEDS` can currently be set/unset) `optional` `nullable`
var allowed_mentions = null setget __set_allowed_mentions # [AllowedMentions] Allowed mentions for the message `optional` `nullable`
var components = null setget __set_components # [Array] of [MessageActionRow] Components to include with the message `optional` `nullable`
var files = null setget __set_files # [Array] of [DiscordFile] Contents of the file(s) being sent/edited `optional` `nullable`
var attachments = null setget __set_attachments # [Array] of [Attachment] Attached files to keep and possible descriptions for new files `optional` `nullable`


# @hidden
func _init().("EditMessageParams"): return self


func __set_content(p_content):
	__options__.set_props.content = true
	content = p_content


func __set_embeds(p_embeds):
	__options__.set_props.embeds = true
	embeds = p_embeds


func __set_flags(p_flags):
	__options__.set_props.flags = true
	flags = p_flags


func __set_allowed_mentions(p_allowed_mentions):
	__options__.set_props.allowed_mentions = true
	allowed_mentions = p_allowed_mentions


func __set_components(p_components):
	__options__.set_props.components = true
	components = p_components


func __set_files(p_files):
	__options__.set_props.files = true
	files = p_files


func __set_attachments(p_attachments):
	__options__.set_props.attachments = true
	attachments = p_attachments


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("flags") and p_dict.flags != null:
		flags = MessageFlags.new(p_dict.flags)
	if p_dict.has("allowed_mentions") and p_dict.allowed_mentions != null:
		allowed_mentions = AllowedMentions.new().from_dict(p_dict.allowed_mentions)
	if p_dict.has("embeds") and p_dict.embeds != null:
		embeds = []
		for data in p_dict.embeds:
			embeds.append(Embed.new().from_dict(data))
	if p_dict.has("components") and p_dict.components != null:
		components = []
		for data in p_dict.components:
			components.append(MessageActionRow.new().from_dict(data))
	DiscordUtils.try_files_from_dict(p_dict, "files", files)
	if p_dict.has("attachments") and p_dict.attachments != null:
		attachments = []
		for data in p_dict.attachments:
			attachments.append(Attachment.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "allowed_mentions")
	DiscordUtils.try_bitfield_to_int(dict, "flags")
	DiscordUtils.try_array_dataclass_to_dict(dict, "embeds")
	DiscordUtils.try_array_dataclass_to_dict(dict, "components")
	DiscordUtils.try_array_dataclass_to_dict(dict, "attachments")

	return dict
