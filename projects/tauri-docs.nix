{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  pkgs.mkShell {
    packages = [
      pnpm
      typescript
      nodePackages.typescript-language-server
      nodePackages.pnpm.override {
        node = nodejs-slim
      }
    ];
  };
}
