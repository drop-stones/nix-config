{ pkgs, user, ... }:
{
  programs.fish.enable = true;

  users.users.${user.username} = {
    isNormalUser = true;
    shell = pkgs.fish;
  };
}
