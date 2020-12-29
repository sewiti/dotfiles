# Linux config

My personal config.

# Prerequisites

## Arch

```bash
sudo pacman -S --noconfirm zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting micro
yay -S --noconfirm zsh-theme-powerlevel10k-git lf gitflow-avh gitflow-zshcompletion-avh
```

## Ubuntu

```bash
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting micro git-flow
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k
```

### [List files](https://software.opensuse.org//download.html?project=home:Provessor&package=lf)

```bash
echo 'deb http://download.opensuse.org/repositories/home:/Provessor/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:Provessor.list
curl -fsSL https://download.opensuse.org/repositories/home:Provessor/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_Provessor.gpg > /dev/null
sudo apt update
sudo apt install lf
```

# Installation

```bash
git clone --depth=1 "https://github.com/Sewiti/linux-config.git" "$HOME"
rm -rf "$HOME/.git"
rm -f "$HOME/README.md"
touch "$HOME/.cache/zshhistory"
chsh -s /bin/zsh
```
