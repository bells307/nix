{ pkgs, lib, config, self, ... }:

{
  imports = [
    ./packages.nix
  ];

  # Darwin-specific settings
  system.stateVersion = 6;

  # User definition (Darwin style)
  users.users.bells = {
    name = "bells";
    home = "/Users/bells";
  };

  # Set Git commit hash for darwin-version
  system.configurationRevision = self.rev or self.dirtyRev or null;
}
