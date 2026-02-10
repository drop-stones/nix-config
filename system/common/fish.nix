{ pkgs, data, ... }:
{
  programs.fish.enable = true;

  users.users.${data.user.username} = {
    shell = pkgs.fish;
  };
}
