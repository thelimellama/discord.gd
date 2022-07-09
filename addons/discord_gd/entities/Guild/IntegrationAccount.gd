# Represents a Discord guild integration account
class_name IntegrationAccount extends DiscordDataclass

var id: String # Id of the account
var name: String # Name of the account

# @hidden
func _init().("IntegrationAccount"): return self
