{ config, pkgs, ... }:

{
  home.username = "anirudh.g";
  home.homeDirectory = "/Users/anirudh.g";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.neovim
    pkgs.starship
    pkgs.rbenv
    pkgs.ripgrep
    pkgs.gnutar
    pkgs.atuin
    pkgs.openvpn
    pkgs.awscli2
    pkgs.kubectl
    pkgs.eksctl
    pkgs.go
    pkgs.colima
    pkgs.docker
    pkgs.kubernetes-helm
    pkgs.fluxcd
    pkgs.kustomize_4
    pkgs.direnv
    pkgs.nodejs_23
    pkgs.httpie
    pkgs.bat
    pkgs.k9s
  ];

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/nvim";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  }; 

  programs.home-manager.enable = true;
}
