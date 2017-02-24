# nvimconf
My Neovim configurations

# Installation
You can just clone the repository and create a link to downloaded directory:

```bash
mkdir -p ~/.config
git clone https://github.com/aminfara/nvimconf.git ~/.config/nvim
nvim
```

# Key bindings
Mode | Key | Function
---- | --- | --------
i | `jk` | escape to normal mode
n | `<C-h>` | jump to left window
n | `<C-j>` | jump to bottom window
n | `<C-k>` | jump to top window
n | `<C-l>` | jump to right window
n,i | `<F2>` | Toggle paste mode
n | `<F3>` | No highlight search
n | `<F4>` | Toggle spell checking
n, v | `<Leader>s` | easymotion search
n | `<Leader>fb` | FZF Buffers
n | `<Leader>fc` | FZF Commands
n | `<Leader>ff` | FZF Files
n | `<Leader>fh` | FZF File history
n | `<Leader>fl` | FZF Lines
n | `<Leader>fm` | FZF Maps
n | `<Leader>fs` | FZF Ag
n | `<Leader>ft` | FZF Tags
n | `<Leader>fw` | FZF Ag word under cursor
n | `<leader>n` | NERDTreeToggle (this is lazy loaded)
n | `<leader>gd` | Fugitive Gdiff
n | `<leader>ge` | Fugitive Gedit
n | `<leader>gl` | Fugitive Git log
n | `<leader>gs` | Fugitive Gstatus
n | `<leader>gh` | Fugitive Gsplit
n | `<leader>gv` | Fugitive Gvsplit
a | `q` | quit for help windows
i | `<tab>` | deoplete next item
i | `<S-tab>` | deoplete previous item
i | `<tab>` | UltiSnips expand snippet or jump
i | `<S-tab>` | UltiSnips jump backward


Plus all default mappings for loaded modules. Here are some examples:

Mode | Key | Function
---- | --- | --------
n, v | `<Leader><Leader>w` | easymotion word motion
n, v | `<Leader><Leader>j` | easymotion line down motion
n, v | `<Leader><Leader>k` | easymotion line up motion
n, v | `<Leader><Leader>b` | easymotion word backward motion
n | `cs` | change surrounding
n | `ds` | delete surrounding
n | `ys` | insert surrounding
n | `gc{motion}` | Commentary toggle comment on a move
n | `gcc` | Commentary toggle line comment
n | `[c` | Gitgutter prev hunk
n | `]c` | Gitgutter next hunk
n | `<leader>hs` | Gitgutter stage hunk
n | `<leader>hu` | Gitgutter undo hunk
o | `{action}ic` | Gitgutter inner hunk
o | `{action}ic` | Gitgutter outer hunk
i | `<M-n>` | Auto-pairs jump to next closed pairs
i | `<M-b>` | Auto-pairs toggle


# Development
## Todo
* General Vim configuration - Used nvim defaults and my old configs - done
* Easymotion - done
* Good status bar - Using airline - done
* Surround - done
* Project fuzzy find - Using FZF - done
* Commenting - Using Commentary - done
* Directory tree - Using NERDTree (Avoided NERDTreeTabs as it was not lazy loaded) - done
* Git support - Using Fugitive - done
* Syntax checking and Lint - Using Neomake - done
* Git changes in gutter - Using git-gitter - done
* Brackets auto closing - Using auto-pairs - done
* Help in new tab - Using cabbrev - done
* Autocompletion - Using deoplete - partly done
* Snippets - Using UltiSnips - done
* jk jump to normal mode - done
* Persistent undo - done
* Indentation guide - done
* Bracket highlighting - Already in nvim - done
* Smart Indentation - Already in nvim - done
* Spell-checking - Already in nvim - done
* Autosave - Already in nvim - done
* lazy loading
* Mnemonic shortcuts
* Tags
* Jump to test file
* Beautify
* Multi-cursor (sublime like behavior)
* Available keys (Maybe)
* Move line up and down (sublime like)
* Block select (per language type)
* Languages to support
  * Python
  * Ruby
  * HTML
  * HAML
  * CSS
  * SASS
  * Javascript
  * Coffescript
  * Markdown
  * YAML
