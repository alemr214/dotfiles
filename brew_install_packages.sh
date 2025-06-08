# Para ejectutar este archivo .sh
# Dar permisos de ejecucion con chmod +x brew_install_packages.sh
# Luego ejecutar con ./brew_install_packages.sh
#
#
#
#
#
# Actualizar Homebrew
echo 'Actualizando Homebrew...'
brew update

# Actualizar paquetes
echo 'Actualizando paquetes paquetes...'
brew upgrade

# Instalando los paquetes de Homebrew
echo 'Instalando paquetes: GCC, Git, JupyterLab, Neovim, Node, Python, Postgresql, Fish, Fisher, Z, Tmux, MacTex'
brew install gcc git jupyterlab neovim node python postgresql fish fisher z tmux mactex

# Instalando los paquetes de Homebrew Casks
echo 'Instalando paquetes: Bruno, Discord, Epic Games, Google Chrome, Iterm2, Microsoft Teams, Nvidia Geforce Now, Raspberry Pi Imager, Steam, VLC, Figma, Visual Studio Code'
brew install --cask bruno discord google-chrome iterm2 microsoft-teams raspberry-pi-imager vlc figma visual-studio-code font-hack-nerd-font
