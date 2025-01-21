{ lib, ... }:
rec {
  user = {
    name = "sonny";
    fullName = "Sonny Cano";
    email = "spcano01@gmail.com";
    packages = {
      terminal = "wezterm";
      editor = "nano";
      shell = "zsh"; 
    };
  };

  paths = {
    dotfiles = "$HOME/.dotfiles";
    configHome = "$HOME/.config";
    dataHome = "$HOME/.local/share";
    cacheHome = "$HOME/.cache";
  };

  system = {
    timeZone = "America/Chicago";
    locale = "en_US.UTF-8";
    stateVersion = "24.05";
  };
  
  networking = {
    domain = "local";
  };
}
