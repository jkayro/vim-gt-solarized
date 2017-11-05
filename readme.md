Vim Gnome Terminal Dark Solarized
---
![Print vim](https://raw.githubusercontent.com/jkayro/vim-gt-solarized/master/print-vim.jpg)

Estes são os arquivos de configurações do VIM que uso para o trabalho, está configurado com o tema solarized dark e 
preparado para ser usado no gnome-terminal 3.18+ com dircolors instalado. Vem com os seguintes plugins instalados:

* [Pathogen](https://github.com/tpope/vim-pathogen)
* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim)
* [Syntastic](https://github.com/vim-syntastic/syntastic)
* [Vim Airline](https://github.com/vim-airline/vim-airline)
* [Vim Color Solarized](https://github.com/altercation/vim-colors-solarized)
* [Vim Fugitive](https://github.com/tpope/vim-fugitive)
* [Vim Markdown](https://github.com/plasticboy/vim-markdown)

Dentre vários outros...

Instalação
===

Deduzindo que está sendo instalado sobre o gnome-terminal versão 3.18 ou superior.

**1-** Instalar [dircolors para gnome-terminal](https://github.com/Anthony25/gnome-terminal-colors-solarized):


`$ sudo apt-get install dconf-cli`


`$ git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git`


`$ cd gnome-terminal-colors-solarized`


`$ ./install.sh`


**2-** Instalar o pacote de fontes powerline:



`$ sudo apt-get install fonts-powerline`



**3-** Remover os arquivos de configuração do VIM caso existam, clonar este repositório em um diretório 
temporário e copiar a pasta .vim e o arquivo .vimrc do repositório para a pasta de usuário.


**4-** Instalar [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) 
