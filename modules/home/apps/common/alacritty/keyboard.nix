_: {
  programs.alacritty.settings = {
    keyboard.bindings = [
      {
        key = "Space";
        mods = "Shift";
        action = "ToggleViMode";
      }
    ];
  };
}
