# Represents a Discord guild widget
class_name GuildWidget extends Dataclass

var id: String # Guild id
var name: String # Guild name (2-100 characters)
var instant_invite = null # [String] Instant invite for the guilds specified widget invite channel
var channels: Array # [Array] of partial [Channel] Voice and stage channels which are accessible by `@everyone`
var members: Array # [Array] of partial [User] Special widget user objects that includes users presence (Limit 100)
var presence_count: int # Number of online members in this guild


# @hidden
func _init().("GuildWidget"): return self
