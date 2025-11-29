{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # NixOS-specific packages (if any)
    # Most packages are in shared/packages.nix
  ];
}
