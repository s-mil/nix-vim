{
  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./git.nix
    ./lightline.nix
    ./lsp/default.nix
    ./lsp/fidget.nix
    ./lsp/ionide.nix
    ./lsp/none-ls.nix
    ./lsp/trouble.nix
    ./neo-tree.nix
    ./options.nix
    ./treesitter.nix
    ./utils/auto-pairs.nix
    ./utils/autosave.nix
    ./utils/blankline.nix
    ./utils/icons.nix
    ./utils/telescope.nix
    ./utils/harpoon.nix
    ./utils/toggleterm.nix
    ./utils/which-key.nix
    ./utils/wilder.nix
  ];

  colorschemes.catppuccin.enable = true;

  extraConfigVim = ''
    autocmd BufRead,BufNewFile *.pl set filetype=prolog
  '';

  globals.mapleader = " ";
  keymaps = [
    # Global
    # Default mode is "" which means normal-visual-op
    {
      key = "<C-n>";
      action = "<CMD>NvimTreeToggle<CR>";
      options.desc = "Toggle NvimTree";
    }
    {
      key = "<leader>c";
      action = "+context";
    }
    {
      key = "<leader>co";
      action = "<CMD>TSContextToggle<CR>";
      options.desc = "Toggle Treesitter context";
    }
    # File
    {
      mode = "n";
      key = "<leader>f";
      action = "+find/file";
    }
    {
      # Format file
      key = "<leader>fm";
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
      options.desc = "Format the current buffer";
    }

    # Git    
    {
      mode = "n";
      key = "<leader>g";
      action = "+git";
    }
    {
      mode = "n";
      key = "<leader>gt";
      action = "+toggles";
    }
    {
      key = "<leader>gtb";
      action = "<CMD>Gitsigns toggle_current_line_blame<CR>";
      options.desc = "Gitsigns current line blame";
    }
    {
      key = "<leader>gtd";
      action = "<CMD>Gitsigns toggle_deleted";
      options.desc = "Gitsigns deleted";
    }
    {
      key = "<leader>gd";
      action = "<CMD>Gitsigns diffthis<CR>";
      options.desc = "Gitsigns diff this buffer";
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "+resets";
    }
    {
      key = "<leader>grh";
      action = "<CMD>Gitsigns reset_hunk<CR>";
      options.desc = "Gitsigns reset hunk";
    }
    {
      key = "<leader>grb";
      action = "<CMD>Gitsigns reset_buffer<CR>";
      options.desc = "Gitsigns reset current buffer";
    }

    # Tabs
    {
      mode = "n";
      key = "<leader>t";
      action = "+tab";
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = "<CMD>tabnew<CR>";
      options.desc = "Create new tab";
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<CMD>tabclose<CR>";
      options.desc = "Close tab";
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<CMD>tabnext<CR>";
      options.desc = "Go to the sub-sequent tab";
    }
    {
      mode = "n";
      key = "<leader>tp";
      action = "<CMD>tabprevious<CR>";
      options.desc = "Go to the previous tab";
    }

    # Terminal
    {
      # Escape terminal mode using ESC
      mode = "t";
      key = "<esc>";
      action = "<C-\\><C-n>";
      options.desc = "Escape terminal mode";
    }

    # Trouble 
    {
      mode = "n";
      key = "<leader>d";
      action = "+diagnostics/debug";
    }
    {
      key = "<leader>dt";
      action = "<CMD>TroubleToggle<CR>";
      options.desc = "Toggle trouble";
    }

    # Rust
    {
      mode = "n";
      key = "<leader>r";
      action = "+rust";
    }
    {
      # Start standalone rust-analyzer (fixes issues when opening files from nvim tree)
      mode = "n";
      key = "<leader>rs";
      action = "<CMD>RustStartStandaloneServerForBuffer<CR>";
      options.desc = "Start standalone rust-analyzer";
    }
  ];
}
