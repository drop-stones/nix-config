{ user, ... }:

{
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = "25.05";
}
