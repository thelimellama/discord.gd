# Represents a Discord team
class_name Team extends Dataclass

var icon = null # [String] A hash of the image of the team's icon
var id: String # The unique id of the team
var members: Array # [Array] of [TeamMember] The members of the team
var name: String # The name of the team
var owner_user_id: String # The user id of the current team owner


# @hidden
func _init().("Team"): return self
