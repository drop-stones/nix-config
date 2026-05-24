_: {
  # Disable learning data storage to prevent hazkey-server SIGILL crash
  # in LongTermLearningMemory.merge() (hazkey-server 0.2.1 bug)
  xdg.configFile."hazkey/config.json".source = ./config.json;
}
