# Represents a Discord audit log change
class_name AuditLogChange extends Dataclass

var new_value = null # [Variant] (matches object field's type) New value of the key
var old_value = null # [Variant] (matches object field's type) Old value of the key
var key: String # Name of the changed entity, with a few exceptions


# @hidden
func _init().("AuditLogChange"): return self
