# Represents a Discord guild integration application
class_name IntegrationApplication extends Dataclass

var id: String # The id of the app
var name: String # The name of the app
var icon = null # [String] The icon hash of the app
var description: String # The description of the app
var bot = null # [User] The bot associated with this application

# @hidden
func _init().("IntegrationApplication"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("bot"):
		bot = User.new().from_dict(p_dict.bot)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("bot") and dict.bot != null:
		dict.bot = bot.to_dict()

	return dict
