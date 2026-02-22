{ data, ... }:
{
  users.users.${data.user.username}.extraGroups = [
    "networkmanager"
  ];
}
