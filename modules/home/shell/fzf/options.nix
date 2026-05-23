_: {
  programs.fzf.defaultOptions = [
    # Interface
    "--multi"
    "--no-mouse"

    # Layout
    "--height=80%"
    "--layout=reverse"
    "--border"
    "--info=inline-right"

    # Display
    "--ansi"
    "--highlight-line"
  ];
}
