# Represents a Discord guild integration application
class_name IntegrationApplication extends Dataclass

var id: String # The id of the app
var name: String # The name of the app
var icon = null # [String] The icon hash of the app
var description: String # The description of the app
var bot = null # [User] The bot associated with this application

# @hidden
func _init().("IntegrationApplication"): return self
