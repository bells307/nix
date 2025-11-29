# Template hardware configuration for aarch64
# Replace with actual output from: nixos-generate-config --show-hardware-config
{ config, lib, pkgs, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [ ];

  # ARM64 architecture
  nixpkgs.hostPlatform = "aarch64-linux";
}
