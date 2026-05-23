{ host, ... }:
{
  users.users.${host.user.username}.extraGroups = [
    "networkmanager"
  ];
}
