{ host, ... }:
{
  users.users.${host.user.username} = {
    isNormalUser = true;
  };
}
