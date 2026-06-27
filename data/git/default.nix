# Merge the shared git config with the platform-specific overrides.
{ lib }: platform: lib.recursiveUpdate (import ./common.nix) (import (./. + "/${platform}.nix"))
