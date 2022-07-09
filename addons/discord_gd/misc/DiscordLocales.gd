# Represents a list of locales and their data supported by Discord
class_name DiscordLocales

const Locales = {
	"da": {
		name = "Danish",
	},
	"de": {
		name = "German",
	},
	"en-GB": {
		name = "English, UK",
	},
	"en-US": {
		name = "English, US",
	},
	"es-ES": {
		name = "Spanish",
	},
	"fr": {
		name = "French",
	},

	"hr": {
		name = "Croatian",
	},
	"it": {
		name = "Italian",
	},
	"lt": {
		name = "Lithuanian",
	},
	"hu": {
		name = "Hungarian",
	},
	"nl": {
		name = "Dutch",
	},
	"no": {
		name = "Norwegian",
	},
	"pl": {
		name = "Polish",
	},
	"pt-BR": {
		name = "Brazilian Portuguese",
	},
	"ro": {
		name = "Romanian, Romania",
	},
	"fi": {
		name = "Finnish",
	},
	"sv-SE": {
		name = "Swedish",
	},
	"vi": {
		name = "Vietnamese",
	},
	"tr": {
		name = "Turkish",
	},
	"cs": {
		name = "Czech",
	},
	"el": {
		name = "Greek",
	},
	"bg": {
		name = "Bulgarian",
	},
	"ru": {
		name = "Russian",
	},
	"uk": {
		name = "Ukrainian",
	},
	"hi": {
		name = "Hindi",
	},
	"th": {
		name = "Thai",
	},
	"zh-CN": {
		name = "Chinese, China",
	},
	"ja": {
		name = "Japanese",
	},
	"zh-TW": {
		name = "Chinese, Taiwan",
	},
	"ko": {
		name = "Korean",
	},
}


static func get_locale_data(p_locale: String) -> Dictionary:
	p_locale = p_locale.to_lower()
	if not Locales.has(p_locale):
		return {}
	return Locales[p_locale]
