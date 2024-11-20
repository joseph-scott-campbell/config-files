{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true; # allowing proprietary software
  home.packages = [
    # sanity check program
    (pkgs.writeShellScriptBin "is-home-manager-working" ''
        echo "yes it is"
    '')

    # development
    # NOTE: very basic stuff like git and vim are in system-wide config
    pkgs.alacritty
    pkgs.tmux

    # general productivity
    pkgs.chromium

    # chat applications
    pkgs.discord
    pkgs.signal-desktop
    
    # misc
    pkgs.nerdfonts

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

 # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    
    ".config/alacritty.toml".source = ../../alacritty.toml;
    ".config/nvim/init.vim".source = ../../nvim/init.vim;
    ".config/tmux.conf".source = ../../tmux/tmux.conf;

    # setup vim plug for neovim
    # user will still have to <Prefix> + I on first load
    ".local/share/nvim/site/autoload/plug.vim".text = "";
    ".local/share/nvim/site/autoload/plug.vim".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
        sha256 = "1nywzjd9nfr7sqqbdi69wza305q3vp26i0390j1884wdz6awid10";
    };

    ".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "master";
        sha256 = "01ribl326n6n0qcq68a8pllbrz6mgw55kxhf9mjdc5vw01zjcvw5";
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # setup various plugin managers
  # vim plug for neovim
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "Scott Campbell";
    userEmail = "scott@josephscottcampbell.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
