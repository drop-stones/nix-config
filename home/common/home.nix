{ host, localLib, ... }:
{
  home = {
    inherit (host.user) username homeDirectory;
    stateVersion = localLib.getInputVersionFromLock {
      name = "home-manager";
      prefix = "release-";
    };
  };
}
