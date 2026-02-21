{ pkgs, ... }:
{
  boot = {
    # systemd-boot: An easy-to-configure UEFI boot manager
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # use latest linux kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
