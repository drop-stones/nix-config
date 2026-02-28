{ pkgs, ... }:
{
  # tridactyl-native: Native messanger for Tridactyl
  home.packages = [ pkgs.tridactyl-native ];

  # Add tridactyl-native to native messaging hosts
  programs.firefox.nativeMessagingHosts = [ pkgs.tridactyl-native ];
}
