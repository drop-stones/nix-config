# Lock screen settings
_: {
  programs.dank-material-shell.settings = {
    # Background
    modalDarkenBackground = true;

    # Visibility
    lockScreenShowPowerActions = false;
    lockScreenShowSystemIcons = true;
    lockScreenShowTime = true;
    lockScreenShowDate = true;
    lockScreenShowProfileImage = true;
    lockScreenShowPasswordField = true;
    lockScreenShowMediaPlayer = true;

    # Behavior
    lockScreenPowerOffMonitorsOnLock = false;
    lockAtStartup = false;
    lockScreenActiveMonitor = "all";
    lockScreenInactiveColor = "#000000";
    lockScreenNotificationMode = 0;

    # Video background
    lockScreenVideoEnabled = false;
    lockScreenVideoPath = "";
    lockScreenVideoCycling = false;

    # Biometric authentication
    enableFprint = false;
    maxFprintTries = 15;
    fprintdAvailable = false;
    enableU2f = false;
    u2fMode = "or";
    u2fAvailable = false;

    # UI
    hideBrightnessSlider = false;
  };
}
