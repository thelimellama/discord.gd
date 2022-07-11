# Caches various resources from Discord like users, channels, guilds, etc
class_name DiscordCache


var max_message_count: int = 25 # Number of messages per channel stored
var track_channels: bool = true # Whether to cache channels
var track_threads: bool = true # Whether to cache threads
var track_emojis: bool = true # Whether to cache emojis
var track_members: bool = true # Whether to cache members
var track_thread_members: bool = true # Whether to cache thread members
var track_roles: bool = true # Whether to cache roles
var track_voice: bool = true # Whether to cache voice channels
var track_presences: bool = true # Whether to cache presences

var guilds = {} # Maps guild.id to Guild [String] => [Guild]
var channels = {} # Maps channel.id to Channel [String] => [Channel]
var members = {} # Maps guild.id to a Dictionary that maps user.id to GuildMember [String] => [String] => [GuildMember]

var me = null # The current user


func cache_members_from_guild(p_guild: Guild):
	var guild_members = {}
	if p_guild.members != null:
		for member in p_guild.members:
			if member.user != null:
				p_guild[member.user.id] = member
	members[p_guild.id] = guild_members


# Adds a guild to the cache, or updates it if it already exists
func add_guild(p_guild: Guild):
	# Update channels
	if p_guild.channels != null:
		for channel in p_guild.channels:
			channels[channel.id] = channel

	# Update threads
	if p_guild.threads != null:
		for channel in p_guild.threads:
			channels[channel.id] = channel

	# Update members
	if p_guild.members != null:
		cache_members_from_guild(p_guild)

	# If the guild is not cached then cache it
	if not guilds.has(p_guild.id):
		guilds[p_guild.id] = p_guild
		return

	# Update any new values in the cached guild
	var _temp = guilds[p_guild.id]
	DiscordUtils.set_if_not_null(p_guild, "member_count", _temp.member_count)
	DiscordUtils.set_if_not_null(p_guild, "roles", _temp.roles)
	DiscordUtils.set_if_not_null(p_guild, "emojis", _temp.emojis)
	DiscordUtils.set_if_not_null(p_guild, "members", _temp.members)
	DiscordUtils.set_if_not_null(p_guild, "presences", _temp.presences)
	DiscordUtils.set_if_not_null(p_guild, "channels", _temp.channels)
	DiscordUtils.set_if_not_null(p_guild, "threads", _temp.threads)
	DiscordUtils.set_if_not_null(p_guild, "voice_states", _temp.voice_states)
	guilds[p_guild.id] = p_guild


# Removes a guild from the cache
func remove_guild(p_guild: Guild):
	if guilds.has(p_guild.id):
		guilds.erase(p_guild.id)


# Get a guild by id from the cache, if it exists
func get_guild(p_id: String) -> Guild:
	if guilds.has(p_id):
		return guilds[p_id]
	return null


# Adds a presence to the cache, or updates it if it already exists
# TODO: implement add_presence
# func add_presence(p_guild_id: String, p_presence: PresenceUpdate):
#	pass


# TODO: implement remove_presence
# func remove_presence(p_guild_id: String, p_presence: PresenceUpdate):
#	pass


# TODO: implement get_presence
# func get_presence(p_guild_id: String, p_user_id: String):
#	pass


# Adds a guild member to the cache, or updates it if it already exists
func add_member(p_guild_id: String, p_member: GuildMember):
	# Check if the member's guild is cached
	if not guilds.has(p_guild_id):
		return

	if not members.has(p_guild_id):
		return

	if p_member.user == null:
		return

	if not members[p_guild_id].has(p_member.user.id):
		members[p_guild_id][p_member.user.id] = p_member
		return

	DiscordUtils.set_if_not_null(p_member, "joined_at", members[p_guild_id][p_member.user.id].joined_at)
	members[p_guild_id][p_member.user.id] = p_member


# Removes a guild member to the cache
func remove_member(p_guild_id: String, p_member: GuildMember):
	# Check if the member's guild is cached
	if not guilds.has(p_guild_id):
		return

	if not members.has(p_guild_id):
		return

	if p_member.user == null:
		return

	if members[p_guild_id].has(p_member.user.id):
		members[p_guild_id].erase(p_member.user.id)


# Gets a guild member from the cache, if it exists
func get_member(p_guild_id: String, p_user_id: String) -> GuildMember:
	# Check if the member's guild is cached
	if not guilds.has(p_guild_id):
		return null

	if not guilds[p_guild_id].has(p_user_id):
		return null

	return guilds[p_guild_id][p_user_id]
