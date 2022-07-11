# Represents a list of Discord gateway opcodes
class_name GatewayOpcodes

const DISPATCH = 0 # An event was dispatched.
const HEARTBEAT = 1 # Fired periodically by the client to keep the connection alive.
const IDENTIFY = 2 # Starts a new session during the initial handshake.
const PRESENCE_UPDATE = 3 # Update the client's presence.
const VOICE_STATE_UPDATE = 4 # Used to join/leave or move between voice channels.
const RESUME = 6 # Send	Resume a previous session that was disconnected.
const RECONNECT = 7 # You should attempt to reconnect and resume immediately.
const REQUEST_GUILD_MEMBERS = 8 # Request information about offline guild members in a large guild.
const INVALID_SESSION = 9 #The session has been invalidated. You should reconnect and identify/resume accordingly.
const HELLO = 10 # Sent immediately after connecting, contains the heartbeat_interval to use.
const HEARTBEAT_ACK = 11 # Sent in response to receiving a heartbeat to acknowledge that it has been received.
