{ pkgs-unstable, ... }:
{
  # GitHub Copilot CLI: the power of Copilot coding agent directly to your terminal
  # TODO: Remove override when nixpkgs-unstable fixes the --no-warnings issue
  home.packages = [
    (pkgs-unstable.github-copilot-cli.overrideAttrs (prev: rec {
      version = "0.0.420";
      src = pkgs-unstable.fetchurl {
        url = "https://github.com/github/copilot-cli/releases/download/v${version}/copilot-linux-x64.tar.gz";
        hash = "sha256-NE+J7h5hnJ/8sHI4G35TwvMFBTAItVWE3FhG0APBZ7k=";
      };
    }))
  ];
}
