# Represents a list of Discord webhook types
class_name WebhookTypes

var INCOMING = 1 # Incoming Webhooks can post messages to channels with a generated token
var CHANNEL_FOLLOWER = 2 # Channel Follower Webhooks are internal webhooks used with Channel Following to post new messages into channels
var APPLICATION = 3 # Application webhooks are webhooks used with Interactions
