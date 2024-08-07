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
    deno.enable = true;
    javascript = {
      enable = true;
      npm.enable = true;
    };
    rust = {
      enable = true;
      channel = "stable";
      components = [
        "rustc"
        "cargo"
        "clippy"
        "rustfmt"
        "rust-analyzer"
      ];
      targets = [
        "wasm32-unknown-unknown"
      ];
    };
  };
}
