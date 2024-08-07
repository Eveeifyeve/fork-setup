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
    javascript = {
      enable = true;
      deno.enable = true;
    };
    typescript.enable = true;
    rust = {
      enable = true;
      channel = "stable";
      components = [
        "clippy"
        "rustfmt"
      ];
      targets = [
        "wasm32-unknown-unknown"
      ];
    };
  };
}
