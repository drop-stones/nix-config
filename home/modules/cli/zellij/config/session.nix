_: {
  programs.zellij.extraConfig = ''
    // A fixed name to always give the Zellij session.
    // Consider also setting `attach_to_session true,`
    // otherwise this will error if such a session exists.
    // Default: <RANDOM>
    //
    session_name "main"

    // When `session_name` is provided, attaches to that session
    // if it is already running or creates it otherwise.
    // Default: false
    //
    attach_to_session true

    // Whether to show tips on startup
    // Default: true
    //
    show_startup_tips false
  '';
}
