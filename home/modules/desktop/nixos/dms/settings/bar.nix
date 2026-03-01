# Bar configuration
_: {
  programs.dank-material-shell.settings = {
    # Bar configs (list of bar configurations)
    barConfigs = [
      {
        # Identification
        id = "default";
        name = "Main Bar";
        enabled = true;
        visible = true;

        # Positioning
        position = 0; # 0 = top, 1 = bottom
        screenPreferences = [ "all" ];
        showOnLastDisplay = true;

        # Widgets
        leftWidgets = [
          "launcherButton"
          "workspaceSwitcher"
          "focusedWindow"
        ];
        centerWidgets = [
          "music"
          "clock"
          "weather"
        ];
        rightWidgets = [
          "systemTray"
          "clipboard"
          "cpuUsage"
          "memUsage"
          "notificationButton"
          "battery"
          "controlCenterButton"
        ];

        # Spacing and padding
        spacing = 0; # Changed from default: 4
        innerPadding = 4;
        bottomGap = 0;
        widgetPadding = 8;

        # Appearance
        transparency = 0.90; # Changed from default: 1.0
        widgetTransparency = 0.90; # Changed from default: 1.0
        squareCorners = false;
        noBackground = false;
        maximizeWidgetIcons = false;
        maximizeWidgetText = false;
        removeWidgetPadding = false;
        gothCornersEnabled = false;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 12;

        # Border
        borderEnabled = false;
        borderColor = "surfaceText";
        borderOpacity = 1.0;
        borderThickness = 1;

        # Widget outline
        widgetOutlineEnabled = false;
        widgetOutlineColor = "primary";
        widgetOutlineOpacity = 1.0;
        widgetOutlineThickness = 1;

        # Scaling
        fontScale = 1.0;
        iconScale = 1.0;

        # Behavior
        autoHide = true; # Changed from default: false
        autoHideDelay = 250;
        showOnWindowsOpen = false;
        openOnOverview = false;
        clickThrough = false;

        # Popups
        popupGapsAuto = true;
        popupGapsManual = 4;

        # Advanced
        maximizeDetection = true;
        scrollEnabled = true;
        scrollXBehavior = "column";
        scrollYBehavior = "workspace";
        shadowIntensity = 0;
        shadowOpacity = 60;
        shadowColorMode = "text";
        shadowCustomColor = "#000000";
      }
    ];
  };
}
