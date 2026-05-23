{ pkgs, host, ... }:
{
  # Set fish as login shell
  users.users.${host.user.username} = {
    shell = pkgs.fish;
  };
}
