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

    # development tools
    pkgs.alacritty
    pkgs.tmux
    pkgs.ripgrep
    pkgs.file
    pkgs.tldr
    pkgs.universal-ctags
    pkgs.gnumake
    pkgs.gdb
    pkgs.man-pages
    pkgs.man-pages-posix

    # compilers and interpreters
    pkgs.python3
    pkgs.ghc
    pkgs.go
    pkgs.gcc
    pkgs.nasm
    pkgs.binutils

    # office
    pkgs.inkscape
    pkgs.neomutt
    pkgs.protonmail-bridge
    pkgs.texliveFull
    pkgs.libreoffice

    # general productivity
    pkgs.chromium
    pkgs.kicad

    # chat applications
    pkgs.discord
    pkgs.signal-desktop

    # gaming
    pkgs.prismlauncher

    # misc
    pkgs.keymapp
    pkgs.flameshot
    pkgs.xclip
    pkgs.htop
    pkgs.magic-wormhole
    pkgs.mpv
    pkgs.pavucontrol
    pkgs.ffmpeg
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
