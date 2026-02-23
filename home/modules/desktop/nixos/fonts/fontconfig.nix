# Fontconfig: Default font settings
_: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Noto Sans"
        "BIZ UDGothic"
      ];
      serif = [
        "Noto Serif"
        "BIZ UDMincho"
      ];
      monospace = [
        "0xProto Nerd Font"
        "BIZ UDGothic"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
