{ user, localLib, ... }:

{
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = localLib.getInputVersionFromLock {
    name = "home-manager";
    prefix = "release-";
  };
}
