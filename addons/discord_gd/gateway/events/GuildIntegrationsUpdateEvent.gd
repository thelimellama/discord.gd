# Represents a Discord guild integrations update event
class_name GuildIntegrationsUpdateEvent extends Dataclass

var guild_id: String # Id of the guild whose integrations were updated


# @hidden
func _init().("GuildIntegrationsUpdateEvent"): return self
