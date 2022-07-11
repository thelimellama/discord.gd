# Represents a generic Discord gateway payload
#
# `s` and `t` are `null` when op is not `0` (Gateway Dispatch Opcode)
class_name GatewayPayload extends Dataclass

var op: int # Opcode for the payload
var d = null # [Dictionary] Event data `nullable`
var s = null # [int] Sequence number, used for resuming sessions and heartbeats `nullable`
var t = null # [String] The event name for this payload `nullable`

# @hidden
func _init().("GatewayPayload"): return self
