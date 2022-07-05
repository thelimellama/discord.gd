# Represents a bitfield of Discord channel flags
#
# `PINNED`: This thread is pinned to the top of its parent forum channel
class_name ChannelFlags extends BitField


# Default bit = 0
var default_bit = 0

enum FLAGS {
	PINNED = 1 << 1,
}


# @hidden
func _init(bits = default_bit).("ChannelFlags", bits): return self
