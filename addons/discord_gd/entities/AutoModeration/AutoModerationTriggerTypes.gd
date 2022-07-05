# Represents a list of Discord auto moderation trigger types
#
# Characterizes the type of content which can trigger the rule.
class_name AutoModerationTriggerTypes

const KEYWORD = 1 # Check if content contains words from a user defined list of keywords
const HARMFUL_LINK = 2 # Check if content contains any harmful links
const SPAM = 3 # Check if content represents generic spam
const KEYWORD_PRESET = 4 # Check if content contains words from internal pre-defined wordsets
