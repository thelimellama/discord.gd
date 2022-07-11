# Represents a list of Discord HTTP response codes
class_name HTTPResponseCodes

const OK = 200
const CREATED = 201
const NOCONTENT = 204
const NOTMODIFIED = 304
const BADREQUEST = 400
const UNAUTHORIZED = 401
const FORBIDDEN = 403
const NOTFOUND = 404
const METHODNOTALLOWED = 405
const TOOMANYREQUESTS = 429
const GATEWAYUNAVAILABLE = 502
const SERVERERROR = 500 # 5xx (500 Not Guaranteed)

const Codes = {
	OK = "The request completed successfully.",
	CREATED = "The entity was created successfully.",
	NOCONTENT = "The request completed successfully but returned no content.",
	NOTMODIFIED = "The entity was not modified (no action was taken).",
	BADREQUEST = "The request was improperly formatted, or the server couldn't understand it.",
	UNAUTHORIZED = "The Authorization header was missing or invalid.",
	FORBIDDEN = "The Authorization token you passed did not have permission to the resource.",
	NOTFOUND = "The resource at the location specified doesn't exist.",
	METHODNOTALLOWED = "The HTTP method used is not valid for the location specified.",
	TOOMANYREQUESTS = "You are being rate limited, see Rate Limits.",
	GATEWAYUNAVAILABLE = "There was not a gateway available to process your request. Wait a bit and retry.",
	SERVERERROR = "The server had an error processing your request (these are rare).",
}


# Get the data from a response code
static func from_code(p_response_code: int) -> String:
	if not Codes.has(p_response_code):
		return ""
	return Codes[p_response_code]
