# dotfiles
Every config and command and program for a fresh linux installation


## node and yarn

Install LTS node:

```bash
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install gcc g++ make
sudo apt install nodejs
```

Install yarn:

```bash
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```

## nvm

Install nvm from [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvmi)
