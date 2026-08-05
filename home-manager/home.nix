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
            openssl
            lua
            bun
            keychain
            neovim
            git
            btop
            luaPackages.tree-sitter-cli
            gh
            kubectl
            pgcli
        ]
        # Linux-only
        ++ lib.optionals pkgs.stdenv.isLinux [
            kanata-with-cmd
            wiremix
            impala
            bluetui
        ]
        # macOS-only
        ++ lib.optionals pkgs.stdenv.isDarwin [
            glab
            natscli
            nest-cli
            cloudmonkey
            postgresql
            colima
            docker
            docker-compose
        ];

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    launchd.agents.colima = {
        enable = true;
        config = {
            Label = "com.user.colima";
            ProgramArguments = [
                "${pkgs.colima}/bin/colima"
                "start"
            ];
            RunAtLoad = true;
            KeepAlive = false;
            StandardOutPath = "${config.home.homeDirectory}/Library/Logs/colima.log";
            StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/colima.err.log";
        };
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
