{ localLib, ... } @ args:
final: prev:
import (localLib.fromRoot "pkgs") (args // { pkgs = final; })
