# Represents a Discord Application Install Params object
# @tags ApplicationInstallParams
class_name ApplicationInstallParams
extends Dataclass

func _init().("ApplicationInstallParams"): return self

var scopes: Array # [Array] of [String] [OAuth2Scopes] The scopes to add the application to the server with
var permissions: String # The permissions to request for the bot role
