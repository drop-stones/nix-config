# AccountsService configuration for user profile (icon, user config)
{ localLib, host, ... }: localLib.importsModule ./. { inherit host; }
