# Linux config

My personal `zsh` config.

# Installation

## Arch based

```sh
sudo pacman -S --noconfirm zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
yay -S --noconfirm zsh-theme-powerlevel10k-git
```

## Debian based

[zsh-completions](https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-completions&package=zsh-completions)

```sh
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting git
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k
```

## OpenSUSE

[zsh-autosuggestions](https://software.opensuse.org/download.html?project=shells:zsh-users:zsh-autosuggestions&package=zsh-autosuggestions)
[zsh-completions](https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-completions&package=zsh-completions)
[zsh-syntax-highlighting](https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-syntax-highlighting&package=zsh-syntax-highlighting)

```sh
sudo zypper install -y zsh git
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k
```

# Configs

```sh
curl 'https://raw.githubusercontent.com/sewiti/linux-config/main/.zshrc' -o ~/.zshrc
curl 'https://raw.githubusercontent.com/sewiti/linux-config/main/.p10k.zsh' -o ~/.p10k.zsh
chsh -s /bin/zsh
```
