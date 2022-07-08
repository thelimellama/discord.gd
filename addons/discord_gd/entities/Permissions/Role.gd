# Represents a Discord role
class_name Role extends Dataclass

var id: String # Role id
var name: String # Role name
var color: int # Integer representation of hexadecimal color code
var hoist: bool	# If this role is pinned in the user listing
var icon = null # [String] Role icon hash
var unicode_emoji = null # [String] Role unicode emoji
var position: int # Position of this role
var permissions: Permissions # Permission bit set
var managed: bool # Whether this role is managed by an integration
var mentionable: bool # Whether this role is mentionable
var tags = null # [RoleTags] The tags this role has

var flags = null # (Undocumented)

# @hidden
func _init().("Role"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permissions") and p_dict.permissions != null:
		permissions = Permissions.new(p_dict.permissions)
	if p_dict.has("tags"):
		tags = RoleTags.new().from_dict(p_dict.tags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("permissions"):
		dict.permissions = str(dict.permissions.bitfield)
	if dict.has("tags"):
		dict.tags = dict.tags.to_dict()

	return dict
