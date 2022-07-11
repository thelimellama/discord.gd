# Represents a bitfield of Discord activity flags
class_name ActivityFlags extends BitField


# Default bit = 0
var default_bit = 0

enum FLAGS {
	NONE = 0,
	INSTANCE = 1 << 0,
	JOIN = 1 << 1,
	SPECTATE = 1 << 2,
	JOIN_REQUEST = 1 << 3,
	SYNC = 1 << 4,
	PLAY = 1 << 5,
	PARTY_PRIVACY_FRIENDS = 1 << 6,
	PARTY_PRIVACY_VOICE_CHANNEL = 1 << 7,
	EMBEDDED = 1 << 8,
}


# @hidden
func _init(bits = default_bit).("ActivityFlags", bits): return self
