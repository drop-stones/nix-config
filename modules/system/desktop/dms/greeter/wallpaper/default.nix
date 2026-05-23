{
  pkgs,
  wallpapers,
  ...
}:
let
  greeterSessionFile = "/var/lib/dms-greeter-wallpaper/session.json";

  greeterWallpaperScript = pkgs.writeTextFile {
    name = "dms-greeter-wallpaper";
    text = builtins.readFile ./dms-greeter-wallpaper.fish;
    destination = "/bin/dms-greeter-wallpaper";
  };
in
{
  programs.dank-material-shell.greeter = {
    configFiles = [ greeterSessionFile ];
  };

  systemd.services.dms-greeter-wallpaper = {
    description = "Pick time-based wallpaper for DMS greeter";
    before = [ "greetd.service" ];
    wantedBy = [ "greetd.service" ];
    path = with pkgs; [
      coreutils
      fd
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.fish}/bin/fish --no-config ${greeterWallpaperScript}/bin/dms-greeter-wallpaper";
    };
    environment = {
      MORNING_DIR = "${wallpapers}/21_9/morning";
      AFTERNOON_DIR = "${wallpapers}/21_9/afternoon";
      NIGHT_DIR = "${wallpapers}/21_9/night";
      OUTPUT_FILE = greeterSessionFile;
    };
  };
}
