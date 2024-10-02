{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
	};
	outputs =
		inputs@{ flake-parts, nixpkgs, ... }:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = nixpkgs.lib.systems.flakeExposed;
			perSystem =
			{
				config,
				self',
				inputs',
				lib,
				pkgs,
				system,
				...
			}:
			{
				formatter = pkgs.nixfmt-rfc-style;
				devShells = {
					tauri-docs = pkgs.mkShell {
						packages = with pkgs; [
							nodejs
							pnpm
						];
					};
					# Feel free to add more devshells here.
				};
			};
		};
}
