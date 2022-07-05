# Represents a list of Discord guild verification levels
class_name GuildVerificationLevel

const NONE = 0 # Unrestricted
const LOW = 1 # Must have verified email on account
const MEDIUM = 2 # Must be registered on Discord for longer than 5 minutes
const HIGH = 3 # Must be a member of the server for longer than 10 minutes
const VERY_HIGH = 4 # Must have a verified phone number
