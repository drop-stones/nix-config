# importsModule :: dir -> host -> module
#
# Build the module body for a directory that just auto-imports its
# children, always forwarding `host` so that platform-named subdirectories
# (nixos, darwin, wsl) are filtered consistently. Replaces the boilerplate:
#   { localLib, ... }: { imports = localLib.listImports { dir = ./.; }; }
# with:
#   { localLib, host, ... }: localLib.importsModule ./. host
args:
let
  listImports = import ./listImports.nix args;
in
dir: host: {
  imports = listImports { inherit dir host; };
}
