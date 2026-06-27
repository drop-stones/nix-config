_: {
  programs.delta.options = {
    # Hunk header: just the enclosing context, boxed. Line numbers live in the
    # gutter now (CLI) so they are dropped here, and no marker label is prepended.
    hunk-header-style = "syntax";
    hunk-header-decoration-style = "blue box";

    # Nerd Font icons for the file/hunk headers, replacing delta's default text
    # labels ("Δ", "added:", ...) and the "•" hunk marker. Needs a Nerd Font.
    file-modified-label = ""; # nf-fa-pencil (U+F040)
    file-added-label = ""; # nf-fa-plus (U+F067)
    file-removed-label = ""; # nf-fa-minus (U+F068)
    file-renamed-label = ""; # nf-fa-exchange (U+F0EC)
    hunk-label = ""; # no marker before the hunk header
  };
}
