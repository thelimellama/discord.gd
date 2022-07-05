# Represents a Discord application install params
class_name ApplicationInstallParams extends Dataclass

var scopes: Array # [Array] of [OAuth2Scopes] The scopes to add the application to the server with
var permissions: String # The permissions to request for the bot role


# @hidden
func _init().("ApplicationInstallParams"): return self
