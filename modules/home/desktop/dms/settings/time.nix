# Time and localization settings
_: {
  programs.dank-material-shell.settings = {
    # Clock format
    use24HourClock = true;
    showSeconds = false;
    padHours12Hour = false;
    clockDateFormat = "";
    lockDateFormat = "";

    # First day of week (-1 = system default)
    firstDayOfWeek = -1;

    # Temperature and units
    useFahrenheit = false;
    windSpeedUnit = "kmh";
  };
}
