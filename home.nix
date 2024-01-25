{ config, pkgs, ... }:

{
  home.username = "anirudh.g";
  home.homeDirectory = "/Users/anirudh.g";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.hello
  ];

  home.file = {
    ".config/nvim".source = dotfiles/nvim;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/anirudh.g/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
