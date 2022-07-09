# Represents a Discord embed
class_name Embed extends DiscordDataclass

var title = null # [String] Title of embed `optional`
var type = EmbedTypes.RICH # [EmbedTypes] Type of embed (always "rich" for webhook embeds) `optional`
var description = null # [String] Description of embed `optional`
var url = null # [String] Url of embed `optional`
var timestamp = null # [String] Timestamp of embed content `optional`
var color = null # [int] Color code of the embed `optional`
var footer = null # [EmbedFooter] Footer information `optional`
var image = null # [EmbedImage] Image information `optional`
var thumbnail = null # [EmbedThumbnail] Thumbnail information `optional`
var video = null # [EmbedVideo] Video information `optional`
var provider = null # [EmbedProvider] Provider information `optional`
var author = null # [EmbedAuthor] Author information `optional`
var fields = null # [Array] of [EmbedField] Fields information `optional`


# @hidden
func _init().("Embed"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("footer"):
		footer = EmbedFooter.new().from_dict(p_dict.footer)
	if p_dict.has("image"):
		image = EmbedImage.new().from_dict(p_dict.image)
	if p_dict.has("thumbnail"):
		thumbnail = EmbedThumbnail.new().from_dict(p_dict.thumbnail)
	if p_dict.has("video"):
		video = EmbedVideo.new().from_dict(p_dict.video)
	if p_dict.has("provider"):
		provider = EmbedProvider.new().from_dict(p_dict.provider)
	if p_dict.has("author"):
		author = EmbedAuthor.new().from_dict(p_dict.author)
	if p_dict.has("fields"):
		fields = []
		for data in p_dict.fields:
			fields.append(EmbedField.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "footer")
	DiscordUtils.try_dataclass_to_dict(dict, "image")
	DiscordUtils.try_dataclass_to_dict(dict, "thumbnail")
	DiscordUtils.try_dataclass_to_dict(dict, "video")
	DiscordUtils.try_dataclass_to_dict(dict, "provider")
	DiscordUtils.try_dataclass_to_dict(dict, "author")
	DiscordUtils.try_array_dataclass_to_dict(dict, "fields")

	return dict
