{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors and multiplexers
    neovim
    tmux

    # Shell utilities
    fzf
    zoxide

    # Development tools
    claude-code
    nixfmt
    curl
    taplo
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
