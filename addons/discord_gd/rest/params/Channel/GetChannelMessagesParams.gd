# Params for get channel messages
#
# The `around`, `before`, and `after` parameters are mutually exclusive, only one may be passed at a time
class_name GetChannelMessagesParams extends DiscordDataclass


var around = null # [String] Get messages around this message id `optional`
var before = null # [String] Get messages before this message id `optional`
var after = null # [String] Get messages after this message id `optional`
var limit = null # [int] Max number of messages to return (1-100) (default is 50) `optional`


# @hidden
func _init().("GetChannelMessagesParams"): return self
