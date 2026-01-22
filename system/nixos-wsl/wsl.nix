{ user, nixos-wsl, localLib, ... }:
{
  imports = [
    nixos-wsl.nixosModules.default
  ];

  wsl = {
    enable = true;
    defaultUser = user.username;

    # exclude Windows PATH in WSL PATH
    interop = {
      includePath = false;
    };
    wslConf.interop = {
      appendWindowsPath = false;
    };
  };

  system.stateVersion = localLib.getInputVersionFromLock { name = "nixpkgs"; prefix = "nixos-"; };
}
