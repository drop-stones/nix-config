{ localLib, ... }@args:
{
  nixpkgs.overlays = import (localLib.fromRoot "overlays") args;
}
