# Represents a list of Discord activity types
#
# The streaming type currently only supports Twitch and YouTube. Only `https://twitch.tv/` and `https://youtube.com/` urls will work.
class_name ActivityTypes

const GAME = 0 # Playing {name}
const STREAMING = 1 # Streaming {details}
const LISTENING = 2 # Listening to {name}
const WATCHING = 3 # Watching {name}
const CUSTOM = 4 # {emoji} {name}
const COMPETING = 5 # Competing in {name}
