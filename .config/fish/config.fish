# ~/.config/fish/config.fish
#
# Este archivo se ejecuta en TODOS los shells de fish, interactivos y no.
# Regla: lo cosmetico y lo que depende de una terminal va dentro del
# `if status is-interactive`; el entorno (PATH, EDITOR) va FUERA, para que
# `fish -c ...`, los scripts y las herramientas externas vean lo mismo.

##### Entorno (interactivo y no interactivo) #####

set -gx EDITOR nvim
set -gx VISUAL nvim

# fish_add_path es idempotente y deduplica: por muchas veces que se reevalue
# config.fish (shells anidados, tmux, subshells) PATH no vuelve a crecer.
# El `test -d` evita meter en PATH rutas que no existen.
for dir in ~/.local/bin ~/bin
    test -d $dir; and fish_add_path --global $dir
end

##### Solo shells interactivos #####

if status is-interactive
    set -g fish_greeting ""

    # Longitud de cada directorio en el prompt (1 = solo la inicial).
    set -g fish_prompt_pwd_dir_length 1

    # Variables de tema de Oh My Fish. Solo surten efecto si hay un tema omf
    # instalado (bobthefish, agnoster...); ahora mismo no hay ninguno.
    set -g theme_display_user yes
    set -g theme_hide_hostname yes
    set -g theme_hostname always

    ##### Aliases #####
    # `alias` en fish genera una funcion que antepone `command` cuando el
    # nombre coincide con el primer palabra del cuerpo, asi que `alias ls
    # "ls ..."` no se llama a si mismo. Los demas (la/ll/lla) si pasan por la
    # funcion `ls`, y por eso heredan sus opciones sin repetirlas.
    alias ls "ls -p --color=auto"
    alias la "ls -A"
    alias ll "ls -l"
    alias lla "ls -lA"
    alias g git

    command -q nvim; and alias vim nvim
end
