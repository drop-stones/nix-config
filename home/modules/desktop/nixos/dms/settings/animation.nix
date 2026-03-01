# Animation and effects settings
_: {
  programs.dank-material-shell.settings = {
    # Animation speed (multiplier)
    animationSpeed = 1;
    customAnimationDuration = 500;
    syncComponentAnimationSpeeds = true;

    # Popout animations
    popoutAnimationSpeed = 1;
    popoutCustomAnimationDuration = 150;

    # Modal animations
    modalAnimationSpeed = 1;
    modalCustomAnimationDuration = 150;

    # Notification animations
    notificationAnimationSpeed = 1;
    notificationCustomAnimationDuration = 400;

    # Effects
    enableRippleEffects = true;

    # Wallpaper
    wallpaperFillMode = "Fill";
    blurredWallpaperLayer = false;
    blurWallpaperOnOverview = false;
  };
}
