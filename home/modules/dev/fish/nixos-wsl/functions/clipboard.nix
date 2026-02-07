_: {
  # Customized fish_clipboard_paste
  # Original: https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_clipboard_paste.fish
  # Change: Added win32yank.exe support and prioritized it over powershell.exe on Windows
  programs.fish.functions.fish_clipboard_paste = ''
    function fish_clipboard_paste
        set -l data
        if type -q win32yank.exe # windows
            set data (win32yank.exe -o 2>/dev/null | string trim -r -c \r | string collect -N)
        else if type -q powershell.exe
            set data (powershell.exe Get-Clipboard | string trim -r -c \r | string collect -N)
        end

        # Issue 6254: Handle zero-length clipboard content
        if not string length -q -- "$data"
            return 1
        end

        if not isatty stdout
            # If we're redirected, just write the data *as-is*.
            printf %s $data
            return
        end

        __fish_paste $data
    end
  '';
}
