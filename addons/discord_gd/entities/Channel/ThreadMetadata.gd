# Represents a Discord thread metadata
class_name ThreadMetadata extends DiscordDataclass

var archived: bool # Whether the thread is archived
var auto_archive_duration: int # Duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080
var archive_timestamp: String # Timestamp when the thread's archive status was last changed, used for calculating recent activity
var locked: bool # Whether the thread is locked; when a thread is locked, only users with `MANAGE_THREADS` can unarchive it
var invitable = null # [bool] Whether non-moderators can add other non-moderators to a thread; only available on private threads `optional`
var create_timestamp = null # [String] Timestamp when the thread was created; only populated for threads created after 2022-01-09 `optional` `nullable`


# @hidden
func _init().("ThreadMetadata"): return self
