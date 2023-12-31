# config-files

Almost all the programs on my system are configured with the [Toyko-Night](https://github.com/enkia/tokyo-night-vscode-theme) color scheme.
Many of them are integrated together for a seamless software development experience in the terminal.

My laptop is not powerful enough to run many modern software development programs so everything in this repository can probably run on your computer too.

I use [this configuration](https://github.com/joseph-scott-campbell/dwm) on my laptop, and default [manjaro-gnome](https://www.gnome.org/) on my desktop.

I have a section in the README for each program.

# Neovim

My neovim configuration uses the tokyonight-vim implementation of the colorscheme. It has a tabbed interface and uses NerdTree for file management. It is integrated with tmux using vim-tmux-navigator.

I use code runner to have an IDE-like experience when running code.

![screenshot of neovim](./images/neovim.png)

# Tmux

My tmux configuration is highly modified. It uses fish as the default shell and has the keybinds modified to make it very vim-like. It also uses vim-tmux-navigator to integrate with neovim.

![screenshot of tmux](./images/tmux.png)

# Alacritty

I have a fairily basic alacritty configuration. The only changes I made were making the font FiraMono Nerd Font, making it automatically launch tmux, and making the colorscheme Tokyo-Night.

# Starship

I edited the default tokyo-night starship theme to be on a single line. I chose the GNU icon because I use the same configuration on different distros, so I wanted something generic. If you don't like it, it is very easy to change. Just get the [nerd font icon](https://www.nerdfonts.com/) you want to use, and replace the logo in the config.

![screenshot of starship prompt](./images/starship.png)
