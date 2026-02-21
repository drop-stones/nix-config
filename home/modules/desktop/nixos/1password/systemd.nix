{ pkgs, ... }:
{
  systemd.user.services."1password" = {
    Unit = {
      Description = "1Password GUI Client";
      PartOf = [ "graphical-session.target" ];
      After = [
        "graphical-session.target"
        "dbus.socket"
      ];
      Requires = [ "dbus.socket" ];
    };
    Service = {
      ExecStartPre = [
        # wait for network to be fully connected (for server sync)
        "${pkgs.networkmanager}/bin/nm-online -q -t 30"
        # wait until system tray (org.kde.StatusNotifierWatcher) is ready
        ''${pkgs.bash}/bin/bash -c "until ${pkgs.dbus}/bin/dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep -q 'org.kde.StatusNotifierWatcher'; do sleep 0.2; done"''
        # wait 3 seconds for stability
        "${pkgs.coreutils}/bin/sleep 3"
      ];

      ExecStart = "${pkgs._1password-gui}/bin/1password --silent";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
