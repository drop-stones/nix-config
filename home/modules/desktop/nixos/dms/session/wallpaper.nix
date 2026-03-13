{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.dms-wallpaper;

  # Python script to determine time period and set wallpaper
  wallpaperScript =
    pkgs.writers.writePython3Bin "dms-wallpaper-switcher"
      {
        libraries = [ pkgs.python3Packages.astral ];
      }
      ''
        import subprocess
        import random
        from datetime import datetime, date
        from astral import LocationInfo
        from astral.sun import sun
        from pathlib import Path

        LATITUDE = ${toString cfg.latitude}
        LONGITUDE = ${toString cfg.longitude}

        MORNING_DIR = Path("${cfg.directories.morning}").expanduser()
        AFTERNOON_DIR = Path("${cfg.directories.afternoon}").expanduser()
        NIGHT_DIR = Path("${cfg.directories.night}").expanduser()

        STATE_DIR = Path.home() / ".local" / "state" / "dms-wallpaper"
        STATE_FILE = STATE_DIR / "current-period"

        IMAGE_EXTENSIONS = {
            ".jpg", ".jpeg", ".png", ".bmp", ".gif",
            ".webp", ".jxl", ".avif", ".heif", ".exr"
        }


        def get_sun_times() -> tuple[datetime, datetime]:
            """Get sunrise and sunset times for today using location coordinates."""
            location = LocationInfo(latitude=LATITUDE, longitude=LONGITUDE)
            s = sun(location.observer, date=date.today())
            return s["sunrise"], s["sunset"]


        def get_current_period() -> str:
            """Determine current time period: morning, afternoon, or night."""
            now = datetime.now(tz=None)
            sunrise, sunset = get_sun_times()

            # Convert to naive datetime for comparison
            sunrise_naive = sunrise.replace(tzinfo=None)
            sunset_naive = sunset.replace(tzinfo=None)
            noon = now.replace(hour=12, minute=0, second=0, microsecond=0)

            if sunrise_naive <= now < noon:
                return "morning"
            elif noon <= now < sunset_naive:
                return "afternoon"
            else:
                return "night"


        def get_period_dir(period: str) -> Path:
            """Get wallpaper directory for the given period."""
            return {
                "morning": MORNING_DIR,
                "afternoon": AFTERNOON_DIR,
                "night": NIGHT_DIR,
            }[period]


        def get_wallpapers(directory: Path) -> list[Path]:
            """Get list of wallpaper files in directory."""
            if not directory.exists():
                return []
            return sorted([
                f for f in directory.iterdir()
                if f.is_file() and f.suffix.lower() in IMAGE_EXTENSIONS
            ])


        def get_previous_period() -> str | None:
            """Read previously active period from state file."""
            if STATE_FILE.exists():
                return STATE_FILE.read_text().strip()
            return None


        def save_current_period(period: str) -> None:
            """Save current period to state file."""
            STATE_DIR.mkdir(parents=True, exist_ok=True)
            STATE_FILE.write_text(period)


        def set_wallpaper(path: Path) -> None:
            """Set wallpaper using DMS IPC."""
            subprocess.run(
                ["dms", "ipc", "call", "wallpaper", "set", str(path)],
                check=True
            )


        def main() -> None:
            current_period = get_current_period()
            previous_period = get_previous_period()

            # Only switch wallpaper if period changed
            if current_period != previous_period:
                period_dir = get_period_dir(current_period)
                wallpapers = get_wallpapers(period_dir)

                if wallpapers:
                    # Select random wallpaper from the period's directory
                    wallpaper = random.choice(wallpapers)
                    set_wallpaper(wallpaper)
                    save_current_period(current_period)
                    print(f"Switched to {current_period} wallpaper: {wallpaper}")
                else:
                    print(f"No wallpapers found in {period_dir}")
            else:
                print(f"Still in {current_period} period, no switch needed")


        if __name__ == "__main__":
            main()
      '';
in
{
  options.services.dms-wallpaper = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to enable DMS time-based wallpaper switching";
    };

    latitude = lib.mkOption {
      type = lib.types.float;
      default = 35.0116;
      description = "Latitude for sunrise/sunset calculation";
    };

    longitude = lib.mkOption {
      type = lib.types.float;
      default = 135.7681;
      description = "Longitude for sunrise/sunset calculation";
    };

    directories = {
      morning = lib.mkOption {
        type = lib.types.str;
        default = "~/Pictures/Wallpapers/morning";
        description = "Directory containing morning wallpapers (sunrise to noon)";
      };

      afternoon = lib.mkOption {
        type = lib.types.str;
        default = "~/Pictures/Wallpapers/afternoon";
        description = "Directory containing afternoon wallpapers (noon to sunset)";
      };

      night = lib.mkOption {
        type = lib.types.str;
        default = "~/Pictures/Wallpapers/night";
        description = "Directory containing night wallpapers (sunset to sunrise)";
      };
    };

    cyclingInterval = lib.mkOption {
      type = lib.types.int;
      default = 3600;
      # default = 1;
      description = "Interval in seconds for cycling wallpapers within a period (default: 1 hour)";
    };
  };

  config = lib.mkIf cfg.enable {
    # DMS wallpaper cycling settings
    programs.dank-material-shell = {
      session = {
        # Enable cycling within the current folder
        wallpaperCyclingEnabled = true;
        wallpaperCyclingMode = "interval";
        wallpaperCyclingInterval = cfg.cyclingInterval;
      };
    };

    # Install the wallpaper switcher script
    home.packages = [ wallpaperScript ];

    # Systemd service and timer for time-period-based wallpaper switching
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
        ExecStart = lib.getExe wallpaperScript;
      };
    };

    systemd.user.timers.dms-wallpaper-switcher = {
      Unit = {
        Description = "Timer for DMS Wallpaper Period Switcher";
      };
      Timer = {
        # Run every 15 minutes to catch time period changes
        OnCalendar = "*:0/15";
        # Also run on boot/login
        OnStartupSec = "10s";
        Persistent = true;
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
