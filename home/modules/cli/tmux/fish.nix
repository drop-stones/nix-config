_: {
  # Autostart tmux
  programs.fish.functions.tmux_scratch = ''
    if not set -q TMUX
      set -l session_name "scratch_$(date +%Y-%m-%d_%H-%M-%S)"

      tmux new-session -d -s $session_name
      tmux attach-session -t $session_name

      # Clean up the scratch session after detach/exit
      if tmux has-session -t $session_name 2>/dev/null
        tmux kill-session -t $session_name
      end
    end
  '';
}
