_: {
  # Autostart zellij
  programs.fish.functions.zellij_scratch = ''
    if not set -q ZELLIJ
      set -l session_name "scratch_$(date +%Y-%m-%d_%H-%M-%S)"

      zellij -s $session_name

      if zellij list-sessions -n | string match -q "$session_name"
        zellij delete-session $session_name --force > /dev/null 2>&1
      end
    end
  '';
}
