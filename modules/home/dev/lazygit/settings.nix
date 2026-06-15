_: {
  programs.lazygit.settings = {
    gui = {
      # Use English for the UI
      language = "en";
      # Render Nerd Font icons (0xProto Nerd Font is installed)
      nerdFontsVersion = "3";
    };
    # Configuration is managed by Nix; disable self-update checks
    update.method = "never";
    disableStartupPopups = true;
  };
}
