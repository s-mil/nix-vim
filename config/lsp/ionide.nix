{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [
    Ionide-vim
    vim-tabby
  ];
}
