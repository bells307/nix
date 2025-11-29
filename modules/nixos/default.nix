{ pkgs, lib, config, ... }:

{
  imports = [
    ./hardware.nix
    ./packages.nix
  ];

  # Boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    # Add SSH key when deploying:
    # openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAA..." ];
  };

  # Enable SSH for headless server
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # System state version
  system.stateVersion = "24.11";
}
