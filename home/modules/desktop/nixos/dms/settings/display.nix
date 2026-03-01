# Display and output settings
_: {
  programs.dank-material-shell.settings = {
    # Display name format
    displayNameMode = "system";

    # Screen preferences
    screenPreferences = { };
    showOnLastDisplay = { };

    # Compositor-specific output settings
    niriOutputSettings = { };
    hyprlandOutputSettings = { };

    # Display profiles
    displayProfiles = { };
    activeDisplayProfile = { };
    displayProfileAutoSelect = false;

    # Display options
    displayShowDisconnected = false;
    displaySnapToEdge = true;
  };
}
