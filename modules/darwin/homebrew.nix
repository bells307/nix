{ pkgs, lib, config, ... }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "bells";
    autoMigrate = true;
  };
}
