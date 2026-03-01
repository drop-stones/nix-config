# Notification settings
_: {
  programs.dank-material-shell.settings = {
    # Overlay
    notificationOverlayEnabled = false;
    notificationPopupShadowEnabled = true;
    notificationPopupPrivacyMode = false;

    # Display mode
    notificationCompactMode = false;
    notificationPopupPosition = 0;

    # Timeouts (milliseconds, 0 = no timeout)
    notificationTimeoutLow = 5000;
    notificationTimeoutNormal = 5000;
    notificationTimeoutCritical = 0;

    # Animation
    notificationAnimationSpeed = 1;
    notificationCustomAnimationDuration = 400;

    # History
    notificationHistoryEnabled = true;
    notificationHistoryMaxCount = 50;
    notificationHistoryMaxAgeDays = 7;
    notificationHistorySaveLow = true;
    notificationHistorySaveNormal = true;
    notificationHistorySaveCritical = true;

    # Notification rules
    notificationRules = [ ];
  };
}
