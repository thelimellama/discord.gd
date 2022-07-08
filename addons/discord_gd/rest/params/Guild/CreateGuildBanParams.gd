# Params for create guild ban
class_name CreateGuildBanParams extends Dataclass

var delete_message_days = null # [int] Number of days to delete messages for (0-7) (default is 0)


# @hidden
func _init().("CreateGuildBanParams", {include_null_in_dict = false}): return self
