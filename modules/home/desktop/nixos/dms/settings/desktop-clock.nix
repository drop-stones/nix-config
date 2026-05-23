# Desktop clock widget settings
_: {
  programs.dank-material-shell.settings = {
    # Enable/disable
    desktopClockEnabled = false;

    # Style
    desktopClockStyle = "analog";
    desktopClockTransparency = 0.90; # Changed from default: 1.0
    desktopClockColorMode = "primary";
    desktopClockCustomColor = "#ffffff";

    # Display options
    desktopClockShowDate = true;
    desktopClockShowAnalogNumbers = false;
    desktopClockShowAnalogSeconds = true;

    # Position and size (-1 = auto)
    desktopClockX = -1;
    desktopClockY = -1;
    desktopClockWidth = 280;
    desktopClockHeight = 180;

    # Display preferences
    desktopClockDisplayPreferences = [ "all" ];
  };
}
