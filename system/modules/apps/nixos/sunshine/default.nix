_: {
  services.sunshine = {
    enable = true;
    openFirewall = true;
    # CAP_SYS_ADMIN is required for DRM/KMS screen capture under Wayland
    capSysAdmin = true;
  };
}
