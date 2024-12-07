{ pkgs, ... }:
{
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft = {
        csharp = [ "csharpier" ];
      };

      formatters = {
        csharpier = {
          command = "${pkgs.csharpier}/bin/dotnet-csharpier";
        };
      };
    };

    lsp.servers = {
      omnisharp = {
        enable = true;

        extraOptions = {
          init_options = {
            usePlaceholders = true;
            completeUnimported = true;
          };
        };
      };
    };

    dap = {
      adapters.executables.lldb.command = "${pkgs.lldb}/bin/lldb-vscode";

      configurations.csharp = [
        {
          name = "C# Debug";
          type = "lldb";
          request = "launch";
          cwd = "\${workspaceFolder}";
          program.__raw = ''
            function()
              return vim.fn.input('Executable path: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
        }
      ];
    };
  };
}
