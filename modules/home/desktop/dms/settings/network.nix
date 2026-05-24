# Network settings
_: {
  programs.dank-material-shell.settings = {
    # Network preference
    networkPreference = "auto";

    # Weather
    useAutoLocation = false;
    weatherEnabled = true;

    # Device pins
    wifiNetworkPins = { };
    bluetoothDevicePins = { };
  };
}
