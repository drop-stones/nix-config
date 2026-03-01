# Theme and appearance settings
_: {
  programs.dank-material-shell.settings = {
    # Theme
    currentThemeName = "purple";
    currentThemeCategory = "generic";
    customThemeFile = "";
    registryThemeVariants = { };

    # Night mode
    nightModeEnabled = false;

    # Matugen color scheme
    matugenScheme = "scheme-tonal-spot";
    runUserMatugenTemplates = true;
    matugenTargetMonitor = "";

    # Transparency (0.0-1.0)
    popupTransparency = 0.90; # Changed from default: 1.0
    dockTransparency = 0.90; # Changed from default: 1.0

    # Widget styling
    widgetBackgroundColor = "sch";
    widgetColorMode = "default";
    controlCenterTileColorMode = "primary";
    buttonColorMode = "primary";

    # Corner radius
    cornerRadius = 12;

    # Compositor layout overrides
    niriLayoutGapsOverride = -1;
    niriLayoutRadiusOverride = -1;
    niriLayoutBorderSize = -1;
    hyprlandLayoutGapsOverride = -1;
    hyprlandLayoutRadiusOverride = -1;
    hyprlandLayoutBorderSize = -1;

    # Icon theme
    iconTheme = "System Default";
    availableIconThemes = [ "System Default" ];
    systemDefaultIconTheme = "";

    # Cursor settings
    cursorSettings = {
      theme = "System Default";
      size = 24;
    };
    availableCursorThemes = [ "System Default" ];
    systemDefaultCursorTheme = "";

    # GTK/Qt theming integration
    gtkThemingEnabled = false;
    qtThemingEnabled = false;
    qt5ctAvailable = false;
    qt6ctAvailable = false;
    gtkAvailable = false;
    syncModeWithPortal = true;
    terminalsAlwaysDark = false;

    # Matugen templates
    runDmsMatugenTemplates = true;
    matugenTemplateGtk = true;
    matugenTemplateNiri = true;
    matugenTemplateHyprland = true;
    matugenTemplateQt5ct = true;
    matugenTemplateQt6ct = true;
    matugenTemplateFirefox = true;
    matugenTemplateZenBrowser = true;
    matugenTemplateGhostty = true;
    matugenTemplateKitty = true;
    matugenTemplateFoot = true;
    matugenTemplateAlacritty = true;
    matugenTemplateNeovim = true;
    matugenTemplateWezterm = true;
    matugenTemplateVscode = true;
  };
}
