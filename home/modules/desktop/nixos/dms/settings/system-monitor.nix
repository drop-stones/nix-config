# System monitor widget settings
_: {
  programs.dank-material-shell.settings = {
    # Enable/disable
    systemMonitorEnabled = false;

    # Appearance
    systemMonitorShowHeader = true;
    systemMonitorTransparency = 0.90; # Changed from default: 1.0
    systemMonitorColorMode = "primary";
    systemMonitorCustomColor = "#ffffff";

    # CPU
    systemMonitorShowCpu = true;
    systemMonitorShowCpuGraph = true;
    systemMonitorShowCpuTemp = true;

    # GPU
    systemMonitorShowGpuTemp = false;
    systemMonitorGpuPciId = "";

    # Memory
    systemMonitorShowMemory = true;
    systemMonitorShowMemoryGraph = true;

    # Network
    systemMonitorShowNetwork = true;
    systemMonitorShowNetworkGraph = true;

    # Disk
    systemMonitorShowDisk = true;

    # Top processes
    systemMonitorShowTopProcesses = false;
    systemMonitorTopProcessCount = 3;
    systemMonitorTopProcessSortBy = "cpu";

    # Graph settings
    systemMonitorGraphInterval = 60;

    # Layout
    systemMonitorLayoutMode = "auto";
    systemMonitorX = -1;
    systemMonitorY = -1;
    systemMonitorWidth = 320;
    systemMonitorHeight = 480;

    # Display preferences
    systemMonitorDisplayPreferences = [ "all" ];
    systemMonitorVariants = [ ];
  };
}
