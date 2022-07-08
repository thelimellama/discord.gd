# Params for edit message
class_name EditMessageParams extends Dataclass

var content = null setget __set_content # [String] Message contents (up to 2000 characters)
var embeds = null setget __set_embeds # [Array] of [Embed] Embedded rich content (up to 6000 characters)
var flags = null setget __set_flags # [MessageFlags] Edit the flags of a message (only `SUPPRESS_EMBEDS` can currently be set/unset)
var allowed_mentions = null setget __set_allowed_mentions # [AllowedMention] Allowed mentions for the message
var components = null setget __set_components # [Array] of [MessageActionRow] Components to include with the message
var files = null setget __set_files # [Array] of [DiscordFile] Contents of the file(s) being sent/edited
var attachments = null setget __set_attachments # [Array] of [Attachment] Attached files to keep and possible descriptions for new files

var __set_props = {} # @hidden

# @hidden
func _init().("EditMessageParams", {include_null_in_dict = false, print_exclude = ["__set_props"]}): return self


func __set_content(p_content):
	__set_props.content = true
	content = p_content


func __set_embeds(p_embeds):
	__set_props.embeds = true
	embeds = p_embeds


func __set_flags(p_flags):
	__set_props.flags = true
	flags = p_flags


func __set_allowed_mentions(p_allowed_mentions):
	__set_props.allowed_mentions = true
	allowed_mentions = p_allowed_mentions


func __set_components(p_components):
	__set_props.components = true
	components = p_components


func __set_files(p_files):
	__set_props.files = true
	files = p_files


func __set_attachments(p_attachments):
	__set_props.attachments = true
	attachments = p_attachments


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("embeds") and p_dict.embeds != null:
		embeds = []
		for data in p_dict.embeds:
			embeds.append(Embed.new().from_dict(data))
	if p_dict.has("flags") and p_dict.flags != null:
		flags = MessageFlags.new(p_dict.flags)
	if p_dict.has("allowed_mentions") and p_dict.allowed_mentions != null:
		allowed_mentions = AllowedMention.new().from_dict(p_dict.allowed_mentions)
	if p_dict.has("components") and p_dict.components != null:
		components = []
		for data in p_dict.components:
			components.append(MessageActionRow.new().from_dict(data))
	if p_dict.has("files"):
		files = []
		for data in p_dict.files:
			if not data is DiscordFile:
				DiscordUtils.perror("EditMessageParams:from_dict:Got non DiscordFile in files array: %s" % data)
			else:
				files.append(data)
	if p_dict.has("attachments") and p_dict.attachments != null:
		attachments = []
		for data in p_dict.attachments:
			attachments.append(Attachment.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()
	var set_props = __set_props.keys()
	for prop in set_props: dict[prop] = get(prop)
	dict = dict.duplicate(true)
	dict.erase("__set_props")

	if dict.has("embeds") and dict.embeds != null:
		for i in dict.embeds.size():
			dict.embeds[i] = dict.embeds[i].to_dict()
	if dict.has("flags") and dict.flags != null:
		dict.flags = dict.flags.bitfield
	if dict.has("allowed_mentions") and dict.allowed_mentions != null:
		dict.allowed_mentions = dict.allowed_mentions.to_dict()
	if dict.has("components") and dict.components != null:
		for i in dict.components.size():
			dict.components[i] = dict.components[i].to_dict()
	if dict.has("attachments") and dict.attachments != null:
		for i in dict.attachments.size():
			dict.attachments[i] = dict.attachments[i].to_dict()


	return dict
