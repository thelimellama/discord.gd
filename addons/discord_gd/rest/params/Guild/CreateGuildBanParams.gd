# Params for create guild ban
class_name CreateGuildBanParams extends DiscordDataclass

var delete_message_days = null # [int] Number of days to delete messages for (0-7) (default is 0) `optional`


# @hidden
func _init().("CreateGuildBanParams"): return self
