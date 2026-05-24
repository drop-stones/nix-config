# App launcher settings
_: {
  programs.dank-material-shell.settings = {
    # View modes
    appLauncherViewMode = "list";
    spotlightModalViewMode = "list";
    browserPickerViewMode = "grid";
    appPickerViewMode = "grid";

    # App sorting
    sortAppsAlphabetically = false;
    appLauncherGridColumns = 4;

    # Centering mode
    centeringMode = "index";

    # Media size
    mediaSize = 1;

    # Spotlight
    spotlightCloseNiriOverview = true;
    spotlightSectionViewModes = { };
    appDrawerSectionViewModes = { };
    niriOverviewOverlayEnabled = true;

    # Browser/file picker history
    browserUsageHistory = { };
    filePickerUsageHistory = { };

    # Launcher logo
    launcherLogoMode = "apps";
    launcherLogoCustomPath = "";
    launcherLogoColorOverride = "";
    launcherLogoColorInvertOnMode = false;
    launcherLogoBrightness = 0.5;
    launcherLogoContrast = 1;
    launcherLogoSizeOffset = 0;

    # Dank Launcher V2
    dankLauncherV2Size = "compact";
    dankLauncherV2BorderEnabled = false;
    dankLauncherV2BorderThickness = 2;
    dankLauncherV2BorderColor = "primary";
    dankLauncherV2ShowFooter = true;
    dankLauncherV2UnloadOnClose = false;

    # Clipboard
    clipboardEnterToPaste = false;

    # Plugin settings
    builtInPluginSettings = { };
    launcherPluginVisibility = { };
    launcherPluginOrder = [ ];
  };
}
