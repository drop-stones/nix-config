{ pkgs, data, ... }:
{
  # Set fish as login shell
  users.users.${data.user.username} = {
    shell = pkgs.fish;
  };
}
