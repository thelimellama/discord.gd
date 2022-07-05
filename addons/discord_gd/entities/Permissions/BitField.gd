# Data structure that makes it easy to interact with a bitfield.
#
# BitFieldResolvable: [BitField] | [String] | int | [Array] of BitFieldResolvable
class_name BitField

# Bitfield of the packed bits
var bitfield: int

# Bitfield representing all available bits combined
var ALL: int

#! Defined by children
#! var default_bit() = 0
#! var FLAGS = {}

# Adds bits to these ones.
# @param bits: BitFieldResolvable | [Array] of BitFieldResolvable Bits to add
# @returns self
func add(bits):
	if not typeof(bits) == TYPE_ARRAY:
		bits = [bits]
	var total = get_default_bit()
	for bit in bits:
		total |= resolve(bit)
	bitfield |= total
	return self


# Checks whether the bitfield has a bit, or any of multiple bits.
# @param bit: BitFieldResolvable Bit(s) to check for
# @returns bool
func any(bit) -> bool:
	return (bitfield & resolve(bit)) != get_default_bit()


# Checks if this bitfield equals another
# @param bit: BitFieldResolvable Bit(s) to check for
# @returns bool
func equals(bit) -> bool:
	return bitfield == resolve(bit)


# Checks whether the bitfield has a bit, or multiple bits.
# @param bit: BitFieldResolvable Bit(s) to check for
# @returns bool
func has(bit) -> bool:
	bit = resolve(bit)
	return (bitfield & bit) == bit


# Gets all given bits that are missing from the bitfield.
# @param bits: BitFieldResolvable Bit(s) to check for
# @returns [Array] of [String]
func missing(bits) -> Array:
	return self.get_script().new(bits).remove(self).to_array()


# Removes bits from these.
# @param bits: BitFieldResolvable Bits to remove
# @returns self
func remove(bits):
	if typeof(bits) == TYPE_OBJECT and bits.is_class(self.get_class()):
		bits = bits.bitfield

	if not typeof(bits) == TYPE_ARRAY:
		bits = [bits]

	var total = get_default_bit()
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


# Gets an [Array] of bitfield names based on the bits available.
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


# Resolves bitfields to their numeric form.
# @param bit: BitFieldResolvable Bit(s) to resolve
# @returns int
func resolve(bit) -> int:
#	if typeof(get_default_bit()) == TYPE_INT or typeof(get_default_bit()) == TYPE_REAL:
#		set("default_bit", int(get_default_bit()))

	if typeof(bit) == TYPE_INT or typeof(bit) == TYPE_REAL:
		return int(bit)

	if typeof(get_default_bit()) == typeof(bit):
		if bit >= get_default_bit():
			return bit

	if typeof(bit) == TYPE_OBJECT and bit.is_class(self.get_class()):
		return bit.bitfield

	if (typeof(bit) == TYPE_ARRAY):
		var ret = get_default_bit()

		for b in bit:
			ret = ret | resolve(b)
		return ret

	if (Helpers.is_valid_str(bit)):
		var _FLAGS = get_flags()
		if (_FLAGS.has(bit)):
			return _FLAGS[bit]

		if (not is_nan(float(bit))):
			return int(bit)

	assert(false, 'Bitfield is invalid.')
	return -1

# @hidden
func get_flags() -> Dictionary:
	return get("FLAGS")


# @hidden
func get_default_bit() -> int:
	return get("default_bit")

# @param bits: BitFieldResolvable Bit(s) to set
# @returns self
func _init(p_name: String, bits = get_default_bit()):
	__name__ = p_name

	if bits == null:
		bits = get_default_bit()
	bitfield = resolve(bits)

	var values = get_flags().values()
	var prev = get_default_bit()
	for value in values:
		prev |= value
	set("ALL", prev)

	return self


# @hidden
func _to_dict():
	if typeof(bitfield) == TYPE_INT:
		return bitfield
	else:
		return str(bitfield)


var __name__: String

func _to_string():
	return __name__ + "(" + str(bitfield) + ")"
