{ pkgs, lib, config, ... }:

{
  # Host-specific configuration for macOS
  networking.hostName = "mac";
  networking.computerName = "mac";

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";
}
