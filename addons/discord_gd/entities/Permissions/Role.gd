# Represents a Discord role
class_name Role extends Dataclass

var id: String # Role id
var name: String # Role name
var color: int # Integer representation of hexadecimal color code
var hoist: bool	# If this role is pinned in the user listing
var icon = null # [String] Role icon hash
var unicode_emoji = null # [String] Role unicode emoji
var position: int # Position of this role
var permissions: String # Permission bit set
var managed: bool # Whether this role is managed by an integration
var mentionable: bool # Whether this role is mentionable
var tags = null # [RoleTags] The tags this role has


# @hidden
func _init().("Role"): return self
