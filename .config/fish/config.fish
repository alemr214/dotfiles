if status is-interactive
    set -gx TERM xterm-256color
    set fish_greeting ""

    # Theme

    set -g fish_prompt_pwd_dir_length 1
    set -g theme_display_user yes
    set -g theme_hide_hostname yes
    set -g theme_hostname always


    # Aliases
    alias ls "ls -p -G --color=auto"
    alias la "ls -A --color=auto"
    alias ll "ls -l --color=auto"
    alias lla "ll -A --color=auto"
    alias g git
    command -qv nvim && alias vim nvim

    set -gx EDITOR nvim

    set -gx PATH bin $PATH
    set -gx PATH ~/bin $PATH
    set -gx PATH ~/.local/bin $PATH

    tmux
    clear
end
