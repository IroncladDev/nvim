{
    config,
    pkgs,
    lib,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home = {
        username = "ironcladdev";
        homeDirectory = "/${if pkgs.stdenv.isLinux then "home" else "Users"}/${config.home.username}";
    };

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "26.05"; # Please read the comment before changing.

    home.packages =
        with pkgs;
        # Shared
        [
            ripgrep
            magic-wormhole
            jujutsu
            fastfetch
            zoxide
            yazi
            openssh
            lua
            bun
            keychain
            neovim
            git
        ]
        # Linux-only
        ++ lib.optionals pkgs.stdenv.isLinux [
            kanata-with-cmd
            wiremix
            impala
            bluetui
            slack
        ]
        # macOS-only
        ++ lib.optionals pkgs.stdenv.isDarwin [
            wireguard-tools
            wireguard-go
        ];

    launchd.agents.wireguard = {
        enable = true;
        config = {
            ProgramArguments = [
                "${pkgs.wireguard-tools}/bin/wg-quick"
                "up"
                "${config.home.homeDirectory}/.config/wireguard/wg0.conf"
            ];
            RunAtLoad = true;
            KeepAlive = false; # set to true if you want it always on
        };
    };

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
