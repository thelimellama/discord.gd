# Represents a list of Discord explicit content filter levels
class_name ExplicitContentFilterLevel

const DISABLED = 0 # Media content will not be scanned
const MEMBERS_WITHOUT_ROLES = 1 # Media content sent by members without roles will be scanned
const ALL_MEMBERS = 2 # Media content sent by all members will be scanned
