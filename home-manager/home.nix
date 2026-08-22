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
        enableNixpkgsReleaseCheck = false;
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
            openssl
            lua
            bun
            keychain
            neovim
            git
            btop
            luaPackages.tree-sitter-cli
            docker
            docker-compose
            mprocs
            opencode
            zoxide
        ]
        # Linux-only
        ++ lib.optionals pkgs.stdenv.isLinux [
            kanata-with-cmd
            wiremix
            impala
            bluetui
            cloudflared
            signal-desktop
            spotify
            nodejs_26
        ]
        # macOS-only
        ++ lib.optionals pkgs.stdenv.isDarwin [
            glab
            natscli
            nest-cli
            cloudmonkey
            openssh
            postgresql
        ];

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    systemd.user.services.kanata = {
        Unit.Description = "Kanata keyboard remapper";
        Service = {
            ExecStart = "${pkgs.kanata}/bin/kanata --cfg %h/.config/kanata/kanata.kbd --no-wait";
            Restart = "on-failure";
        };
        Install.WantedBy = [ "default.target" ];
    };

    programs.home-manager.enable = true;
}
