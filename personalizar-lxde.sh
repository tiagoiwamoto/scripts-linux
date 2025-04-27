#!/bin/bash

set -e

echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando Plank (dock estilo Mac)..."
sudo apt install plank -y

echo "Instalando Ulauncher (launcher estilo Spotlight)..."

# Instalar dependências
sudo apt install wget software-properties-common -y

# Adicionar repositório do Ulauncher
sudo add-apt-repository ppa:agornostal/ulauncher -y

# Atualizar a lista de pacotes
sudo apt update

# Instalar Ulauncher
sudo apt install ulauncher -y

echo "Instalando Nemo (navegador de arquivos)..."
sudo apt install nemo -y

echo "Instalando LXAppearance (configurador de temas)..."
sudo apt install lxappearance -y

echo "Baixando e instalando tema McMojave..."
mkdir -p ~/.themes
cd ~/.themes
if [ ! -d "McMojave-theme" ]; then
  git clone https://github.com/vinceliuice/McMojave-theme.git
  cd McMojave-theme
  ./install.sh
else
  echo "Tema McMojave já está baixado."
fi

echo "Baixando e instalando ícones La Capitaine..."
mkdir -p ~/.icons
cd ~/.icons
if [ ! -d "la-capitaine-icon-theme" ]; then
  git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
else
  echo "Ícones La Capitaine já estão baixados."
fi

echo "Configurando o Plank para iniciar automaticamente..."
mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/plank.desktop
[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Plank
EOF

echo "Definindo o Nemo como navegador de arquivos padrão..."
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

echo "Baixando papéis de parede..."

mkdir -p ~/Imagens/Wallpapers/{Natureza,Carros,Animes}

# Natureza
wget -P ~/Imagens/Wallpapers/Natureza https://images.unsplash.com/photo-1506744038136-46273834b3fb
wget -P ~/Imagens/Wallpapers/Natureza https://images.unsplash.com/photo-1501785888041-af3ef285b470

# Carros
wget -P ~/Imagens/Wallpapers/Carros https://images.unsplash.com/photo-1511919884226-fd3cad34687c
wget -P ~/Imagens/Wallpapers/Carros https://images.unsplash.com/photo-1503376780353-7e6692767b70

# Animes
wget -P ~/Imagens/Wallpapers/Animes https://wallpapers.com/images/hd/naruto-clouds-aesthetic-3b4uzkwi07m48v7x.jpg
wget -P ~/Imagens/Wallpapers/Animes https://wallpapers.com/images/hd/one-piece-straw-hats-crew-ship-painting-aesthetic-1fz9p1uoyp35i3k7.jpg

echo ""
echo "✨ Tudo pronto! ✨"
echo "Sugestão: Abra o LXAppearance para escolher o tema McMojave e ícones La Capitaine."
echo "Sugestão: Configure o Plank para personalizar tamanho dos ícones, tema da dock etc."
echo "Sugestão: Escolha seus novos papéis de parede em ~/Imagens/Wallpapers/"
