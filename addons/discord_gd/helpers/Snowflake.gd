# Represents a Discord snowflake
class_name Snowflake extends DiscordDataclass

var id: int # The entire snowflake
var timestamp_ms: int # Seconds since Discord Epoch, the first second of 2015
var worker_id: int
var process_id: int
var increment: int # For every id that is generated on that process, this number is incremented

const DISCORD_EPOCH = 1420070400000 # The first second of 2015


# Create a new snowflake from the id [String] | [int]
func _init(p_id = null).("Snowflake", {print_exclude = ["DISCORD_EPOCH"]}):
	if p_id == null:
		return self

	if typeof(p_id) == TYPE_STRING:
		if not p_id.is_valid_integer():
			DiscordUtils.perror("Snowflake:from_string:snowflake cannot be converted to integer, got: %s" % p_id)
			return self
	elif typeof(p_id) != TYPE_INT and typeof(p_id) != TYPE_REAL:
		DiscordUtils.perror("Snowflake:from_string:snowflake id is not a valid integer, got: %s" % p_id)
		return self

	id = int(p_id)

	timestamp_ms = (id >> 22) + DISCORD_EPOCH
	worker_id = (id & 0x3E0000) >> 17
	process_id = (id & 0x1F000) >> 12
	increment = id & 0xFFF

	return self


# Get a [Snowflake] from a unix timestamp in seconds
# @returns self
func from_timestamp_seconds(p_timestamp):
	timestamp_ms = p_timestamp * 1000
	_update_id()
	return self


# Get a date time Dictionary from the current snowflake
# @returns [Dictionary]
func get_datetime() -> Dictionary:
	return OS.get_datetime_from_unix_time(timestamp_ms / 1000)


# Get a ISO 8601 string from the current snowflake
# @returns [String]
func get_iso_string() -> String:
	return DiscordUtils.datetime_to_iso_string(get_datetime())


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)
	_update_id()

	return self


func _update_id():
	id = (timestamp_ms - DISCORD_EPOCH) << 22
	id += worker_id << 17
	id += process_id << 12
	id += increment
