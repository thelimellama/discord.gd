# Represents a bitfield of Discord permissions.
# @tags Permissions
#
# `CREATE_INSTANT_INVITE`: Allows creation of instant invites
#
# `KICK_MEMBERS`: Allows kicking members
#
# `BAN_MEMBERS`: Allows banning members
#
# `ADMINISTRATOR`: Allows all permissions and bypasses channel permission overwrites
#
# `MANAGE_CHANNELS`: Allows management and editing of channels
#
# `MANAGE_GUILD`: Allows management and editing of the guild
#
# `ADD_REACTIONS`: Allows for the addition of reactions to messages
#
# `VIEW_AUDIT_LOG`: Allows for viewing of audit logs
#
# `PRIORITY_SPEAKER`: Allows for using priority speaker in a voice channel
#
# `STREAM`: Allows the user to go live
#
# `VIEW_CHANNEL`: Allows guild members to view a channel, which includes reading messages in text channels and joining voice channels
#
# `SEND_MESSAGES`: Allows for sending messages in a channel and creating threads in a forum (does not allow sending messages in threads)
#
# `SEND_TTS_MESSAGES`: Allows for sending of /tts messages
#
# `MANAGE_MESSAGES`: Allows for deletion of other users messages
#
# `EMBED_LINKS`: Links sent by users with this permission will be auto-embedded
#
# `ATTACH_FILES`: Allows for uploading images and files
#
# `READ_MESSAGE_HISTORY`: Allows for reading of message history
#
# `MENTION_EVERYONE`: Allows for using the @everyone tag to notify all users in a channel, and the @here tag to notify all online users in a channel
#
# `USE_EXTERNAL_EMOJIS`: Allows the usage of custom emojis from other servers
#
# `VIEW_GUILD_INSIGHTS`: Allows for viewing guild insights
#
# `CONNECT`: Allows for joining of a voice channel
#
# `SPEAK`: Allows for speaking in a voice channel
#
# `MUTE_MEMBERS`: Allows for muting members in a voice channel
#
# `DEAFEN_MEMBERS`: Allows for deafening of members in a voice channel
#
# `MOVE_MEMBERS`: Allows for moving of members between voice channels
#
# `USE_VAD`: Allows for using voice-activity-detection in a voice channel
#
# `CHANGE_NICKNAME`: Allows for modification of own nickname
#
# `MANAGE_NICKNAMES`: Allows for modification of other users nicknames
#
# `MANAGE_ROLES`: Allows management and editing of roles
#
# `MANAGE_WEBHOOKS`: Allows management and editing of webhooks
#
# MANAGE_EMOJIS_AND_STICKERS: Allows management and editing of emojis and stickers
#
# `USE_APPLICATION_COMMANDS`: Allows members to use application commands, including slash commands and context menu commands.
#
# `REQUEST_TO_SPEAK`: Allows for requesting to speak in stage channels. (This permission is under active development and may be changed or removed.)
#
# `MANAGE_EVENTS`: Allows for creating, editing, and deleting scheduled events
#
# `MANAGE_THREADS`: Allows for deleting and archiving threads, and viewing all private threads
#
# `CREATE_PUBLIC_THREADS`: Allows for creating public and announcement threads
#
# `CREATE_PRIVATE_THREADS`: Allows for creating private threads
#
# `USE_EXTERNAL_STICKERS`: Allows the usage of custom stickers from other servers
#
# `SEND_MESSAGES_IN_THREADS`: Allows for sending messages in threads
#
# `USE_EMBEDDED_ACTIVITIES`; Allows for using Activities (applications with the EMBEDDED flag) in a voice channel
#
# `MODERATE_MEMBERS`: Allows for timing out users to prevent them from sending or reacting to messages in chat and threads, and from speaking in voice and stage channels
class_name Permissions extends BitField

# Default bit = 104324673
var default_bit = 104324673

enum FLAGS {
	CREATE_INSTANT_INVITE = 1 << 0,
	KICK_MEMBERS = 1 << 1,
	BAN_MEMBERS = 1 << 2,
	ADMINISTRATOR = 1 << 3,
	MANAGE_CHANNELS = 1 << 4,
	MANAGE_GUILD = 1 << 5,
	ADD_REACTIONS = 1 << 6,
	VIEW_AUDIT_LOG = 1 << 7,
	PRIORITY_SPEAKER = 1 << 8,
	STREAM = 1 << 9,
	VIEW_CHANNEL = 1 << 10,
	SEND_MESSAGES = 1 << 11,
	SEND_TTS_MESSAGES = 1 << 12,
	MANAGE_MESSAGES = 1 << 13,
	EMBED_LINKS = 1 << 14,
	ATTACH_FILES = 1 << 15,
	READ_MESSAGE_HISTORY = 1 << 16,
	MENTION_EVERYONE = 1 << 17,
	USE_EXTERNAL_EMOJIS = 1 << 18,
	VIEW_GUILD_INSIGHTS = 1 << 19,
	CONNECT = 1 << 20,
	SPEAK = 1 << 21,
	MUTE_MEMBERS = 1 << 22,
	DEAFEN_MEMBERS = 1 << 23,
	MOVE_MEMBERS = 1 << 24,
	USE_VAD = 1 << 25,
	CHANGE_NICKNAME = 1 << 26,
	MANAGE_NICKNAMES = 1 << 27,
	MANAGE_ROLES = 1 << 28,
	MANAGE_WEBHOOKS = 1 << 29,
	MANAGE_EMOJIS_AND_STICKERS = 1 << 30,
	USE_APPLICATION_COMMANDS = 1 << 31,
	REQUEST_TO_SPEAK = 1 << 32,
	MANAGE_THREADS = 1 << 34,
	USE_PUBLIC_THREADS = 1 << 35,
	USE_PRIVATE_THREADS = 1 << 36,
	USE_EXTERNAL_STICKERS = 1 << 37,
}

# @hidden
func _init(bits = default_bit).(bits): return self
