{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # GUI applications (macOS only)
    alacritty
    obsidian

    # macOS-specific utilities
    mkalias
  ];
}
