# Represents a bitfield of Discord message flags
#
# `CROSSPOSTED`: This message has been published to subscribed channels (via Channel Following)
#
# `IS_CROSSPOST`: This message originated from a message in another channel (via Channel Following)
#
# `SUPPRESS_EMBEDS`: Do not include any embeds when serializing this message
#
# `SOURCE_MESSAGE_DELETED`: The source message for this crosspost has been deleted (via Channel Following)
#
# `URGENT`: This message came from the urgent message system
#
# `HAS_THREAD`: This message has an associated thread, with the same id as the message
#
# `EPHEMERAL`: This message is only visible to the user who invoked the Interaction
#
# `LOADING`: This message is an Interaction Response and the bot is "thinking"
#
# `FAILED_TO_MENTION_SOME_ROLES_IN_THREAD`: This message failed to mention some roles and add their members to the thread
class_name MessageFlags extends BitField


# Default bit = 0
var default_bit = 0

enum FLAGS {
	CROSSPOSTED = 1 << 0,
	IS_CROSSPOST = 1 << 1,
	SUPPRESS_EMBEDS = 1 << 2,
	SOURCE_MESSAGE_DELETED = 1 << 3,
	URGENT = 1 << 4,
	HAS_THREAD = 1 << 5,
	EPHEMERAL = 1 << 6,
	LOADING = 1 << 7,
}


# @hidden
func _init(bits = default_bit).("MessageFlags", bits): return self
