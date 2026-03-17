{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.dms-wallpaper;

  wallpaperScript = pkgs.writeTextFile {
    name = "dms-wallpaper-switcher";
    text = builtins.readFile ./wallpaper-switcher.fish;
    destination = "/bin/dms-wallpaper-switcher";
  };
in
{
  config = lib.mkIf cfg.enable {
    systemd.user.services.dms-wallpaper-switcher = {
      Unit = {
        Description = "DMS Wallpaper Period Switcher";
        After = [
          "graphical-session.target"
          "dms.service"
        ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.fish}/bin/fish ${wallpaperScript}/bin/dms-wallpaper-switcher";
        Environment = [
          "MORNING_DIR=${cfg.directories.morning}"
          "AFTERNOON_DIR=${cfg.directories.afternoon}"
          "NIGHT_DIR=${cfg.directories.night}"
        ];
      };
    };

    systemd.user.timers.dms-wallpaper-switcher = {
      Unit = {
        Description = "Timer for DMS Wallpaper Period Switcher";
      };
      Timer = {
        OnCalendar = [
          "*-*-* 06:00:00"
          "*-*-* 12:00:00"
          "*-*-* 18:00:00"
        ];
        OnStartupSec = "10s";
        Persistent = true;
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
