# Dock settings
_: {
  programs.dank-material-shell.settings = {
    # Dock visibility
    showDock = false;
    dockAutoHide = false;
    dockSmartAutoHide = false;
    dockOpenOnOverview = false;

    # Positioning
    dockPosition = 1; # 0 = top, 1 = bottom
    dockSpacing = 4;
    dockBottomGap = 0;
    dockMargin = 0;

    # Icon settings
    dockIconSize = 40;
    dockIndicatorStyle = "circle";
    dockGroupByApp = false;
    dockIsolateDisplays = false;

    # App display options
    appsDockHideIndicators = false;
    appsDockColorizeActive = false;
    appsDockActiveColorMode = "primary";
    appsDockEnlargeOnHover = false;
    appsDockEnlargePercentage = 125;
    appsDockIconSizePercentage = 100;

    # Border
    dockBorderEnabled = false;
    dockBorderColor = "surfaceText";
    dockBorderOpacity = 1.0;
    dockBorderThickness = 1;

    # App overflow
    dockMaxVisibleApps = 0;
    dockMaxVisibleRunningApps = 0;
    dockShowOverflowBadge = true;

    # Launcher in dock
    dockLauncherEnabled = false;
    dockLauncherLogoMode = "apps";
    dockLauncherLogoCustomPath = "";
    dockLauncherLogoColorOverride = "";
    dockLauncherLogoSizeOffset = 0;
    dockLauncherLogoBrightness = 0.5;
    dockLauncherLogoContrast = 1;
  };
}
