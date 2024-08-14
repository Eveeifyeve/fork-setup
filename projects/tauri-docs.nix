{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  dotenv.enable = false;
  packages =
    with pkgs;
    [ ]
    ++ (with pkgs.nodePackages; [
      vscode-langservers-extracted
      typescript-language-server
    ]);
  languages = {
    typescript.enable = true;
    javascript = {
      enable = true;
      pnpm = {
        enable = true;
        install.enable = true;
      };
    };
  };
}
