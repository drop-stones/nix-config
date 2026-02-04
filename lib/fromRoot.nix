# fromRoot :: { lib: attrs, root: string } -> string -> path
#
# Build a path by appending a relative subpath to the flake root.
# - root is expected to be self.outPath (a string, usually with string context)
# - we discard string context to avoid accidental dependency tracking issues
# - subpath must be a relative string without a leading slash
{ lib, root, ... }: subpath: lib.path.append (/. + builtins.unsafeDiscardStringContext root) subpath
