# Mac Development Setup

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [What Macbook do I have?](#what-macbook-do-i-have)
- [Homebrew / Terminal / Shell](#homebrew--terminal--shell)
  - [Homebrew](#homebrew)
  - [Terminal](#terminal)
  - [Shell](#shell)
    - [Install Oh My Zsh and set plugins configuration](#install-oh-my-zsh-and-set-plugins-configuration)
    - [Customizing ZSH Shell with `.zshrc`](#customizing-zsh-shell-with-zshrc)
    - [Commands used by my .zshrc](#commands-used-by-my-zshrc)
    - [Install the latest version of git](#install-the-latest-version-of-git)
    - [Other command line tools I use](#other-command-line-tools-i-use)
- [OS Productivity](#os-productivity)
  - [Window Management](#window-management)
- [Other Apps I Use Daily](#other-apps-i-use-daily)
- [OS Settings](#os-settings)
  - [Finder](#finder)
- [Menu Bar Customization](#menu-bar-customization)
  - [System Stats Widgets](#system-stats-widgets)
  - [Menu Bar Calendar](#menu-bar-calendar)
- [Web Browser](#web-browser)
  - [Brave](#brave)
- [Node.js](#nodejs)
  - [Global Modules](#global-modules)
- [VS Code](#vs-code)
- [Break Timer](#break-timer)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This repository contains info on all the Apps / Tools / Settings I use on my Mac.

## What Macbook do I have?

![MacBook Pro 16 M1 Max](.github/assets/macbook.jpg)
These are the specs at a glance:

- Apple M1 Max
- 32GB RAM
- 1TB SSD

You can read more about it [here](https://everymac.com/systems/apple/macbook_pro/specs/macbook-pro-m1-max-10-core-cpu-32-core-gpu-16-2021-specs.html)

## Homebrew / Terminal / Shell

### Homebrew

[Homebrew](https://brew.sh/) allows us to install tools and apps from the command line.

To install it, open up the built in `Terminal` app and run this command:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This will also install the xcode build tools which is needed by many other developer tools.

After Homebrew is done installing, we will use it to install everything else we need.

### Terminal

The first app I install is to replace the built in `Terminal`.

I prefer [iTerm2](https://iterm2.com/) because:

- Nice [window chrome](https://en.wiktionary.org/wiki/chrome#Noun)
- Lots of customization options
- Clickable links
- Native OS notifications

> Quick aside - "window chrome" is another term for the basic structural elements used in a graphical user interface, such as window frames and scroll bars, as opposed to the content. After having a few people review this, I realize not everyone knows / uses that term 😅

There are a lot of options for a terminal replacement, but I've been using iTerm2 for years and it works great for my needs.

Checkout their documentation for more info on what iTerm2 can do: [https://iterm2.com/documentation.html](https://iterm2.com/documentation.html)

We install this using a Homebrew "cask". Casks are full applications, similar to what you would install from the App store.

```sh
brew install iterm2
```

Once installed, launch it and customize the settings / preferences to your liking. These are my preferred settings:

- Appearance
  - Theme
    - Shades Of Purple
- Profiles
  - Default
    - General -> Working Directory -> Reuse previous session's directory
    - Colors -> Basic Colors -> Foreground -> Lime Green
    - Text -> Font -> JetBrainsMono
      - You can download this font [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0/JetBrainsMono.zip).
      - I use this font in VS Code as well
    - Text -> Font Size -> 14
    - Keys -> Key Mappings -> Presets -> Natural Text Editing
      - This allows me to use the [keyboard shortcuts](https://gist.github.com/hayato-eth/76757cb373b1cab9f1ebe77039709a29) I know and love inside of iTerm2

### Shell

Mac now comes with `zsh` as the default [shell](https://en.wikipedia.org/wiki/Comparison_of_command_shells).

#### Install Oh My Zsh and set plugins configuration

To see what shell is currently your default, run:

```sh
echo $SHELL
```

To install the latest version of oh-my-zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Powerlevel10k using the following command:

```sh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Then you need to enable it, change the value of ZSH_THEME to following in ~/.zshrc file :

```sh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Go to Ruby directory and install Colorls:

```sh
cd /opt/homebrew/Cellar/ruby/<x.x.x>/bin
# Then
./gem install colorls
```

Now you are ready to link this library to the default one you installed before

```sh
ln -s /opt/homebrew/lib/ruby/gems/<x.x.x>/bin/colorls /usr/local/bin/colorls
```

#### Customizing ZSH Shell with `.zshrc`

I have a custom `.zshrc` with all of my custom settings including a customized prompt, aliases, PATH variables, colors and more.

If you do not want to go through the process of customizing your `.zshrc`, you can install [Oh My ZSH Bash](https://ohmyz.sh/) to get a ton of customizations out of the box.

I store my `.zsh` on [github here](https://github.com/hayato-eth/mac-setup/main/src/.zshrc) so I can copy it over to any machine I'm setting up.

Copy this file (or create your own) in your home directory:

```sh
cd ~
curl -O https://raw.githubusercontent.com/hayato-eth/mac-setup/main/src/zsh/.zshrc
```

#### Commands used by my .zshrc

- [zsh-completions](https://github.com/zsh-users/zsh-completions) - Additional completion definitions for ZSH
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Additional suggestions for ZSH
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) - Feature-rich syntax highlighting for ZSH

#### Install the latest version of git

My Mac came with `git` version `2.32.1`, we can use brew to install the latest version of `git`:

```sh
git --version
brew install git
```

Open a new tab / window to start using the latest version:

```sh
git --version
```

Configure git with your name / email and preferred editor:

```sh
git config --global user.name Vinicius Rocha

git config --global user.email vinicius.workspace@gmail.com

git config --global core.editor vim

git config --global init.defaultBranch main
```

Configuration for commits:

- [Signing commits using GPG](https://gist.github.com/hayato-eth/458f0622de2990275755e3939413aa64)
- [SSH Key to Github](https://gist.github.com/hayato-eth/442358ab92b9928a81c8f6d6425a5daa)

#### Other command line tools I use

- [ffmpeg](https://en.wikipedia.org/wiki/FFmpeg) - edit videos from the command line

```sh
brew install ffmpeg
```

## OS Productivity

### Window Management

I know this feature is built in to a lot of other operating systems, but it is not built in to a Mac, so we need an app for it.

I use [rectangle](https://rectangleapp.com/) to move and resize windows using keyboard shortcuts. I used to use [spectacle](https://www.spectacleapp.com/), but rectangle is more regularly maintained and allows me to use all of the same keyboard shortcuts as spectacle.

I highly recommend installing this and memorizing the keyboard shortcuts. Fluid and seamless window management is key to being productive while coding.

```sh
brew install rectangle
```

## Other Apps I Use Daily

- [1Password](https://www.1password.com/) - The perfect password manager for ecosystem apple
- [Brave](https://www.brave.com/) - Preferred Web browser
- Android File Transfer - Transfer files to / from my android phone
- Android Platform Tools - Installs `adb` without the need for the full android studio
- [Cleanshot](https://cleanshot.com/) - The ultimate screen recording app made for macOS
- [Discord](https://discord.com/) - Messaging / Community
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) - The fastest way to containerize applications
- [Fig](https://fig.io/) - Boost terminal integration
- [Figma](https://www.figma.com/) - UI Design Tool
- [Insomnia](https://insomnia.rest/products/insomnia) - HTTP / REST / GraphQL tester / requester
- [Raycast](https://www.raycast.com/) - An app that allows you to control just about every aspect of your MacBook
- [Slack](https://slack.com/) - Messaging / Community
- [VLC](https://www.videolan.org/) - I use VLC to watch videos instead of the built in QuickTime.
- [Visual Studio Code](https://code.visualstudio.com/) - Code Editor

You can install them in one go by placing them all into a text file and then running brew install:

```txt
1password
android-file-transfer
android-platform-tools
brave-browser
cleanshot
discord
fig
figma
insomnia
raycast
slack
visual-studio-code
vlc
```

```sh
xargs brew install < apps.txt
```

## OS Settings

These are my preferred settings for `Finder` and the `Dock`.

### Finder

- Finder -> Preferences
  - General -> Show these on the desktop -> Select None
    - I try to keep my desktop completely clean.
  - General -> New Finder windows show -> Home Folder
    - I prefer to see my home folder in each new finder window instead of recent documents
  - Advanced -> Show all filename extensions -> Yes
  - Advanced -> Show warning before changing an extension -> No
  - Advanced -> When performing a search -> Search the current folder
- View
  - Show Status Bar
  - Show Path Bar
  - Show Tab Bar

## Menu Bar Customization

### System Stats Widgets

I like to see my network traffic, CPU temp / usage and RAM usage at a glance.

I used to use [stats](https://github.com/exelban/stats), a FOSS menu bar stats app.

In each widget, a key setting to look for is under "widget settings", choose "merge widgets into one".

```sh
brew install stats
```

### Menu Bar Calendar

I like to have a calendar in the menu bar that I can quickly look at. stats does not include one, so I found [cron](https://www.cron.com/). It seems fine for my needs.

```sh
brew install cron
```

## Web Browser

### Brave

I use Brave because it is open source based on Chromium and it focuses heavily on performance and user privacy.

I use the following extensions to help me while developing:

- [ColorZilla](https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp)
  - Advanced Eyedropper, Color Picker, Gradient Generator and other colorful goodies.
- [CSS Peeper](https://chrome.google.com/webstore/detail/css-peeper/mbnbehikldjhnfehhnaidhjhoofhpehk)
  - CSS Peeper is a CSS viewer tailored for Designers. Get access to the useful styles with our Chrome extension.
- [Designer Daily Report](https://chrome.google.com/webstore/detail/designer-daily-report/imjkkofdknonmlapjelmafbikikbegbi)
  - This extension opens a daily Designer Report on a background tab (non-distracting) roughly around 00:00AM PST time as the report is ready.
- [Image Downloader](https://chrome.google.com/webstore/detail/image-downloader/cnpniohnfphhjihaiiggeabnkjhpaldj)
  - Browse and download images on the web.
- [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)
  - It is a Chrome extension for printing JSON and JSONP.
- [Octotree](https://chrome.google.com/webstore/detail/octotree-github-code-tree/bkhaagjahfmjljalopjnoealnfndnagc)
  - Browser extension that enhances GitHub code review and exploration.
- [Panda 5](https://chrome.google.com/webstore/detail/panda-5-your-favorite-web/haafibkemckmbknhfkiiniobjpgkebko)
  - Panda is the simple free newsreader. Discover the best tools, resources, and inspiration in the world of design and tech. Find everything in one place.
- [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
  - Adds React debugging tools to the Chrome Developer Tools.
- [Redux DevTools](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)
  - The extension provides power-ups for your Redux development workflow. Apart from Redux, it can be used with any other architectures which handle the state.
- [Responsive Viewer](https://chrome.google.com/webstore/detail/responsive-viewer/inmopeiepgfljkpkidclfgbgbmfcennb)
  - A Chrome extension to show multiple screens in one view while developing responsive websites/applications.

## Node.js

I use nvm to manage the installed versions of Node.js on my machine. This allows me to easily switch between Node.js versions depending on the project I'm working in.

See installation instructions [here](https://github.com/nvm-sh/nvm#installing-and-updating).

OR run this command (make sure v0.39.3 is still the latest)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

After installation you'll want to add the following to your .bash_profile / .zshrc etc.

```sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

Now that nvm is installed, you can install a specific version of node.js and use it:

```sh
nvm install --lts
node --version
```

### Global Modules

There are a few global node modules I use a lot:

- lite-server
  - Auto refreshing static file server. Great for working on static apps with no build tools.
- license
  - Auto generate open source license files
- gitignore
  - Auto generate `.gitignore` files base on the current project type
- yarn
  - Is a package manager that doubles down as project manager.
- pnpm
  - Is a package manager that doubles down as project manager.
- @angular/cli
  - The Angular CLI to create projects, generate application and library code, and perform a variety of ongoing development tasks such as testing, bundling, and deployment.

```sh
npm install -g lite-server license gitignore yarn pnpm @angular/cli
```

## VS Code

VS Code is my preferred code editor.

You can view all of my VS Code settings / extensions [here](https://github.com/hayato-eth/mac-setup/tree/main/src/vscode).

2 of the most notable settings are:

```json
{
  "editor.linkedEditing": true,
  "editor.snippetSuggestions": "top"
}
```

- editor.linkedEditing
  - Automatically edit a closing tag when editing an opening tag
- editor.snippetSuggestions
  - Puts the most relevant auto complete options at the top

## Break Timer

I use an app called [Time Out](https://www.dejal.com/timeout/).

I have it setup to show:

- 10 second micro break every 15 minutes
- 5 minute long break every 60 minutes
