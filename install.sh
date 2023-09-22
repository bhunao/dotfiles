curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

sudo apt install i3
sudo apt install rofi

git clone https://github.com/bhunao/dotfiles.git
cd dotfiles
cp nvim ~/.config/nvim
cp i3 ~/.config/i3
