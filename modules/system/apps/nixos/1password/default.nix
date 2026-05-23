{ data, ... }:
{
  # Allow the user to use 1Password's OS integration (SSH agent, browser extension).
  programs._1password-gui.polkitPolicyOwners = [ data.user.username ];
}
