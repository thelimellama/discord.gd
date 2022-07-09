# Represents a Discord file
class_name DiscordFile extends DiscordDataclass

var filename: String # The name of the file with extension
var contents: PoolByteArray # The raw bytes of the file
var content_type: String #  The MIME type of the file


# @hidden
func _init().("DiscordFile", {print_exclude = ["contents"]}): return self


# Convert an [Image] to a [DiscordFile]
# @returns self
func from_image(p_image: Image):
	var filepath = p_image.get_path()

	filename = filepath.get_file()
	contents = p_image.get_data()

	_set_content_type(filepath.get_extension())

	return self


# Load a [File] from a given path to a [DiscordFile]
# @returns self
func load_file(p_path: String):
	var file = File.new()
	file.open(p_path, File.READ)
	filename = p_path.get_file()
	contents = file.get_buffer(file.get_len())
	_set_content_type(p_path.get_extension())
	return self


func _set_content_type(p_extension: String):
	var _extension_to_content_type = {
		"png" : "image/png",
		"jpg" : "image/jpeg",
		"gif" : "image/gif",
		"mp4" : "video/mp4",
		"mp3" : "audio/mpeg",
		"wav" : "audio/x-wav",
		"ogg" : "audio/ogg",
		"jpeg" : "image/jpeg",
		"txt" : "text/plain",
		"jpe" : "image/jpeg",
		"mp4a" : "audio/mp4",
		"mp4v" : "video/mp4",
		"mpg4" : "video/mp4",
	}

	if _extension_to_content_type.has(p_extension):
		content_type = _extension_to_content_type[p_extension]
	else:
		DiscordUtils.perror("DiscordFile:_set_content_type:Unknown file extension \"%s\". Set the content_type property manually." % p_extension)
