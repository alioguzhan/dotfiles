<div align="center">
    <img src="./dot.png" width="100" />
</div>

# dotfiles

Every config, command and program for a fresh linux installation.

## Initial Setup

install oh-my-zsh first:
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then run `./setup.sh`.

Install starship as well:

```bash
curl -sS https://starship.rs/install.sh | sh
```

## Common Programs and Configurations

run `./install-common-programs.sh` to install and configure some common apps.

## env variables

create `.env.local` file under `~/`. The content of that file will be loaded by zsh. (This should be created already with `./setup.sh` script)

## gitconfig

Create a `~/.gitconfig.local` file to store custom/secret git configuration. It will be included in `~/.gitconfig` file.

## i3

All required configs and files will installed and copied with `./i3.sh` script. Additionaly, below programs should be installed to `~/.config`:

- https://github.com/Raymo111/i3lock-color
- https://github.com/Mange/rofi-emoji
- https://github.com/vivien/i3blocks-contrib

Also clone, build and install https://github.com/vivien/i3blocks under `~/.local/lib`
