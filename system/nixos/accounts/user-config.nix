# User configuration file for AccountsService
{ data, pkgs, ... }:
let
  inherit (data.user) username;

  userConfig = pkgs.writeText "accountsservice-user-${username}" ''
    [User]
    Icon=/var/lib/AccountsService/icons/${username}
  '';
in
{
  systemd.tmpfiles.rules = [
    "d /var/lib/AccountsService/users 0700 root root -"
    "C+ /var/lib/AccountsService/users/${username} 0600 root root - ${userConfig}"
  ];
}
