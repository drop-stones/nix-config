# Audio settings
_: {
  programs.dank-material-shell.settings = {
    # Music player
    waveProgressEnabled = true;
    scrollTitleEnabled = true;
    audioVisualizerEnabled = true;

    # Scroll behavior
    audioScrollMode = "volume";
    audioWheelScrollAmount = 5;

    # System sounds
    soundsEnabled = true;
    useSystemSoundTheme = false;
    soundNewNotification = true;
    soundVolumeChanged = true;
    soundPluggedIn = true;
  };
}
