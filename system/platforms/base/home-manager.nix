{ hostPath, user, home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${user.username} = {
      imports = [
        (hostPath + "/home.nix")
      ];
    };
  };
}
