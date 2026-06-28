# importsModule :: dir -> { host, platforms ? null } -> module
#
# Build the module body for a directory that just auto-imports its children,
# always forwarding `host` so that platform-named subdirectories (nixos,
# darwin, wsl) are filtered consistently. Pass `platforms` to skip the whole
# module unless host.platform is in the list. Replaces the boilerplate:
#   { localLib, ... }: { imports = localLib.listImports { dir = ./.; }; }
# with:
#   { localLib, host, ... }: localLib.importsModule ./. { inherit host; }
args:
let
  listImports = import ./listImports.nix args;
in
dir:
{
  host,
  platforms ? null,
}:
{
  imports = listImports { inherit dir host platforms; };
}
