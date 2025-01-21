{ inputs, vars, pkgs, ... }:

{
  imports = [
    ../programs/tui
    ../programs/gui
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nixpkgs.overlays = [
    inputs.nur.overlay
    inputs.nix-vscode-extensions.overlays.default
  ];

  # User packages. IE not system packages
  home = {
    username = "${vars.user.name}";
    homeDirectory = "/home/${vars.user.name}";
    packages = with pkgs; [
      # chromium
      # dmenu
      # ncdu
      obsidian
      ollama
      # ripgrep
      # vlc
      vscode
      # hugo
      # texstudio
      # godot_4
      go
      # duckdb

      # fonts
<<<<<<< Updated upstream
      nerd-fonts.jetbrains-mono
      jetbrains-mono
=======
      # nerd-fonts.jetbrains-mono
      # jetbrains-mono

      # inputs.claude-desktop.packages.${system}.claude-desktop
>>>>>>> Stashed changes
    ] ++ (if pkgs.stdenv.hostPlatform.system != "aarch64-linux" then [
      # ARM does not support every package, so only install these if we're not on an ARM basd architecture
      bitwarden
      # discord
      # slack
      # spotify
    ] else []);
  };

  programs.home-manager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
