{ data, localLib, ... }:
{
  home = {
    inherit (data.user) username homeDirectory;
    stateVersion = localLib.getInputVersionFromLock {
      name = "home-manager";
      prefix = "release-";
    };
  };
}
