# Params for group dm add recipient
class_name GroupDmAddRecipientParams extends Dataclass

var access_token: String # Access token of a user that has granted your app the `gdm.join` scope
var nick: String # Nickname of the user being added


# @hidden
func _init().("GroupDmAddRecipientParams", {include_null_in_dict = false}): return self
