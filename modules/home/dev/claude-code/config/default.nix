{ host, ... }:
{
  # Non-work: CLAUDE.md is the base rules themselves. Work: the work overlay
  # (agenix) owns CLAUDE.md and pulls the base rules in via an
  # `@~/.config/claude/base.md` import, so deploy the same file as base.md.
  xdg.configFile =
    if host.user.profile == "work" then
      { "claude/base.md".source = ./CLAUDE.md; }
    else
      { "claude/CLAUDE.md".source = ./CLAUDE.md; };
}
