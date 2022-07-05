# Represents the OAuth2Scopes that Discord supports
#
# List of all the OAuth2 scopes that Discord supports. Some scopes require approval from Discord to use. Requesting them from a user without approval from Discord may cause errors or undocumented behavior in the OAuth2 flow.
class_name OAuth2Scopes

const ACTIVITIES_READ = "activities.read" # Allows your app to fetch data from a user's "Now Playing/Recently Played" list - requires Discord approval
const ACTIVITIES_WRITE = "activities.write" # Allows your app to update a user's activity - requires Discord approval (NOT REQUIRED FOR GAMESDK ACTIVITY MANAGER)
const APPLICATIONS_BUILDS_READ = "applications.builds.read" # Allows your app to read build data for a user's applications
const APPLICATIONS_BUILDS_UPLOAD = "applications.builds.upload" # Allows your app to upload/update builds for a user's applications - requires Discord approval
const APPLICATIONS_COMMANDS = "applications.commands" # Allows your app to use commands in a guild
const APPLICATIONS_COMMANDS_UPDATE = "applications.commands.update" # Allows your app to update its commands using a Bearer token - client credentials grant only
const APPLICATIONS_COMMANDS_PERMISSIONS_UPDATE = "applications.commands.permissions.update" # Allows your app to update permissions for its commands in a guild a user has permissions to
const APPLICATIONS_ENTITLEMENTS = "applications.entitlements" # Allows your app to read entitlements for a user's applications
const APPLICATIONS_STORE_UPDATE = "applications.store.update" # Allows your app to read and update store data (SKUs, store listings, achievements, etc.) for a user's applications
const BOT = "bot" # For oauth2 bots, this puts the bot in the user's selected guild by default
const CONNECTIONS = "connections" # Allows /users/@me/connections to return linked third-party accounts
const DM_CHANNELS_READ = "dm_channels.read" # Allows your app to see information about the user's DMs and group DMs - requires Discord approval
const EMAIL = "email" # Enables /users/@me to return an email
const GDM_JOIN = "gdm.join" # Allows your app to join users to a group dm
const GUIDS = "guilds" # Allows /users/@me/guilds to return basic information about all of a user's guilds
const GUIDS_JOIN = "guilds.join" # Allows /guilds/{guild.id}/members/{user.id} to be used for joining users to a guild
const GUIDS_MEMBERS_ADD = "guilds.members.read" # Allows /users/@me/guilds/{guild.id}/member to return a user's member information in a guild
const IDENTITY = "identify" # Allows /users/@me without email
const MESSAGES_READ = "messages.read" # For local rpc server api access, this allows you to read messages from all client channels (otherwise restricted to channels/guilds your app creates)
const RELATIONSHIPS_READ = "relationships.read" # Allows your app to know a user's friends and implicit relationships - requires Discord approval
const RPC = "rpc" # For local rpc server access, this allows you to control a user's local Discord client - requires Discord approval
const RPC_ACTIVITIES_WRITE = "rpc.activities.write" # For local rpc server access, this allows you to update a user's activity - requires Discord approval
const RPC_NOTIFICATIONS_READ = "rpc.notifications.read" # For local rpc server access, this allows you to receive notifications pushed out to the user - requires Discord approval
const RPC_VOICE_READ = "rpc.voice.read" # For local rpc server access, this allows you to read a user's voice settings and listen for voice events - requires Discord approval
const RPC_VOICE_WRITE = "rpc.voice.write" # For local rpc server access, this allows you to update a user's voice settings - requires Discord approval
const VOICE = "voice" # Allows your app to connect to voice on user's behalf and see all the voice members - requires Discord approval
const WEBHOOK_INCOMING = "webhook.incoming" # This generates a webhook that is returned in the oauth token response for authorization code grants

