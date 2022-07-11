# Represents a Discord activity assets
class_name ActivityAssets extends Dataclass

var large_image = null # [String] See [Activity Asset Image](https://discord.com/developers/docs/topics/gateway#activity-object-activity-asset-image) `optional`
var large_text = null # [String] Text displayed when hovering over the large image of the activity `optional`
var small_image = null # [String] See [Activity Asset Image](https://discord.com/developers/docs/topics/gateway#activity-object-activity-asset-image) `optional`
var small_text = null # [String] Sext displayed when hovering over the small image of the activity `optional`

# @hidden
func _init().("ActivityAssets"): return self
