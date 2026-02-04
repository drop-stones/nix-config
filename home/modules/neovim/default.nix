{ localLib, nvim-config, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # install to $XDG_CONFIG_HOME/nvim
  # NOTE: lazy.nvim creates lazy-lock.json/lazyvim.json.
  #       We symlink each file/directory individually to allow lazy.nvim to write these json files.
  xdg.configFile = localLib.genXdgConfigFileLinks {
    name = "nvim";
    path = nvim-config.outPath;
  };
}
