# Sicheng Neovim Configuration

This Configuration use `Lazy.vim` as the plugins management tool.
And use the `LazyVim` as preload plugins.

Refer to :

- [astonvim_with_coc_or_mason](https://github.com/chaozwn/astronvim_with_coc_or_mason/tree/astro_v4)
- [LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua)

## The Project Structure

```txt
.
├── init.lua
└── lua
    ├── config
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins
        ├── example.lua
        └── lazy
```

## Lazy Plugins Reset

The `plugins.lazy` use to reset the lazy.vim plugins. There is a list of those plugins:

- [blink.cmp](https://github.com/Saghen/blink.cmp) 高性能、全功能的补全插件。它提供了代码补全功能，支持多种源。
- [bufferline.nvim](https://gitcode.com/gh_mirrors/bu/bufferline.nvim) 现代、可定制的标签栏，用于管理打开的缓冲区(文件)。
- [flash.nvim](https://github.com/folke/flash.nvim) 导航工具，支 持搜索集成，增强字符移动，多窗口跳转、远程动作，treesitter集成等特性。
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) 为编程语言预配置代码片段。
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) git集成插件。
- [lazydev.nvim](https://gitcode.com/gh_mirrors/la/lazydev.nvim) 通过懒加载策略优化插件加载机制，显著提高性能和速度。
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) 提供一个状态栏插件。
- [mason.nvim](https://github.com/williamboman/mason.nvim) 安装和管理LSP服务的包管理器。
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) `mason.nvim`的扩展，使得其与`nvim.lspconfig`的使用更加容易，主要负责注册`nvim.lspconfig`的设置钩子。
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/README.md)
LSP服务的官方接口。
- [mini.ai](https://gitcode.com/gh_mirrors/mi/mini.ai) 扩展和创建a/i文本对象。
- [mini.icons](https://github.com/echasnovski/mini.icons) 提供ASCII风格图标。
- [neo-tree.nvim](https://gitcode.com/gh_mirrors/ne/neo-tree.nvim) 提供文件树界面。
- [noice.nvim](https://github.com/folke/noice.nvim) 将消息、命令行和弹出菜单的用户界面用窗口的形式显示，并且提供消息缓存。
- [nui.nvim](https://gitcode.com/gh_mirrors/nu/nui.nvim) UI组件库
- [nvim-lint](https://gitcode.com/gh_mirrors/nv/nvim-lint) 异步linting插件。
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 利用Tree-siiter提供语法的分析，提供精确的语法高亮、代码折叠、代码格式化、代码重构、代码导航、自动补全、Linting和静态分析、文本对象以及增量选择等功能。
- [nvim-treesitter-textobjects](https://gitcode.com/gh_mirrors/nv/nvim-treesitter-textobjects)
在`treesitter`的基础上提供更复杂的文本选中、移动、交换或窥视编辑等高级特性。
- [nvim-ts-autotag](https://gitcode.com/gh_mirrors/nv/nvim-ts-autotag) 利用Tree-sitter来自动管理HTML/XML标签的闭合。
- [plenary.nvim](https://gitcode.com/gh_mirrors/nv/nvim-ts-autotag) 为Neovim提供了许多使用工具和模块。
- [snacks.nvim](https://github.com/folke/snacks.nvim) 一系列用户界面组件和功能，例如创建和切换终端窗口、动画库、窗口样式自定义等。
- [todo-command.nvim](https://github.com/folke/todo-comments.nvim) 高亮显示代码注释中的TODO、HACK、BUG等标签，并提供查找和搜索功能。
- [tokyonight.nvim](https://github.com/imjoshellis/tokyonight.nvim) UI主题。
- [trouble.nvim](https://github.com/folke/trouble.nvim) 提供了一个漂亮且直观的界面来展示代码中的错误、警告、LSP诊断等。
- [ts-comments.nvim](https://github.com/folke/ts-comments.nvim) 增强原生注释功能。
- [which-key.nvim](https://gitcode.com/gh_mirrors/wh/which-key.nvim)快捷键帮助界面。
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) 允许交互式来查找并跳转文件,代码搜索、导航、git历史等。
- [catppuccin](https://github.com/catppuccin/catppuccin) 柔和UI主题
- [conform.nvim](https://github.com/stevearc/conform.nvim) 格式化插件。
- [persistence.nvim](https://github.com/folke/persistence.nvim) 自动化Neovim会话管理。

### Plugins Reset and Usage

- `blink.cmp`: 使用`keymap`来选择自动补全。
  
  Reset:
  - keymap set to 'super-tab'
- `flash.nvim`:
  
  - using `/` or `?` to search.
  - Enhanced `f`,`t`,`F`,`T` motions.
- `neo-tree`:

  - not hide dot file and gitignore

## Plugins

There are others plugins as follows:

- [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim) 通过事件机制自动保存文件。
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) 利用命令和钩子快速注释的工具。
  
  - `gcc` 快速(取消)注释当前选中内容
  - `gbc` 块注释的形式(取消)注释选中内容
  - 可以通过计数前缀来注释当前光标下$n$行。

### Markdown plugins

There is a series plugins working for markdown:

- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file)
渲染Markdown文本，使得更加易读。
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) 通过MarkdownPreview命令在浏览器中预览markdown文件。
- `conform.nvim` 设置prettierd和prettier来格式化markdown文档。

### Python plugins

There is a series plugins working for python:

- [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) python虚拟环境选择工具
- [neotest-python](https://github.com/nvim-neotest/neotest-python) 基于neotest框架使用pytest进行测试.
- [basedpyright](https://detachhead.github.io/basedpyright) 基于mason-lspconfig进行配置的LSP服务。

```note
需要系统具有basedpyright包
```

## LSP Servers

`Mason`用于安装和下载LSP服务。下面是一些预装的LSP服务:

- `cmakelang` cmake lsp工具
- `cmakelint` cmake文件lint
- `codelldb` LLDB调试工具
- `lua-language-server` lua lsp工具
- `marksman` markdown文档
- `neocmakelsp` Cmake语法高亮、它提供了代码补全功能
- `pyright` 微软开发的静态类型检查器。
- `python-lsp-server` python LSP服务
- `ruff` python linter和格式化工具。
- `rust-analyzer` Rust的LSP服务器
- `shfmt` shell脚本LSP工具
- `stylua` lua代码格式化工具
- `taplo` toml格式化工具
- `typos-lsp` 检查英语拼写错误的LSP工具
