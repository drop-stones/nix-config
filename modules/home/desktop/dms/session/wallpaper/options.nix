{ lib, wallpapers, ... }:
{
  options.services.dms-wallpaper = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to enable DMS time-based wallpaper switching";
    };

    directories = {
      morning = lib.mkOption {
        type = lib.types.str;
        default = "${wallpapers}/21_9/morning";
        description = "Directory containing morning wallpapers (6:00-12:00)";
      };

      afternoon = lib.mkOption {
        type = lib.types.str;
        default = "${wallpapers}/21_9/afternoon";
        description = "Directory containing afternoon wallpapers (12:00-18:00)";
      };

      night = lib.mkOption {
        type = lib.types.str;
        default = "${wallpapers}/21_9/night";
        description = "Directory containing night wallpapers (18:00-6:00)";
      };
    };
  };
}
