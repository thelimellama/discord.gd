# Params for modify guild roles
class_name ModifyGuildRolesParams extends Dataclass

var modifications = [] # [Array] of [GuildRoleModification]

# @hidden
func _init().("ModifyGuildRolesParams", {include_null_in_dict = false}): return self


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
	var dict = .to_dict().duplicate(true)

	if dict.has("modifications"):
		for i in dict.modifications.size():
			dict.modifications[i] = dict.modifications[i].to_dict()

	return dict
