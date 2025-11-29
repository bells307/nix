{ pkgs, lib, config, ... }:

{
  imports = [
    ./packages.nix
  ];

  # Networking
  networking.networkmanager.enable = true;

  # Timezone and locale
  time.timeZone = lib.mkDefault "UTC";  # Adjust as needed
  i18n.defaultLocale = "en_US.UTF-8";

  # User definition (NixOS style)
  users.users.bells = {
    isNormalUser = true;
    description = "bells";
    home = "/home/bells";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # System state version
  system.stateVersion = "24.11";
}
