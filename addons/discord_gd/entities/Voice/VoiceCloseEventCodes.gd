# Represents a list of Discord voice close event codes
class_name VoiceCloseEventCodes

const UNKNOWN_OPCODE = 4001
const FAILED_DECODE = 4002
const NOT_AUTHENTICATED = 4003
const AUTHENTICATION_FAILED = 4004
const ALREADY_AUTHENTICATED = 4005
const INVALID_SESSION = 4006
const SESSION_TIMEOUT = 4009
const SERVER_NOT_FOUND = 4011
const UNKNOWN_PROTOCOL = 4012
const DISCONNECTED_CHANNEL = 4014
const VOICE_SERVER_CRASH = 4015
const UNKNOWN_ENCRYPTION_MODE = 4016

const Codes = {
	UNKNOWN_OPCODE = {
		code = 4001,
		description = "Unknown opcode",
		explanation = "You sent an invalid opcode.",
	},
	FAILED_DECODE = {
		code = 4002,
		description = "Failed to decode payload",
		explanation = "You sent a invalid payload in your identifying to the Gateway.",
	},
	NOT_AUTHENTICATED = {
		code = 4003,
		description = "Not authenticated",
		explanation = "You sent a payload before identifying with the Gateway.",
	},
	AUTHENTICATION_FAILED = {
		code = 4004,
		description = "Authentication failed",
		explanation = "The token you sent in your identify payload is incorrect.",
	},
	ALREADY_AUTHENTICATED = {
		code = 4005,
		description = "Already authenticated",
		explanation = "You sent more than one identify payload. Stahp.",
	},
	INVALID_SESSION = {
		code = 4006,
		description = "Session no longer valid",
		explanation = "Your session is no longer valid.",
	},
	SESSION_TIMEOUT = {
		code = 4009,
		description = "Session timeout",
		explanation = "Your session has timed out.",
	},
	SERVER_NOT_FOUND = {
		code = 4011,
		description = "Server not found",
		explanation = "We can't find the server you're trying to connect to.",
	},
	UNKNOWN_PROTOCOL = {
		code = 4012,
		description = "Unknown protocol",
		explanation = "We didn't recognize the protocol you sent.",
	},
	DISCONNECTED_CHANNEL = {
		code = 4014,
		description = "Disconnected",
		explanation = "Channel was deleted, you were kicked, voice server changed, or the main gateway session was dropped. Don't reconnect.",
	},
	VOICE_SERVER_CRASH = {
		code = 4015,
		description = "Voice server crashed",
		explanation = "The server crashed. Our bad! Try resuming.",
	},
	UNKNOWN_ENCRYPTION_MODE = {
		code = 4016,
		description = "Unknown encryption mode",
		explanation = "We didn't recognize your encryption.",
	}
}


# Get the data from a close event code
static func from_code(p_close_code: int) -> Dictionary:
	if not Codes.has(p_close_code):
		return {}
	return Codes[p_close_code]
