# Workspace settings
_: {
  programs.dank-material-shell.settings = {
    # Display options
    showWorkspaceIndex = false;
    showWorkspaceName = false;
    showWorkspacePadding = false;
    showWorkspaceApps = false;
    showOccupiedWorkspacesOnly = false;
    dwlShowAllTags = false;

    # Behavior
    workspaceScrolling = false;
    workspaceDragReorder = true;
    workspaceFollowFocus = false;
    reverseScrolling = false;

    # App icons in workspace
    maxWorkspaceIcons = 3;
    workspaceAppIconSizeOffset = 0;
    groupWorkspaceApps = true;

    # Colors
    workspaceColorMode = "default";
    workspaceOccupiedColorMode = "none";
    workspaceUnfocusedColorMode = "default";
    workspaceUrgentColorMode = "default";

    # Border
    workspaceFocusedBorderEnabled = false;
    workspaceFocusedBorderColor = "primary";
    workspaceFocusedBorderThickness = 2;

    # Custom workspace name icons
    workspaceNameIcons = { };

    # Overview settings
    overviewRows = 2;
    overviewColumns = 5;
    overviewScale = 0.16;
  };
}
