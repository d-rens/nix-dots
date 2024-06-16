# nixvim
Much of the config if from [redyf/Neve](https://github.com/redyf/Neve/).

## todo:
- [ ] snippets either with ultisnips or luasnip
- [ ] harpoon
- [ ] img-clip
- [ ] orgmode? or just emacs
- [ ] zen

## hotkeys
### extra nixvim
#### tabs
| hotkey                | function              |
| -------------         | --------------------- |
|`<leader><tab>f`       | go to firt tab        |
|`<leader><tab><tab>`   | make new tab          |
|`<leader><tab>`        | next tab              |
|`<leader><tab>d`       | close tab             |
|`<leader><tab>[`       | previous tab          |

#### windows
| hotkey                | alternative keys      | function              |
| -------------         | --------------------- | --------------------- |
|`<leader>ww`           | `<C-w>w`/`<C-W>p`     | go through windows    |
|`<leader>wd`           | `<C-w>c`              | close window          |
|`<leader>w-`           | `<C-W>s`              | split window below    |
|`<leader>w|`           | `<C-W>v`              | split window right    |


#### misc
| hotkey                | function              |
| -------------         | --------------------- |
|`<C-s>`                | save file             |
|`<leader>qq`           | quit all              |
|`arrows`               | nothing, disables it  |

Many other QoL improvements.


### lsp
| hotkey                | function              |
| -------               | --------              |
|`C-j`                  |select next item       |
|`C-k`                  |select previous item   |
|`C-e`                  |abort                  |
|`C-b`                  |scroll -4              |
|`C-f`                  |scroll 4               |
|`C-Space`              |complete               |
|`CR`                   |confirm                |
|`Shift-CR`             |confirm/replace        |

### git
| hotkey                | function              |
| -------------         | --------------------- |
|`<leader>gh`           |gitsigns               |
|`<leader>`ghb          |blame line             |
|`<leader>`ghd          |diffthis               |
|`<leader>`ghp          |preview hunk           |
|`<leader>`ghR          |reset buffer           |
|`<leader>`ghr          |reset hunk             |
|`<leader>`ghs          |stage hunk             |
|`<leader>`ghS          |stage buffer           |
|`<leader>`ghu          |undo stage hunk        |


### telescope
| hotkey         | action                      | description                  |
| -------------- | --------------------------- | ---------------------------- |
| `<leader><space>` | `find_files`               | find project files           |
| `<leader>/`      | `live_grep`                | grep (root dir)              |
| `<leader>:`      | `command_history`          | command history              |
| `<leader>b`      | `buffers`                  | +buffer                      |
| `<leader>ff`     | `find_files`               | find project files           |
| `<leader>fr`     | `oldfiles`                 | recent                       |
| `<leader>fb`     | `buffers`                  | buffers                      |
| `<c-p>`          | `git_files`                | search git files             |
| `<leader>gc`     | `git_commits`              | commits                      |
| `<leader>gs`     | `git_status`               | status                       |
| `<leader>sa`     | `autocommands`             | auto commands                |
| `<leader>sb`     | `current_buffer_fuzzy_find`| buffer                       |
| `<leader>sc`     | `command_history`          | command history              |
| `<leader>sc`     | `commands`                 | commands                     |
| `<leader>sd`     | `diagnostics`              | workspace diagnostics        |
| `<leader>sh`     | `help_tags`                | help pages                   |
| `<leader>sh`     | `highlights`               | search highlight groups      |
| `<leader>sk`     | `keymaps`                  | keymaps                      |
| `<leader>sm`     | `man_pages`                | man pages                    |
| `<leader>sm`     | `marks`                    | jump to mark                 |
| `<leader>so`     | `vim_options`              | options                      |
| `<leader>sr`     | `resume`                   | resume                       |
| `<leader>uc`     | `colorscheme`              | colorscheme preview          |
| `<leader>fp`     | `<cmd>telescope projects<cr>` | projects                  |
| `<leader>sd`     | `<cmd>telescope diagnostics bufnr=0<cr>` | document diagnostics  |
| `<leader>st`     | `<cmd>todotelescope<cr>`   | todo (telescope)             |
| `<leader>fp`   | `<cmd>telescope projects<cr>` | projects              |
| `<leader>sd`   | `<cmd>telescope diagnostics bufnr=0<cr>` | document diagnostics |
| `<leader>st`   | `<cmd>todotelescope<cr>`    | todo (telescope)      |

### oil
| hotkey                | function              |
| --------------------- | --------------------- |
| `<leader>o`           | open floating oil     |
| `g?`                  | open help within oil  |
