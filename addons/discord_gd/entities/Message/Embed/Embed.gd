# Represents a Discord embed
class_name Embed extends Dataclass

var title = null # [String] Title of embed
var type = EmbedTypes.RICH # [EmbedTypes] Type of embed (always "rich" for webhook embeds)
var description = null # [String] Description of embed
var url = null # [String] Url of embed
var timestamp = null # [String] Timestamp of embed content
var color = null # [int] Color code of the embed
var footer = null # [EmbedFooter] Footer information
var image = null # [EmbedImage] Image information
var thumbnail = null # [EmbedThumbnail] Thumbnail information
var video = null # [EmbedVideo] Video information
var provider = null # [EmbedProvider] Provider information
var author = null # [EmbedAuthor] Author information
var fields = null # [Array] of [EmbedField] Fields information


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
	var dict = .to_dict().duplicate(true)

	if dict.has("footer") and dict.footer != null:
		dict.footer = dict.footer.to_dict()
	if dict.has("image") and dict.image != null:
		dict.image = dict.image.to_dict()
	if dict.has("thumbnail") and dict.thumbnail != null:
		dict.thumbnail = dict.thumbnail.to_dict()
	if dict.has("video") and dict.video != null:
		dict.video = dict.video.to_dict()
	if dict.has("provider") and dict.provider != null:
		dict.provider = dict.provider.to_dict()
	if dict.has("author") and dict.author != null:
		dict.author = dict.author.to_dict()
	if dict.has("fields") and dict.fields != null:
		for i in dict.fields.size():
			dict.fields[i] = dict.fields[i].to_dict()

	return dict
