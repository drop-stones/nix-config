{ host, ... }:
{
  users.users.${host.user.username} = {
    home = host.user.homeDirectory;
  };
}
