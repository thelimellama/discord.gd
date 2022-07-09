# Params for modify guild roles
class_name ModifyGuildRolesParams extends DiscordDataclass

var modifications = [] # [Array] of [GuildRoleModification]

# @hidden
func _init().("ModifyGuildRolesParams"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("modifications"):
		modifications = []
		for data in p_dict.modifications:
			modifications.append(GuildRoleModification.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "modifications")

	return dict
