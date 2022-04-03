<div align="center">
    <img src="./dot.png" width="100" />
</div>

# dotfiles

Every config, command and program for a fresh linux installation.

## Initial Setup

Run `./setup.sh` first.

## Node and Yarn

Install LTS node:

```bash
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs
```

Install yarn:

```bash
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```

Or:

```
npm install --global yarn
```

## fnm

Install fnm from [https://github.com/Schniz/fnm](https://github.com/Schniz/fnm).

For zsh completions:

```
fnm completions --shell zsh > ~/.zfunc/_fnm
```

Install LTS:

```
fnm install --lts
```

## vim-plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## env variables

create `.env.local` file under `~/`. The content of that file will be loaded by zsh. (This should be created already with `./setup.sh` script)

## gitconfig

Create a `~/.gitconfig.local` file to store custom/secret git configuration. It will be included in `~/.gitconfig` file.

## i3

All required configs and files will be copied with `./setup.sh` script. Additionaly, below programs should be installed to `~/.config`:

- https://github.com/Raymo111/i3lock-color
- https://github.com/Mange/rofi-emoji
- https://github.com/vivien/i3blocks-contrib

Also clone, build and install https://github.com/vivien/i3blocks under `~/.local/lib`
