{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.cli.nvf;
in {
  options.features.cli.nvf.enable = mkEnableOption "enable nvf";

  config = mkIf cfg.enable {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme = {
            enable = true;
            name = "catppuccin-mocha";
            style = "dark";
          };
          enableLuaLoader = true;
          statusline.lualine = {
            enable = true;
            icons.enable = true;
          };
          telescope.enable = true;
          treesitter = {
            enable = true;
            addDefaultGrammars = true;
            indent.enable = true;
          };
          visuals = {
            fidget-nvim.enable = true;
            nvim-web-devicons.enable = true;
            tiny-devicons-auto-colors.enable = true;
          };
          autocomplete.nvim-cmp.enable = true;
          lazy.enable = true;
          lsp = {
            enable = true;
            formatOnSave = true;
          };
          mini = {
            ai.enable = true;
            comment.enable = true;
            surround.enable = true;
          };
          notes.obsidian.enable = true;
          languages = {
            enableLSP = true;
            enableTreesitter = true;
            bash = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
            lua = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
            nix = {
              enable = true;
              extraDiagnostics = {
                enable = true;
                types = ["statix" "deadnix"];
              };
              format.enable = true;
              lsp.enable = true;
              lsp.server = "nixd";
              treesitter.enable = true;
            };
            markdown = {
              enable = true;
              extensions.render-markdown-nvim.enable = true;
              format.enable = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
          };
        };
      };
    };
  };
}
