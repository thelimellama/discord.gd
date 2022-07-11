# Represents a list of Discord locales
class_name DiscordLocales

const EnglishUS = "en-US"
const EnglishGB = "en-GB"
const Bulgarian = "bg"
const ChineseCN = "zh-CN"
const ChineseTW = "zh-TW"
const Croatian = "hr"
const Czech = "cs"
const Danish = "da"
const Dutch = "nl"
const Finnish = "fi"
const French = "fr"
const German = "de"
const Greek = "el"
const Hindi = "hi"
const Hungarian = "hu"
const Italian = "it"
const Japanese = "ja"
const Korean = "ko"
const Lithuanian = "lt"
const Norwegian = "no"
const Polish = "pl"
const PortugueseBR = "pt-BR"
const Romanian = "ro"
const Russian = "ru"
const SpanishES = "es-ES"
const Swedish = "sv-SE"
const Thai = "th"
const Turkish = "tr"
const Ukrainian = "uk"
const Vietnamese = "vi"
const Unknown = ""

const Locales = {
	EnglishUS: "English (United States)",
	EnglishGB: "English (Great Britain)",
	Bulgarian: "Bulgarian",
	ChineseCN: "Chinese (China)",
	ChineseTW: "Chinese (Taiwan)",
	Croatian: "Croatian",
	Czech: "Czech",
	Danish: "Danish",
	Dutch: "Dutch",
	Finnish: "Finnish",
	French: "French",
	German: "German",
	Greek: "Greek",
	Hindi: "Hindi",
	Hungarian: "Hungarian",
	Italian: "Italian",
	Japanese: "Japanese",
	Korean: "Korean",
	Lithuanian: "Lithuanian",
	Norwegian: "Norwegian",
	Polish: "Polish",
	PortugueseBR: "Portuguese (Brazil)",
	Romanian: "Romanian",
	Russian: "Russian",
	SpanishES: "Spanish (Spain)",
	Swedish: "Swedish",
	Thai: "Thai",
	Turkish: "Turkish",
	Ukrainian: "Ukrainian",
	Vietnamese: "Vietnamese",
}

# Get the language name from a locale code (case sensitive)
static func from_code(p_locale_code: String) -> String:
	if not Locales.has(p_locale_code):
		return ""
	return Locales[p_locale_code]
