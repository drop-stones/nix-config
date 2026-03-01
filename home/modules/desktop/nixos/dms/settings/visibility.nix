# Bar widget visibility settings
_: {
  programs.dank-material-shell.settings = {
    # Left section
    showLauncherButton = true;
    showWorkspaceSwitcher = true;
    showFocusedWindow = true;

    # Center section
    showWeather = true;
    showMusic = true;
    showClipboard = true;
    showClock = true;

    # System monitors
    showCpuUsage = true;
    showMemUsage = true;
    showCpuTemp = true;
    showGpuTemp = true;
    selectedGpuIndex = 0;
    enabledGpuPciIds = [ ];

    # Right section
    showSystemTray = true;
    showNotificationButton = true;
    showBattery = true;
    showControlCenterButton = true;
    showCapsLockIndicator = true;

    # Privacy indicators
    showPrivacyButton = true;
    privacyShowMicIcon = false;
    privacyShowCameraIcon = false;
    privacyShowScreenShareIcon = false;

    # Compact modes
    clockCompactMode = false;
    focusedWindowCompactMode = false;
    runningAppsCompactMode = true;
    keyboardLayoutNameCompactMode = false;

    # Bar app overflow
    barMaxVisibleApps = 0;
    barMaxVisibleRunningApps = 0;
    barShowOverflowBadge = true;

    # Running apps display
    runningAppsCurrentWorkspace = true;
    runningAppsGroupByApp = false;
    runningAppsCurrentMonitor = false;
  };
}
