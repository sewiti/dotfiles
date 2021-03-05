# Linux config

My personal config.

# Zsh

## Arch

```bash
sudo pacman -S --noconfirm zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
yay -S --noconfirm zsh-theme-powerlevel10k-git
```

## Ubuntu

```bash
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting git
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k
```

## OpenSUSE Tumbleweed

```bash
sudo zypper addrepo https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/openSUSE_Tumbleweed/shells:zsh-users:zsh-autosuggestions.repo 
sudo zypper addrepo https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/openSUSE_Tumbleweed/shells:zsh-users:zsh-completions.repo
sudo zypper addrepo https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/openSUSE_Tumbleweed/shells:zsh-users:zsh-syntax-highlighting.repo
sudo zypper refresh
sudo zypper install -y zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting git
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k
```

# Micro

## Arch

```bash
sudo pacman -S --noconfirm micro
```

## Ubuntu

```bash
sudo apt install -y micro
```

## Other

https://micro-editor.github.io

```bash
curl https://getmic.ro | bash
sudo mkdir -p /opt/micro
sudo mv ./micro /opt/micro/
sudo chown -R root:root /opt/micro
sudo ln -s /opt/micro/micro /usr/bin/micro
```

# lf

## Arch

```bash
yay -S --noconfirm lf
```

## Ubuntu 20.04

https://software.opensuse.org/download.html?project=home:Provessor&package=lf

```bash
echo 'deb http://download.opensuse.org/repositories/home:/Provessor/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:Provessor.list
curl -fsSL https://download.opensuse.org/repositories/home:Provessor/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_Provessor.gpg > /dev/null
sudo apt update
sudo apt install lf
```

# Git-flow

## Arch

```bash
yay -S --noconfirm gitflow-avh gitflow-zshcompletion-avh
```

## Ubuntu

```bash
sudo apt install -y git-flow
```

# Configs

```bash
curl -s 'https://raw.githubusercontent.com/Sewiti/linux-config/main/.profile' >> "$HOME/.profile"
curl 'https://raw.githubusercontent.com/Sewiti/linux-config/main/.p10k.zsh' -o "$HOME/.p10k.zsh"
curl 'https://raw.githubusercontent.com/Sewiti/linux-config/main/.zshrc' -o "$HOME/.zshrc"
touch "$HOME/.cache/zshhistory"
chsh -s /bin/zsh
```
