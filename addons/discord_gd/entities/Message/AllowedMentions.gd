# Represents a Discord allowed mentions
#
# If `allowed_mentions` is not passed in a [Message], the mentions will be parsed via the content.
#
# The `parse` field is mutually exclusive with the other fields
#
# In the example below we would ping `@here` (and also `@role124` and `@user123`)
# ```GDScript
# var msg = Message.new()
# msg.content = "@here Hi there from <@123>, cc <@&124>"
# ```
# To suppress all mentions we use
# ```GDScript
# var msg = Message.new()
# msg.content = "@everyone hi there, <@&123>"
# msg.allowed_mentions = AllowedMentions.new().from_dict({parse = []})
# ```
# In the example below, we would ping users 123 and role 124, but not @everyone
# ```GDScript
# var msg = Message.new()
# msg.content = "@everyone <@123> <@&124>"
# msg.allowed_mentions = AllowedMentions.new().from_dict({
#	parse = ["users", "roles"],
#	users = []
# })
# ```
# See more examples on [Discord API docs](https://discord.com/developers/docs/resources/channel#allowed-mentions-object-allowed-mentions-reference)
class_name AllowedMentions extends DiscordDataclass

var parse = null # [Array] of [AllowedMentionsTypes] An array of allowed mention types to parse from the content `optional`
var roles = null # [Array] of [String] List of role ids to mention (Max size of 100) `optional`
var users = null # [Array] of [String] List of user ids to mention (Max size of 100) `optional`
var replied_user = null # [bool] For replies, whether to mention the author of the message being replied to (default false) `optional`

# @hidden
func _init().("AllowedMentions"): return self
