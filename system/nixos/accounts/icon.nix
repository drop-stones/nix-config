# Profile icon for AccountsService (used by greeter, lock screen, etc.)
{ host, localLib, ... }:
let
  inherit (host.user) username;
  iconPath = localLib.fromRoot "data/icon.jpg";
in
{
  systemd.tmpfiles.rules = [
    "d /var/lib/AccountsService/icons 0755 root root -"
    "L+ /var/lib/AccountsService/icons/${username} - - - - ${iconPath}"
  ];
}
