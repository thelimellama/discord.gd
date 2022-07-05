class_name DiscordUtils


static func get_or_default(obj, property, default):
	if property in obj and obj[property] != null:
		return obj[property]
	return default


static func set_if_not_null(obj, property, value):
	if value != null:
		obj[property] = value


static func query_string_from_dict(p_dict: Dictionary) -> String:
	return HTTPClient.new().query_string_from_dict(p_dict)
