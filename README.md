### What is this repo about
This is a set of dotfiles, which are extenging the possibilities of NVchad for developing cpp applications with CMake. Also the clang format is included, although you will have to install clang-format by yourself, .clang-format can be found in `lua/configs/`
### What was added
Clandg was adden as an lsp for cpp and NeoCmakeLsp for camke files respectively

nvim-dap was set up in a pair with codelldb

nvim-dap-ui was configured with all of dependecies such as nvim-nio and nvim-virtual text
### How to install
```bash
git clone https://github.com/NvChad/starter ~/.config/nvim
git clone https://github.com/sat0sh1c/nvim-cpp/
rsync -a --update nvim-cpp/ ~/.config/nvim
nvim
```
After the start lazy will install all the dependencies automatically. Btw, all the keybindings are stored in `lua/mappings.lua` file. 
### Rest of keybindigs
This is just an extention of Nvchad, as mentioned before, so please refer to check [it's wiki](https://nvchad.com/) if any questions arise
