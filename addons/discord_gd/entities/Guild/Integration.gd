# Represents a Discord guild integration
class_name Integration extends Dataclass

var id: String # Integration id
var name: String # Integration name
var type: String # Integration type (twitch, youtube, or discord)
var enabled = null # [bool] Is this integration enabled
var syncing = null # [bool] Is this integration syncing
var role_id = null # [String] Id that this integration uses for "subscribers"
var enable_emoticons = null # [bool] # whether emoticons should be synced for this integration (twitch only currently)
var expire_behavior = null # [IntegrationExpireBehavior] The behavior of expiring subscribers
var expire_grace_period = null # [int] The grace period (in days) before expiring subscribers
var user = null # [User] User for this integration
var account # [IntegrationAccount] Integration account information
var synced_at = null # [String] When this integration was last synced
var subscriber_count = null # [int] How many subscribers this integration has
var revoked = null # [bool] Has this integration been revoked
var application = null # [Application] The bot/OAuth2 application for discord integrations


# @hidden
func _init().("Integration"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)
	if p_dict.has("account"):
		account = IntegrationAccount.new().from_dict(p_dict.account)
	if p_dict.has("application"):
		application = Application.new().from_dict(p_dict.application)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("user") and user != null:
		dict.user = user.to_dict()
	if dict.has("account") and account != null:
		dict.account = account.to_dict()
	if dict.has("application") and application != null:
		dict.application = application.to_dict()

	return dict
