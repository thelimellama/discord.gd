# Represents a list of Discord gateway close event codes
class_name GatewayCloseEventCodes

const UNKNOWN_ERROR = 4000
const UNKNOWN_OPCODE = 4001
const DECODE_ERROR = 4002
const NOT_AUTHENTICATED = 4003
const AUTHENTICATION_FAILED = 4004
const ALREADY_AUTHENTICATED = 4005
const INVALID_SEQ = 4007
const RATE_LIMITED = 4008
const SESSION_TIMED_OUT = 4009
const INVALID_SHARD = 4010
const SHARDING_REQUIRED = 4011
const INVALID_API_VERSION_Y = 4012
const INVALID_INTENTS = 4013
const DISALLOWED_INTENTS = 4014


const Codes = {
	UNKNOWN_ERROR = {
		code = 4000,
		description = "Unknown error",
		explanation = "We're not sure what went wrong. Try reconnecting?",
		reconnect = true,
	},
	UNKNOWN_OPCODE = {
		code = 4001,
		description = "Unknown opcode",
		explanation = "You sent an invalid Gateway opcode or an invalid payload for an opcode. Don't do that!",
		reconnect = true,
	},
	DECODE_ERROR = {
		code = 4002,
		description = "Decode error",
		explanation = "You sent an invalid payload to us. Don't do that!",
		reconnect = true,
	},
	NOT_AUTHENTICATED = {
		code = 4003,
		description = "Not authenticated",
		explanation = "You sent us a payload prior to identifying.",
		reconnect = true,
	},
	AUTHENTICATION_FAILED = {
		code = 4004,
		description = "Authentication failed",
		explanation = "The account token sent with your identify payload is incorrect.",
		reconnect = false,
	},
	ALREADY_AUTHENTICATED = {
		code = 4005,
		description = "Already authenticated",
		explanation = "You sent more than one identify payload. Don't do that!",
		reconnect = true,
	},
	INVALID_SEQ = {
		code = 4007,
		description = "Invalid seq",
		explanation = "The sequence sent when resuming the session was invalid. Reconnect and start a new session.",
		reconnect = true,
	},
	RATE_LIMITED = {
		code = 4008,
		description = "Rate limited.",
		explanation = "You're sending payloads to us too quickly. Slow it down! You will be disconnected on receiving this.",
		reconnect = true,
	},
	SESSION_TIMED = {
		code = 4009,
		description = "Session timed out",
		explanation = "Your session timed out. Reconnect and start a new one.",
		reconnect = true,
	},
	INVALID_SHARD = {
		code = 4010,
		description = "Invalid shard",
		explanation = "You sent us an invalid shard when identifying.",
		reconnect = false,
	},
	SHARDING_REQUIRED = {
		code = 4011,
		description = "Sharding required",
		explanation = "The session would have handled too many guilds - you are required to shard your connection in order to connect.",
		reconnect = false,
	},
	INVALID_API_VERSION = {
		code = 4012,
		description = "Invalid API version",
		explanation = "You sent an invalid version for the gateway.",
		reconnect = false,
	},
	INVALID_INTENT = {
		code = 4013,
		description = "Invalid intent(s)",
		explanation = "You sent an invalid intent for a Gateway Intent. You may have incorrectly calculated the bitwise value.",
		reconnect = false,
	},
	DISALLOWED_INTENT = {
		code = 4014,
		description = "Disallowed intent(s)",
		explanation = "You sent a disallowed intent for a Gateway Intent. You may have tried to specify an intent that you have not enabled or are not approved for.",
		reconnect = false,
	}
}


# Get the data from a close event code
static func from_code(p_close_code: int) -> Dictionary:
	if not Codes.has(p_close_code):
		return {}
	return Codes[p_close_code]
