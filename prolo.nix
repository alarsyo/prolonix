# based on
# <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-base.nix>

{ system ? "x86_64-linux", ... }:

let
  isoconfig = { lib, pkgs, ... }: {

    imports = [
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-base.nix>
    ];

    networking.hostName = "prolonix";
    users.extraUsers.root.password = "prologin";

    services.xserver.enable = true;

    # Provide networkmanager for easy wireless configuration.
    networking.networkmanager.enable = true;
    networking.wireless.enable = false;

    # KDE complains if power management is disabled (to be precise, if
    # there is no power management backend such as upower).
    powerManagement.enable = true;

    # Enable sound in graphical iso's.
    hardware.pulseaudio.enable = true;

    environment.systemPackages = with pkgs; [
      vim

      firefox

      glxinfo
    ];

    services.xserver = {
      desktopManager.plasma5 = {
        enable = true;
      };

      # Automatically login as nixos.
      displayManager.sddm = {
        enable = true;
        autoLogin = {
          enable = true;
          user = "nixos";
        };
      };
    };
  };
  
  evalNixos = configuration: import <nixpkgs/nixos> {
    inherit configuration;
  };

in { iso = (evalNixos isoconfig).config.system.build.isoImage; }
