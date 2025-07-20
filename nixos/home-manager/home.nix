{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.pointerCursor = {
    gtk.enable = true; # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true; # allowing proprietary software
  home.packages = [
    # sanity check program
    (pkgs.writeShellScriptBin "update-homemanager-flake" ''
        OLD_PATH=$(pwd)
        cd /home/user/git/config-files/nixos/home-manager
        nix flake update
        home-manager switch --flake .
        cd $OLD_PATH
    '')

    (pkgs.writeShellScriptBin "update-system-flake" ''
        OLD_PATH=$(pwd)
        cd /home/user/git/config-files/nixos/system
        nix flake update
        sudo nixos-rebuild switch --flake .
        cd $OLD_PATH
    '')

    (pkgs.writeShellScriptBin "tm" ''
        tmux attach || tmux
    '')

    # development environment
    pkgs.alacritty
    pkgs.ripgrep
    pkgs.file
    pkgs.parallel
    pkgs.gdb
    pkgs.tmux
    pkgs.man-pages
    pkgs.man-pages-posix
    pkgs.glibcInfo

    # programming
    pkgs.gnumake
    pkgs.nasm
    pkgs.binutils
    pkgs.python3
    pkgs.ghc
    pkgs.gcc
    pkgs.go

    # general productivity
    pkgs.chromium
    pkgs.kicad
    pkgs.texliveFull
    pkgs.ffmpeg
    pkgs.yt-dlp
    pkgs.magic-wormhole

    # chat applications
    pkgs.signal-desktop
    pkgs.neomutt
    pkgs.libreoffice

    # hyprland utils
    pkgs.wofi
    pkgs.waybar
    pkgs.hyprpaper
    pkgs.nautilus
    pkgs.sxiv
    pkgs.zathura
    pkgs.hyprlock
    
    # misc
    pkgs.keymapp
    pkgs.xclip
    pkgs.neofetch
    pkgs.superTuxKart
    pkgs.discord
  ];


  programs = {
    git = {
      enable = true;
      userName = "Scott Campbell";
      userEmail = "scott@josephscottcampbell.com";
    };
  
    bash = {
      enable = true;
    };

    neovim = {
        # not installing plugins through this section because I want to keep
        # my vim config distro agnostic
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };
  };


 # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
 
    ".config/alacritty.toml".source = ../../alacritty.toml;
    ".config/nvim/init.lua".source = ../../nvim/init.lua;
    ".config/tmux/tmux.conf".source = ../../tmux/tmux.conf;
    ".config/hypr/hyprland.conf".source = ../../hypr/hyprland.conf;
    ".config/hypr/hyprlock.conf".source = ../../hypr/hyprlock.conf;
    ".config/hypr/hyprpaper.conf".source = ../../hypr/hyprpaper.conf;
    ".config/wofi/style.css".source = ../../wofi/style.css;
    ".config/wofi/style.scss".source = ../../wofi/style.scss;
    ".config/waybar/style.css".source = ../../waybar/style.css;
    ".config/waybar/config".source = ../../waybar/config;
    

    ".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "master";
        sha256 = "01ribl326n6n0qcq68a8pllbrz6mgw55kxhf9mjdc5vw01zjcvw5";
    };
  };

  # setup various plugin managers
  # vim plug for neovim
  home.sessionVariables = {
     EDITOR = "nvim";
     MANPAGER = "nvim +Man!";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
