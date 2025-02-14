# Introduction 📖

[![LuaRocks](https://img.shields.io/luarocks/v/brianhuster/live-preview.nvim?logo=lua&color=purple)](https://luarocks.org/modules/brianhuster/live-preview.nvim)

live-preview.nvim is a plugin for Neovim that allows you to view [Markdown](https://en.wikipedia.org/wiki/Markdown), [HTML](https://en.wikipedia.org/wiki/HTML) (along with CSS, JavaScript) and [AsciiDoc](https://asciidoc.org/) files in a web browser with live updates. No external dependencies or runtime like NodeJS or Python are required, since the backend is fully written in Lua and Neovim's built-in functions.

_You can read this README in [Tiếng Việt](README.vi.md)_

# Features ✨
 
* Supports markdown, HTML (with reference to CSS, JS), and AsciiDoc files 📄
* Support Katex for rendering math equations in markdown and AsciiDoc files 🧮
* Supports mermaid for rendering diagrams in markdown files 🖼️
* Syntax highlighting for code blocks in Markdown and AsciiDoc 🖍️
* Supports sync scrolling in the browser as you scroll in the Markdown files in Neovim. (You need to enable `sync_scroll` in [setup](#setup). This feature should be used with [brianhuster/autosave.nvim](https://github.com/brianhuster/autosave.nvim)) 🔄
* Integration with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 🔭, [`fzf-lua`](https://github.com/ibhagwan/fzf-lua) and [`mini.pick`](https://github.com/echasnovski/mini.pick) for opening files to preview 📂

## Updates 🆕
 
See [RELEASE.md](RELEASE.md) 

**⚠️ Important Notice:** You should clear the cache of the browser after updating to ensure the plugin works correctly.

# Demo video 🎥
 
https://github.com/user-attachments/assets/865112c1-8514-4920-a531-b2204194f749

# Requirements 📋
 
- Neovim >=0.10.0 (recommended: >=0.10.1 compiled with LuaJIT) 📟
- A modern web browser 🌐
- PowerShell (only if you use Windows) 🪟

# Installation 🛠️
 
You can install this plugin using a plugin manager. Most plugin managers are supported. Below are some examples

<details>
<summary>Using lazy.nvim (recommended) 💤</summary>

```lua
require("lazy").setup({
    {
        'brianhuster/live-preview.nvim',
        dependencies = {
            'brianhuster/autosave.nvim'  -- Not required, but recomended for autosaving and sync scrolling

            -- You can choose one of the following pickers
            'nvim-telescope/telescope.nvim',
            'ibhagwan/fzf-lua',
            'echasnovski/mini.pick',
        },
        opts = {},
   }
})
```

</details>

<details>
<summary>mini.deps 📦</summary>

```lua
MiniDeps.add({
    source = 'brianhuster/live-preview.nvim',
    depends = { 
        'brianhuster/autosave.nvim'  -- Not required, but recomended for autosaving and sync scrolling

        -- You can choose one of the following pickers
        'nvim-telescope/telescope.nvim',
        'ibhagwan/fzf-lua',
        'echasnovski/mini.pick',
    }, 
})
```

</details>

<details>
<summary>rocks.nvim 🪨</summary>

```vim
:Rocks install live-preview.nvim
```
</details>

<details>
<summary>vim-plug 🔌</summary>

```vim
Plug 'brianhuster/live-preview.nvim'
Plug 'brianhuster/autosave.nvim' " Not required, but recomended for autosaving

" You can choose one of the following pickers
Plug 'nvim-telescope/telescope.nvim'
Plug 'ibhagwan/fzf-lua'
Plug 'echasnovski/mini.pick'
```

</details>

<details>
<summary>Native package (without a plugin manager) 📦</summary>

```sh
git clone --depth 1 https://github.com/brianhuster/live-preview.nvim ~/.local/share/nvim/site/pack/brianhuster/start/live-preview.nvim
```

</details>

# Setup ⚙️
 
You can customize the plugin by passing a table to the `opts` variable (if you use lazy.nvim) or the function `require('livepreview').setup()`. Here is the default configuration:

## In Lua

```lua
{
    cmd = "LivePreview", -- Main command of live-preview.nvim
    port = 5500, -- Port to run the live preview server on.
    autokill = false, -- If true, the plugin will autokill other processes running on the same port (except for Neovim) when starting the server.
    browser = 'default', -~/.co- Terminal command to open the browser for live-previewing (eg. 'firefox', 'flatpak run com.vivaldi.Vivaldi'). By default, it will use the default browser.
    dynamic_root = false, -- If true, the plugin will set the root directory to the previewed file's directory. If false, the root directory will be the current working directory (`:lua print(vim.uv.cwd())`).
    sync_scroll = false, -- If true, the plugin will sync the scrolling in the browser as you scroll in the Markdown files in Neovim.
    picker = nil, -- Picker to use for opening files. 3 choices are available: 'telescope', 'fzf-lua', 'mini.pick'. If nil, the plugin look for the first available picker when you call the `pick` command.
}
```

## In Vimscript
 
```vim
call v:lua.require('livepreview').setup({
    \ 'cmd': 'LivePreview', 
    \ 'port': 5500, 
    \ 'autokill': v:false, 
    \ 'browser': 'default', 
    \ 'dynamic_root': v:false, 
    \ 'sync_scroll': v:false, 
    \ 'picker': v:false, 
\ })
```

# Usage 🚀
 
## For default configuration (`opt.cmd = "LivePreview"`)
 
* To start the live preview, use the command:

`:LivePreview start`

This command will open the current Markdown or HTML file in your default web browser and update it live as you write changes to your file.

You can also parse a file path as argument, for example `:LivePreview start test/doc.md`

* To stop the live preview server, use the command:

`:LivePreview close`

* To open a picker and select a file to preview, use the command:

`:LivePreview pick`

* To see document about each subcommand, use the command:

`:LivePreview help`

This requires a picker to be installed (Telescope, fzf-lua or mini.pick). If you have multiple pickers installed, you can specify the picker to use by passing the picker name to the configuration table (see [setup](#setup))

Use the command `:help livepreview` to see the help documentation.

# Contributing 🤝
 
Since this is a young project, there should be a lot of rooms for improvements. If you would like to contribute to this project, please feel free to open an issue or a pull request.

# TODO ✅
- [x] Support for KaTex math in Markdown and AsciiDoc
- [x] Support for Mermaid diagrams in Markdown and AsciiDoc
- [x] Syntax highlighting for code blocks in Markdown and AsciiDoc
- [x] Autoscroll in the browser as you scroll in the Markdown files in Neovim
- [ ] Autoscroll in the browser as you scroll in the AsciiDoc files in Neovim
- [x] Integration with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 🔭, [`fzf-lua`](https://github.com/ibhagwan/fzf-lua) and [`mini.pick`](https://github.com/echasnovski/mini.pick)
- [ ] Support TUI web browsers like [carbonyl](https://github.com/fathyb/carbonyl), [browsh](https://github.com/browsh-org/browsh)

# Non goals 🚫
 
These are not in roadmap of live-preview.nvim right now, but pull requests are welcome
- Allow users to add custom css and js files in configuration [#49](https://github.com/brianhuster/live-preview.nvim/issues/49), [#50](https://github.com/brianhuster/live-preview.nvim/issues/50)

# Acknowledgements 🙏
 
* [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) and [Live Preview](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server) for the idea inspiration
* [glacambre/firenvim](https://github.com/glacambre/firenvim) for the sha1 function reference
* [sindresorhus/github-markdown-css](https://github.com/sindresorhus/github-markdown-css) CSS style for Markdown files
* [markdown-it/markdown-it](https://github.com/markdown-it/markdown-it) for parsing Markdown files
* [asciidoctor/asciidoctor.js](https://github.com/asciidoctor/asciidoctor.js) for parsing AsciiDoc files
* [KaTeX](https://github.com/KaTeX/KaTeX) for rendering math equations
* [mermaid-js/mermaid](https://github.com/mermaid-js/mermaid) for rendering diagrams
* [digitalmoksha/markdown-it-inject-linenumbers](https://github.com/digitalmoksha/markdown-it-inject-linenumbers) : A markdown-it plugin for injecting line numbers into html output

# Buy me a coffee ☕
 
Maintaining this project takes time and effort, especially as I am a student now. If you find this project helpful, please consider supporting me :>

<a href="https://paypal.me/brianphambinhan">
    <img src="https://www.paypalobjects.com/webstatic/mktg/logo/pp_cc_mark_111x69.jpg" alt="Paypal" style="height: 69px;">
</a>
<a href="https://img.vietqr.io/image/mb-9704229209586831984-print.png?addInfo=Donate%20for%20livepreview%20plugin%20nvim&accountName=PHAM%20BINH%20AN">
    <img src="https://github.com/user-attachments/assets/f28049dc-ce7c-4975-a85e-be36612fd061" alt="VietQR" style="height: 85px;">
</a>
<a href="https://me.momo.vn/brianphambinhan">
    <img src="https://github.com/user-attachments/assets/3907d317-b62f-43f5-a231-3ec7eb4eaa1b" alt="Momo (Vietnam)" style="height: 85px;">
</a>

