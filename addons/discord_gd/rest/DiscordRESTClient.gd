# Class managing REST actions of the Discord API.
class_name DiscordRESTClient
extends Node


# Sets the authorization token of the bot
func set_token(token: String) -> void:
	_auth_header = "Authorization: Bot %s" % token


#! ----------
#! AuditLog
#! ----------


# Get the audit logs for the given guild
#
# Requires the `VIEW_AUDIT_LOG` permission
# @returns [AuditLog] | [HTTPResponse] if error
func get_guild_audit_log(p_guild_id: String, p_params = {}) -> AuditLog:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetGuildAuditLogParams.new().from_dict(p_params)
	elif not p_params is GetGuildAuditLogParams:
		DiscordUtils.perror("Discord.gd:get_guild_audit_log:params must be a Dictionary or GetGuildAuditLogParams")

	var endpoint = ENDPOINTS.GUILD_AUDIT_LOGS % p_guild_id
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string: endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AuditLog.new().from_dict(data)


#! ----------
#! AutoModeration
#! ----------


# Get a list of auto moderation rules for the given guild
#
# Requires the `MANAGE_GUILD` permission
# @returns [Array] of [AutoModerationRule] | [HTTPResponse] if error
func get_guild_auto_moderation_rules(p_guild_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULES % p_guild_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(AutoModerationRule.new().from_dict(elm))
	return ret


# Get a single auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func get_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Creates a new auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func create_guild_auto_moderation_rule(p_guild_id: String, p_params = {}) -> AutoModerationRule:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = CreateGuildAutoModerationRuleParams.new().from_dict(p_params)
	elif not p_params is CreateGuildAutoModerationRuleParams:
		DiscordUtils.perror("Discord.gd:create_guild_auto_moderation_rule:params must be a Dictionary or CreateGuildAutoModerationRuleParams")
	var data = yield(_send_post_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULES % p_guild_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Modify an existing auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func modify_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String, p_params = {}) -> AutoModerationRule:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = ModifyGuildAutoModerationRuleParams.new().from_dict(p_params)
	elif not p_params is ModifyGuildAutoModerationRuleParams:
		DiscordUtils.perror("Discord.gd:modify_guild_auto_moderation_rule:params must be a Dictionary or ModifyGuildAutoModerationRuleParams")
	var data = yield(_send_patch_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id], p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Deletes an existing auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [bool] | [HTTPResponse] if error
func delete_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


#! ----------
#! Channel
#! ----------


# Get a channel.
#
# If the channel is a thread, a [ThreadMember] object is included in the returned result.
# @returns [Channel] | [HTTPResponse] if error
func get_channel(p_channel_id: String) -> Channel:
	var data = yield(_send_request(ENDPOINTS.CHANNEL % p_channel_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Modify a channel's settings
# @returns [Channel] | [HTTPResponse] if error
func modify_channel(p_channel_id: String, p_params = {}) -> Channel:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = ModifyChannelParams.new().from_dict(p_params)
	elif not p_params is ModifyChannelParams:
		DiscordUtils.perror("Discord.gd:modify_channel:params must be a Dictionary or ModifyChannelParams")
	var data = yield(_send_patch_request(ENDPOINTS.CHANNEL % p_channel_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Delete a channel, or close a private message
#
# Requires the `MANAGE_CHANNELS` permission for the guild, or `MANAGE_THREADS` if the channel is a thread
# @returns [Channel] | [HTTPResponse] if error
func delete_channel(p_channel_id: String) -> Channel:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL % p_channel_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Get the messages for a channel
#
# If operating on a guild channel, this endpoint requires the `VIEW_CHANNEL` permission to be present on the current user. If the current user is missing the `READ_MESSAGE_HISTORY` permission in the channel then this will return no messages (since they cannot read the message history)
# @returns [Array] of [Message] | [HTTPResponse] if error
func get_channel_messages(p_channel_id: String, p_params = {}) -> Array:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetChannelMessagesParams.new().from_dict(p_params)
	elif not p_params is GetChannelMessagesParams:
		DiscordUtils.perror("Discord.gd:get_channel_messages:params must be a Dictionary or GetChannelMessagesParams")

	var endpoint = ENDPOINTS.CHANNEL_MESSAGES % p_channel_id
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string: endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(Message.new().from_dict(elm))
	return ret


# Get a specifc message in a channel
#
# If operating on a guild channel, this endpoint requires the `READ_MESSAGE_HISTORY` permission to be present on the current user
# @returns [Array] of [Message] | [HTTPResponse] if error
func get_channel_message(p_channel_id: String, p_message_id: String) -> Message:
	var data = yield(_send_request(ENDPOINTS.CHANNEL_MESSAGE % [p_channel_id, p_message_id]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Message.new().from_dict(data)


# Get all pinned messages in the channel
# @returns [Array] of [Message] | [HTTPResponse] if error
func get_pinned_messages(p_channel_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.CHANNEL_PINS % p_channel_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(Message.new().from_dict(elm))
	return ret


# Pin a message in a channel
#
# Needs the `MANAGE_MESSAGES` permission
# @returns [bool] | [HTTPResponse] if error
func pin_message(p_channel_id: String, p_message_id: String) -> bool:
	var data = yield(_send_put_request(ENDPOINTS.CHANNEL_PIN % [p_channel_id, p_message_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Unpin a message in a channel
#
# Needs the `MANAGE_MESSAGES` permission
# @returns [bool] | [HTTPResponse] if error
func unpin_message(p_channel_id: String, p_message_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL_PIN % [p_channel_id, p_message_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Post a message to a guild text or DM channel TODO: file uploads
#
# Limitations
# - When operating on a guild channel, the current user must have the `SEND_MESSAGES` permission
# - When sending a message with tts (text-to-speech) set to true, the current user must have the `SEND_TTS_MESSAGES` permission
# - When creating a message as a reply to another message, the current user must have the `READ_MESSAGE_HISTORY` permission
# - The referenced message must exist and cannot be a system message
# - The maximum request size when sending a message is 8MiB
# - For the `embed` field, you can set every field except type (it will be rich regardless of if you try to set it), provider, video, and any height, width, or proxy_url values for images
# @returns [Message] | [HTTPResponse] if error
func create_message(p_channel_id: String, p_params = {}) -> Message:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = CreateMessageParams.new().from_dict(p_params)
	elif not p_params is CreateMessageParams:
		DiscordUtils.perror("Discord.gd:create_message:params must be a Dictionary or CreateMessageParams")
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_MESSAGES % p_channel_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Message.new().from_dict(data)


# Crosspost a message in a News Channel to following channels
#
# Needs the `SEND_MESSAGES` permission, if the current user sent the message, or additionally the `MANAGE_MESSAGES` permission, for all other messages, to be present for the current user
# @returns [Message] | [HTTPResponse] if error
func crosspost_message(p_channel_id: String, p_message_id: String) -> Message:
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_MESSAGE_CROSSPOST % [p_channel_id, p_message_id]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Message.new().from_dict(data)


# Edit a previously sent message
#
# The fields `content`, `embeds`, and `flags` can be edited by the original message author. Other users can only edit `flags` and only if they have the `MANAGE_MESSAGES` permission in the corresponding channel. When specifying flags, ensure to include all previously set flags/bits in addition to ones that you are modifying (unsupported flag changes are currently ignored without error)
# @returns [Message] | [HTTPResponse] if error
func edit_message(p_channel_id: String, p_message_id: String, p_params = {}) -> Message:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = EditMessageParams.new().from_dict(p_params)
	elif not p_params is EditMessageParams:
		DiscordUtils.perror("Discord.gd:edit_message:params must be a Dictionary or EditMessageParams")
	var data = yield(_send_patch_request(ENDPOINTS.CHANNEL_MESSAGE % [p_channel_id, p_message_id], p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Message.new().from_dict(data)


# Delete a message
#
# If operating on a guild channel and trying to delete a message that was not sent by the current user, requires the `MANAGE_MESSAGES` permission
# @returns [bool] | [HTTPResponse] if error
func delete_message(p_channel_id: String, p_message_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL_MESSAGE % [p_channel_id, p_message_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Delete multiple messages in a single request
#
# Can only be used on guild channels and requires the `MANAGE_MESSAGES` permission
#
# Any message IDs given that do not exist or are invalid will count towards the minimum and maximum message count (currently 2 and 100 respectively)
#
# *Will not delete messages older than 2 weeks, and will fail with a 400 BAD REQUEST [HTTPResponse] if any message provided is older than that or if any duplicate message IDs are provided*
#
# @returns [bool] | [HTTPResponse] if error
func delete_messages(p_channel_id: String, p_message_ids: Array) -> bool:
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_MESSAGES_BULKDELETE % p_channel_id, {messages = p_message_ids}), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Edit the channel permission overwrites for a user or role in a channel. Only usable for guild channels
#
# Requires the `MANAGE_ROLES` permission. Only permissions your bot has in the guild or parent channel (if applicable) can be allowed/denied (unless your bot has a `MANAGE_ROLES` overwrite in the channel)
# @returns [bool] | [HTTPResponse] if error
func edit_channel_permissions(p_channel_id: String, p_overwrite_id: String, p_params = {}) -> bool:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = EditChannelPermissionsParams.new().from_dict(p_params)
	elif not p_params is EditChannelPermissionsParams:
		DiscordUtils.perror("Discord.gd:edit_channel_permissions:params must be a Dictionary or EditChannelPermissionsParams")
	var data = yield(_send_put_request(ENDPOINTS.CHANNEL_PERMISSIONS % [p_channel_id, p_overwrite_id], p_params.to_dict()), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Delete a channel permission overwrite for a user or role in a channel. Only usable for guild channels
#
# Requires the `MANAGE_ROLES` permission
# @returns [bool] | [HTTPResponse] if error
func delete_channel_permissions(p_channel_id: String, p_overwrite_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL_PERMISSIONS % [p_channel_id, p_overwrite_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Get a list of invites (with metadata) for a given channel
#
# Requires the `MANAGE_CHANNELS` permission
# @returns [Array] of [Invite] | [HTTPResponse] if error
func get_channel_invites(p_channel_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.CHANNEL_INVITES % p_channel_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(Invite.new().from_dict(elm))
	return ret


# Create a new invite for a given channel. Only usable for guild channels
#
# Requires the `CREATE_INSTANT_INVITE` permission
# @returns [Invite] | [HTTPResponse] if error
func create_channel_invite(p_channel_id: String, p_params = {}) -> Invite:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = CreateChannelInvite.new().from_dict(p_params)
	elif not p_params is CreateChannelInvite:
		DiscordUtils.perror("Discord.gd:create_channel_invite:params must be a Dictionary or CreateChannelInvite")
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_INVITES % p_channel_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Invite.new().from_dict(data)


# Create a reaction for the message.
#
# Needs the `READ_MESSAGE_HISTORY` permission to be present on the current user. Additionally, if nobody else has reacted to the message using this emoji, requires the `ADD_REACTIONS` permission to be present on the current user
#
# For custom emojis, specify the emoji in the format `name:id`
# @returns [bool] | [HTTPResponse] if error
func create_reaction(p_channel_id: String, p_message_id: String, p_emoji: String) -> bool:
	var data = yield(_send_put_request(ENDPOINTS.REACTIONS_EMOJI_ME % [p_channel_id, p_message_id, p_emoji.percent_encode()]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Delete a reaction the current user has made for the message
#
# For custom emojis, specify the emoji in the format `name:id`
# @returns [bool] | [HTTPResponse] if error
func delete_own_reaction(p_channel_id: String, p_message_id: String, p_emoji: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.REACTIONS_EMOJI_ME % [p_channel_id, p_message_id, p_emoji.percent_encode()]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Delete another user's reaction from a message
#
# Needs the `MANAGE_MESSAGES` permission to be present on the current user.
#
# For custom emojis, specify the emoji in the format `name:id`
# @returns [bool] | [HTTPResponse] if error
func delete_user_reaction(p_channel_id: String, p_message_id: String, p_emoji: String, p_user_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.REACTIONS_EMOJI_USER % [p_channel_id, p_message_id, p_emoji.percent_encode(), p_user_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Get a list of users that reacted with this emoji.
#
# For custom emojis, specify the emoji in the format `name:id`
# @returns [Array] of [User] | [HTTPResponse] if error
func get_reactions(p_channel_id: String, p_message_id: String, p_emoji: String, p_params = {}) -> bool:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetReactionsParams.new().from_dict(p_params)
	elif not p_params is GetReactionsParams:
		DiscordUtils.perror("Discord.gd:get_reactions:params must be a Dictionary or GetReactionsParams")

	var endpoint = ENDPOINTS.REACTIONS_EMOJI
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string: endpoint += "?" + query_string

	var data = yield(_send_request(endpoint % [p_channel_id, p_message_id, p_emoji.percent_encode()]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(User.new().from_dict(elm))

	return ret


# Deletes all reactions on a message or all reactions for a given emoji if specified.
#
# Needs the `MANAGE_MESSAGES` permission to be present on the current user.
#
# For custom emojis, specify the emoji in the format `name:id`
# @returns [bool] | [HTTPResponse] if error
func delete_reactions(p_channel_id: String, p_message_id: String, p_emoji: String = "") -> bool:
	var endpoint = ENDPOINTS.REACTIONS % [p_channel_id, p_message_id]
	if p_emoji.length() > 0:
		endpoint = ENDPOINTS.REACTIONS_EMOJI % [p_channel_id, p_message_id, p_emoji]

	var data = yield(_send_delete_request(endpoint), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false

# Follow a News Channel to send messages to a target channel
#
# Requires the MANAGE_WEBHOOKS permission in the target channel.
# @returns [FollowedChannel] | [HTTPResponse] if error
func follow_news_channel(p_channel_id: String, p_webhook_channel_id: String) -> FollowedChannel:
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_FOLLOWERS % p_channel_id, {webhook_channel_id = p_webhook_channel_id}), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return FollowedChannel.new().from_dict(data)


# Trigger a typing indicator for the specified channel
#
# Generally bots should not implement this route. However, if a bot is responding to a command and expects the computation to take a few seconds, this endpoint may be called to let the user know that the bot is processing their message.
# @returns [FollowedChannel] | [HTTPResponse] if error
func trigger_typing(p_channel_id: String) -> bool:
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_TYPING % p_channel_id), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Adds a recipient to a Group DM using their access token
# @returns [bool] | [HTTPResponse] if error
func group_dm_add_recipient(p_channel_id: String, p_user_id: String, p_params = {}) -> bool:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GroupDmAddRecipientParams.new().from_dict(p_params)
	elif not p_params is GroupDmAddRecipientParams:
		DiscordUtils.perror("Discord.gd:get_channel_messages:params must be a Dictionary or GetChannelMessagesParams")
	var data = yield(_send_put_request(ENDPOINTS.CHANNEL_RECIPIENT % [p_channel_id, p_user_id], p_params.to_dict()), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Removes a recipient to a Group DM using their access token
# @returns [bool] | [HTTPResponse] if error
func group_dm_remove_recipient(p_channel_id: String, p_user_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL_RECIPIENT % [p_channel_id, p_user_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Creates a new thread from an existing message
#
# When called on a `GUILD_TEXT` channel, creates a `GUILD_PUBLIC_THREAD`. When called on a `GUILD_NEWS` channel, creates a `GUILD_NEWS_THREAD`. Does not work on a `GUILD_FORUM` channel. The id of the created thread will be the same as the id of the source message, and as such a message can only have a single thread created from it.
# @returns [Channel] | [HTTPResponse] if error
func start_thread_from_message(p_channel_id: String, p_message_id: String, p_params = {}) -> Channel:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = StartThreadWithMessageParams.new().from_dict(p_params)
	elif not p_params is StartThreadWithMessageParams:
		DiscordUtils.perror("Discord.gd:start_thread_from_message:params must be a Dictionary or StartThreadWithMessageParams")
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_MESSAGE_THREADS % [p_channel_id, p_message_id], p_params.to_dict()), "completed")

	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Creates a new thread that is not connected to an existing message.
#
# @returns [Channel] | [HTTPResponse] if error
func start_thread(p_channel_id: String, p_params = {}) -> Channel:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = StartThreadParams.new().from_dict(p_params)
	elif not p_params is StartThreadParams:
		DiscordUtils.perror("Discord.gd:start_thread:params must be a Dictionary or StartThreadParams")
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_THREADS % p_channel_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Creates a new thread in a forum channel, and sends a message within the created thread
#
# The current user must have the `SEND_MESSAGES` permission (`CREATE_PUBLIC_THREADS` is ignored)
# @returns [Channel] | [HTTPResponse] if error
func start_thread_in_forum(p_channel_id: String, p_params = {}) -> Channel:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = StartThreadInForumParams.new().from_dict(p_params)
	elif not p_params is StartThreadInForumParams:
		DiscordUtils.perror("Discord.gd:start_thread_in_forum:params must be a Dictionary or StartThreadInForumParams")
	var data = yield(_send_post_request(ENDPOINTS.CHANNEL_THREADS % p_channel_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Get a list of all [ThreadMember] of members of the thread
# @returns [Array] of [ThreadMember] | [HTTPResponse] if error
func get_thread_members(p_channel_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.CHANNEL_THREADMEMBERS % p_channel_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(ThreadMember.new().from_dict(elm))
	return ret


# Get a [ThreadMember] for the specified user if they are a member of the thread, returns a 404 [HTTPResponse] otherwise
# @returns [ThreadMember] | [HTTPResponse] if error
func get_thread_member(p_channel_id: String, p_user_id: String) -> ThreadMember:
	var data = yield(_send_request(ENDPOINTS.CHANNEL_THREADMEMBERS_USER % [p_channel_id, p_user_id]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return ThreadMember.new().from_dict(data)


# Adds another member to a thread
#
# Needs the ability to send messages in the thread, also needs the thread to be not archived
# @returns [bool] | [HTTPResponse] if error
func add_thread_member(p_channel_id: String, p_user_id: String) -> bool:
	var data = yield(_send_put_request(ENDPOINTS.CHANNEL_THREADMEMBERS_USER % [p_channel_id, p_user_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Removes another member from a thread
#
# Needs the `MANAGE_THREADS` permission, or the creator of the thread if it is a `GUILD_PRIVATE_THREAD`, also needs the thread to be not archived
# @returns [bool] | [HTTPResponse] if error
func remove_thread_member(p_channel_id: String, p_user_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL_THREADMEMBERS_USER % [p_channel_id, p_user_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Adds the current user to a thread
#
# Needs the thread to be not archived
# @returns [bool] | [HTTPResponse] if error
func join_thread(p_channel_id: String) -> bool:
	var data = yield(_send_put_request(ENDPOINTS.CHANNEL_THREADMEMBERS_ME % p_channel_id), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Removes the current user from a thread
#
# Needs the thread to be not archived
# @returns [bool] | [HTTPResponse] if error
func leave_thread(p_channel_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL_THREADMEMBERS_ME % p_channel_id), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# Get a list of archived threads in the channel that are public
#
# When called on a `GUILD_TEXT` channel, returns threads of type `GUILD_PUBLIC_THREAD`. When called on a `GUILD_NEWS` channel returns threads of type `GUILD_NEWS_THREAD`. Threads are ordered by `archive_timestamp`, in descending order
#
# Needs the `READ_MESSAGE_HISTORY` permission
# @returns [GetArchivedThreadsResponse] | [HTTPResponse] if error
func get_public_archived_threads(p_channel_id: String, p_params = {}) -> GetArchivedThreadsResponse:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetArchivedThreadsParams.new().from_dict(p_params)
	elif not p_params is GetArchivedThreadsParams:
		DiscordUtils.perror("Discord.gd:get_public_archived_threads:params must be a Dictionary or GetArchivedThreadsParams")

	var endpoint = ENDPOINTS.CHANNEL_THREADS_ARCHIVED_PUBLIC % p_channel_id
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string: endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return GetArchivedThreadsResponse.new().from_dict(data)


# Get a list of archived threads in the channel that are of type `GUILD_PRIVATE_THREAD`
#
# Threads are ordered by `archive_timestamp`, in descending order
#
# Needs both the `READ_MESSAGE_HISTORY` and `MANAGE_THREADS` permissions
# @returns [GetArchivedThreadsResponse] | [HTTPResponse] if error
func get_private_archived_threads(p_channel_id: String, p_params = {}) -> GetArchivedThreadsResponse:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetArchivedThreadsParams.new().from_dict(p_params)
	elif not p_params is GetArchivedThreadsParams:
		DiscordUtils.perror("Discord.gd:get_private_archived_threads:params must be a Dictionary or GetArchivedThreadsParams")

	var endpoint = ENDPOINTS.CHANNEL_THREADS_ARCHIVED_PRIVATE % p_channel_id
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string: endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return GetArchivedThreadsResponse.new().from_dict(data)


# Get a list of archived threads in the channel that are of type `GUILD_PRIVATE_THREAD` and the user has joined
#
# Threads are ordered by their `id`, in descending order
#
# Needs the `READ_MESSAGE_HISTORY`
# @returns [GetArchivedThreadsResponse] | [HTTPResponse] if error
func get_joined_private_archived_threads(p_channel_id: String, p_params = {}) -> GetArchivedThreadsResponse:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetArchivedThreadsParams.new().from_dict(p_params)
	elif not p_params is GetArchivedThreadsParams:
		DiscordUtils.perror("Discord.gd:get_joined_private_archived_threads:params must be a Dictionary or GetArchivedThreadsParams")

	var endpoint = ENDPOINTS.CHANNEL_USER_ME_THREADS_ARCHIVED_PRIVATE % p_channel_id
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string: endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return GetArchivedThreadsResponse.new().from_dict(data)


#! ----------
#! Emoji
#! ----------


# Get a list of [Emoji] for the given guild
# @returns [Array] of [Emoji] | [HTTPResponse] if error
func get_guild_emojis(p_guild_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.GUILD_EMOJIS % p_guild_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(Emoji.new().from_dict(elm))
	return ret


# Get a spefic emoji in the given guild
# @returns [Emoji] | [HTTPResponse] if error
func get_guild_emoji(p_guild_id: String, p_emoji_id: String) -> Emoji:
	var data = yield(_send_request(ENDPOINTS.GUILD_EMOJI % [p_guild_id, p_emoji_id]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Emoji.new().from_dict(data)


# Create a new emoji for the guild
#
# Needs the `MANAGE_EMOJIS_AND_STICKERS` permission
# @returns [Emoji] | [HTTPResponse] if error
func create_guild_emoji(p_guild_id: String, p_params = {}) -> Emoji:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = CreateGuildEmojiParams.new().from_dict(p_params)
	elif not p_params is CreateGuildEmojiParams:
		DiscordUtils.perror("Discord.gd:create_guild_emoji:params must be a Dictionary or CreateGuildEmojiParams")

	var data = yield(_send_post_request(ENDPOINTS.GUILD_EMOJIS % p_guild_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Emoji.new().from_dict(data)


# Modify an existing emoji in a guild
#
# Requires the `MANAGE_EMOJIS_AND_STICKERS` permission
# @returns [Emoji] | [HTTPResponse] if error
func modify_guild_emoji(p_guild_id: String, p_emoji_id: String, p_params = {}) -> Emoji:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = ModifyGuildEmojiParams.new().from_dict(p_params)
	elif not p_params is ModifyGuildEmojiParams:
		DiscordUtils.perror("Discord.gd:modify_guild_emoji:params must be a Dictionary or ModifyGuildEmojiParams")
	var data = yield(_send_patch_request(ENDPOINTS.GUILD_EMOJI % [p_guild_id, p_emoji_id], p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Emoji.new().from_dict(data)


# Delete an existing emoji in a guild
#
# Requires the `MANAGE_EMOJIS_AND_STICKERS` permission
# @returns [bool] | [HTTPResponse] if error
func delete_guild_emoji(p_guild_id: String, p_emoji_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.GUILD_EMOJI % [p_guild_id, p_emoji_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


# @hidden
const ENDPOINTS: Dictionary = {
	# AuditLog
	GUILD_AUDIT_LOGS = "/guilds/%s/audit-logs",

	# AutoModeration
	GUILD_AUTO_MODERATION_RULES = "/guilds/%s/auto-moderation/rules",
	GUILD_AUTO_MODERATION_RULE = "/guilds/%s/auto-moderation/rules/%s",

	# Channel
	CHANNEL = "/channels/%s",
	CHANNEL_MESSAGES = "/channels/%s/messages",
	CHANNEL_MESSAGE = "/channels/%s/messages/%s",
	CHANNEL_MESSAGE_CROSSPOST = "/channels/%s/messages/%s/crosspost",
	CHANNEL_MESSAGES_BULKDELETE = "/channels/%s/messages/bulk-delete",

	REACTIONS = "/channels/%s/messages/%s/reactions",
	REACTIONS_EMOJI = "/channels/%s/messages/%s/reactions/%s",
	REACTIONS_EMOJI_USER = "/channels/%s/messages/%s/reactions/%s/%s",
	REACTIONS_EMOJI_ME = "/channels/%s/messages/%s/reactions/%s/@me",

	CHANNEL_PERMISSIONS = "/channels/%s/permissions/%s",

	CHANNEL_INVITES = "/channels/%s/invites",

	CHANNEL_FOLLOWERS = "/channels/%s/followers",

	CHANNEL_TYPING = "/channels/%s/typing",

	CHANNEL_PINS = "/channels/%s/pins",
	CHANNEL_PIN = "/channels/%s/pins/%s",

	CHANNEL_RECIPIENT = "/channels/%s/recipients/%s",

	CHANNEL_THREADS = "/channels/%s/threads",
	CHANNEL_MESSAGE_THREADS = "/channels/%s/messages/%s/threads",

	CHANNEL_THREADMEMBERS = "/channels/%s/thread-members",
	CHANNEL_THREADMEMBERS_USER = "/channels/%s/thread-members/%s",
	CHANNEL_THREADMEMBERS_ME = "/channels/%s/thread-members/@me",
	CHANNEL_THREADS_ARCHIVED_PUBLIC = "/channels/%s/threads/archived/public",
	CHANNEL_THREADS_ARCHIVED_PRIVATE = "/channels/%s/threads/archived/private",
	CHANNEL_USER_ME_THREADS_ARCHIVED_PRIVATE = "/channels/%s/users/@me/threads/archived/private",

	# Emoji
	GUILD_EMOJIS = "/guilds/%s/emojis",
	GUILD_EMOJI = "/guilds/%s/emojis/%s",
}

var _base_url: String
var _auth_header = ""
var _headers = [
	"user-agent: DiscordBot (%s %s, Godot:%s)" % [DiscordMetadata.LIBRARY, DiscordMetadata.LIBRARY_URL, Engine.get_version_info()["string"]],
	"accept: application/json"
]


# @hidden
func _init() -> void:
	pause_mode = PAUSE_MODE_PROCESS
	_base_url = DiscordMetadata.REST_URL % DiscordMetadata.REST_VERSION


# @hidden
func get_class():
	return "DiscordRESTClient"


func _to_string() -> String:
	return "[%s:%d]" % [get_class(), get_instance_id()]


# @hidden
func _send_post_request(slug: String, payload = {}):
	return _send_request(slug, payload, HTTPClient.METHOD_POST)


# @hidden
func _send_patch_request(slug: String, payload = {}):
	return _send_request(slug, payload, HTTPClient.METHOD_PATCH)


# @hidden
func _send_put_request(slug: String, payload = {}):
	return _send_request(slug, payload, HTTPClient.METHOD_PUT)


# @hidden
func _send_delete_request(slug: String, payload = null):
	return _send_request(slug, payload, HTTPClient.METHOD_DELETE)


# @hidden
func _send_request(slug: String, payload = null, method := HTTPClient.METHOD_GET) -> HTTPResponse:
	var headers = _headers.duplicate(true)

	if not _auth_header == "":
		headers.append(_auth_header)

	var http_request = HTTPRequest.new()
	add_child(http_request)

	var request_string = ""
	if payload != null:
		headers.append("content-type: application/json")
		request_string = JSON.print(payload)

	http_request.call_deferred("request", _base_url + slug, headers, true, method, request_string)

	var data = yield(http_request, "request_completed")
	http_request.queue_free()

	# Check for errors
	var res := HTTPResponse.new(data[0], data[1], data[2], data[3])

	if res.is_error() or res.is_no_content():
		# Got some error or 204
		return res

	var json = res.get_json()
	return json
