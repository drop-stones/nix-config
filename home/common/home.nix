{ user, localLib, ... }:

{
  home = {
    inherit (user) username homeDirectory;
    stateVersion = localLib.getInputVersionFromLock {
      name = "home-manager";
      prefix = "release-";
    };
  };
}
