# Class that makes it easy to interact with a bitfield
#
# This class is to be used by extending this class and defining the `default_bit` property and `FLAGS` enum
#
# BitFieldResolvable: [BitField] | [String] | [int] | [Array] of BitFieldResolvable
class_name BitField


# Bitfield of the packed bits
var bitfield: int

# Bitfield representing all available bits combined
var ALL: int

#! Defined by children
#! var default_bit() = 0
#! var FLAGS = {}

# Adds bits to these ones
# @param bits: BitFieldResolvable | [Array] of BitFieldResolvable Bits to add
# @returns self
func add(bits):
	if not typeof(bits) == TYPE_ARRAY:
		bits = [bits]
	var total = 0
	for bit in bits:
		total |= resolve(bit)
	bitfield |= total
	return self


# Checks whether the bitfield has a bit, or any of multiple bits
# @param bit: BitFieldResolvable Bit(s) to check for
# @returns bool
func any(bits) -> bool:
	return (bitfield & resolve(bits)) != get_default_bit()


# Checks if this bitfield equals another
# @param bit: BitFieldResolvable Bit(s) to check for
# @returns bool
func equals(bit) -> bool:
	return bitfield == resolve(bit)


# Checks whether the bitfield has a bit, or multiple bits
# @param bit: BitFieldResolvable Bit(s) to check for
# @returns bool
func has(bit) -> bool:
	bit = resolve(bit)
	return (bitfield & bit) == bit


# Gets all given bits that are missing from the bitfield
# @param bits: BitFieldResolvable Bit(s) to check for
# @returns [Array] of [String]
func missing(bits) -> Array:
	return get_script().new(bits).remove(self).to_array()


# Removes bits from these
# @param bits: BitFieldResolvable Bits to remove
# @returns self
func remove(bits):
	if typeof(bits) == TYPE_OBJECT and bits.is_class(get_class()):
		bits = bits.bitfield

	if not typeof(bits) == TYPE_ARRAY:
		bits = [bits]

	var total = 0
	for bit in bits:
		total |= resolve(bit)
	bitfield &= ~total
	return self


# Gets a Dictionary mapping field names to a boolean indicating whether the bit is set.
# @returns [Dictionary]
func serialize() -> Dictionary:
	var serialized = {}

	var _FLAGS = get_flags()
	var flags = _FLAGS.keys()
	var bits = _FLAGS.values()

	var i = 0
	for flag in flags:
		var bit = bits[i]
		serialized[flag] = has(bit)
		i += 1

	return serialized


# Gets an [Array] of bitfield names based on the bits available
# @returns [Array] of [String]
func to_array() -> Array:
	var ret = []

	var _FLAGS = get_flags()
	var flags = _FLAGS.keys()
	var bits = _FLAGS.values()

	var i = 0
	for flag in flags:
		var bit = bits[i]
		if has(bit):
			ret.append(flag)
		i += 1

	return ret


# Resolves bitfields to their numeric form
# @param bit: BitFieldResolvable Bit(s) to resolve
# @returns int
func resolve(bit) -> int:
	var typeof_bit = typeof(bit)

	if typeof_bit == TYPE_INT or typeof_bit == TYPE_REAL:
		return int(bit)

	if typeof(get_default_bit()) == typeof_bit:
		if bit >= get_default_bit():
			return bit

	if typeof_bit == TYPE_OBJECT and bit.is_class(get_class()):
		return bit.bitfield

	if typeof_bit == TYPE_ARRAY:
		var ret = 0
		for b in bit:
			ret |= resolve(b)
		return ret

	if typeof_bit == TYPE_STRING and bit.length() > 0:
		var _FLAGS = get_flags()
		if _FLAGS.has(bit):
			return _FLAGS[bit]

		if bit.is_valid_integer():
			return int(bit)

	DiscordUtils.perror("%s:resolve:Unable to resolve the bitfield: %s" % [get_class(), bit])
	return -1


# Create a new [BitField]
# @param name: String Name of the bitfield
# @param bits?: BitFieldResolvable The bit(s) to set
# @returns self
func _init(name: String, bits = get_default_bit()):
	__name__ = name

	bitfield = resolve(bits)

	var values = get_flags().values()
	var prev = get_default_bit()
	for value in values:
		prev |= value
	set("ALL", prev)

	return self


var __name__: String


func _to_string():
	return __name__ + "(" + str(bitfield) + ")"


# @hidden
func get_class():
	return __name__


# @hidden
func get_flags() -> Dictionary:
	return get("FLAGS")


# @hidden
func get_default_bit() -> int:
	return get("default_bit")
