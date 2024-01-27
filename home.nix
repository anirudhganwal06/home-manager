{ config, pkgs, ... }:

{
  home.username = "anirudh.g";
  home.homeDirectory = "/Users/anirudh.g";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.neovim
  ];

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config /home-manager/dotfiles/nvim";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
