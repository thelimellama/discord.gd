# Represents a connection to the Discord API
class_name DiscordSession


var mfa: bool
# var log_level: int
var should_reconnect_on_error: bool # Should the session reconnect the websocket on errors
var identify: IdentifyEvent # Identify is sent during initial handshake with the discord gateway
var cache_enabled: bool # Should cache be enabled. Caching is the best way for getting the users, channels, guilds, etc
var cache: DiscordCache # Managed cache, updated internally with events when `cache_enabled` is true
var rest: DiscordRESTClient # The REST API client
