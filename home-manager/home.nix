{ config, pkgs, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "ironcladdev";
    home.homeDirectory = "/home/ironcladdev";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "26.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = with pkgs; [
        ###### Applications ######
        #kitty
        #brave

        ###### Processes/Programs ######
        kanata-with-cmd

        ###### CLI Tools ######
        ripgrep
        magic-wormhole
        jujutsu
        zoxide

        ###### TUIs ######
        yazi
        wiremix
        impala
        bluetui

        ###### Misc ######
        nerd-fonts.jetbrains-mono
        openssh

        ###### Languages ######
        lua
        bun
    ];

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
