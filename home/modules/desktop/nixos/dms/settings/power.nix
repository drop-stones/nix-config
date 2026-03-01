# Power management settings
_: {
  programs.dank-material-shell.settings = {
    # AC power timeouts (0 = disabled)
    acMonitorTimeout = 0;
    acLockTimeout = 0;
    acSuspendTimeout = 0;
    acSuspendBehavior = 0;
    acProfileName = "";

    # Battery timeouts (0 = disabled)
    batteryMonitorTimeout = 0;
    batteryLockTimeout = 0;
    batterySuspendTimeout = 0;
    batterySuspendBehavior = 0;
    batteryProfileName = "";
    batteryChargeLimit = 100;

    # Lock behavior
    lockBeforeSuspend = false;
    loginctlLockIntegration = true;
    fadeToLockEnabled = true;
    fadeToLockGracePeriod = 5;
    fadeToDpmsEnabled = true;
    fadeToDpmsGracePeriod = 5;

    # Power menu
    powerActionConfirm = true;
    powerActionHoldDuration = 0.5;
    powerMenuActions = [
      "reboot"
      "logout"
      "poweroff"
      "lock"
      "suspend"
      "restart"
    ];
    powerMenuDefaultAction = "logout";
    powerMenuGridLayout = false;

    # Custom power actions
    customPowerActionLock = "";
    customPowerActionLogout = "";
    customPowerActionSuspend = "";
    customPowerActionHibernate = "";
    customPowerActionReboot = "";
    customPowerActionPowerOff = "";
  };
}
