# Params for get channel messages
class_name GetChannelMessagesParams extends Dataclass


var around = null # [String] Get messages around this message ID
var before = null # [String] Get messages before this message ID
var after = null # [String] Get messages after this message ID
var limit = null # [int] Max number of messages to return (1-100)


# @hidden
func _init().("GetChannelMessagesParams", {include_null_in_dict = false}): return self
