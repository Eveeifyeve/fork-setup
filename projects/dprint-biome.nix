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
    deno.enable = true;
    npm.enable = true;
    rust = {
      enable = true;
      channel = "stable";
      components = [
        "clippy"
        "cargo"
        "rust-analyzer"
        "rustc"
        "rustfmt"
      ];
      targets = [
        "wasm32-unknown-unknown"
      ];
    };
  };
}
