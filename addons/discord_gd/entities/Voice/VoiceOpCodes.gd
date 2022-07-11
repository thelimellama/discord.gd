# Represents a list of Discord voice op codes
class_name VoiceOpCodes

const IDENTIFY = 0 # Begin a voice websocket connection
const SELECT_PROTOCOL = 1 # Select the voice protocol
const READY_SERVER = 2 # Complete the websocket handshake
const HEARTBEAT = 3 # Keep the websocket connection alive
const SESSION_DESCRIPTION = 4 # Describe the session
const SPEAKING = 5 # Indicate which users are speaking
const HEARTBEAT_ACK = 6 # Sent to acknowledge a received client heartbeat
const RESUME = 7 # Resume a connection
const HELLO = 8 # Time to wait between sending heartbeats in milliseconds
const RESUMED = 9 # Acknowledge a successful session resume
const CLIENT_DISCONNECT = 13 # A client has disconnected from the voice channel
