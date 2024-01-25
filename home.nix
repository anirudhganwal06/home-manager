{ config, pkgs, ... }:

{
  home.username = "anirudh.g";
  home.homeDirectory = "/Users/anirudh.g";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.neovim
  ];

  home.file = {
    ".config/nvim".source = dotfiles/nvim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
