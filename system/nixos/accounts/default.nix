# AccountsService configuration for user profile (icon, user config)
{ localLib, host, ... }: localLib.importModules ./. { inherit host; }
