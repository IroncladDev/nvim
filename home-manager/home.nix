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
            yazi
            openssl
            git
            btop
            opencode
            unzip
            neovim
            luaPackages.tree-sitter-cli
            lua
            stylua
            lua-language-server
            typescript-language-server
            vscode-langservers-extracted
            lsof
            fish
        ]
        # Linux-only
        ++ lib.optionals pkgs.stdenv.isLinux [
            kanata-with-cmd
            wiremix
            impala
            bluetui
            cloudflared
            signal-desktop
            nodejs_26
            dunst
            libnotify
            playerctl
            brightnessctl
            nerd-fonts.jetbrains-mono
            grimblast
            wl-screenrec
            slurp
            mpv
            rose-pine-hyprcursor
            awww
            nixfmt
        ]
        # macOS-only
        ++ lib.optionals pkgs.stdenv.isDarwin [
            docker
            docker-compose
            mprocs
            glab
            natscli
            nest-cli
            cloudmonkey
            openssh
            postgresql
        ];

    fonts.fontconfig = lib.mkIf pkgs.stdenv.isLinux {
        enable = true;
        defaultFonts = {
            monospace = [
                "JetBrainsMono Nerd Font Mono"
                "JetBrainsMono NFM"
            ];
        };
    };

    programs.fish = {
        enable = true;
        shellAliases = {
            y = "yazi";
        };
        functions = {
            sync-dotfiles = ''
                echo "--> Syncing dotfiles"
                cd ~/.config
                jj f
                jj new master
                home-manager switch
                echo "--> Reloading shell"
                exec fish
            '';
            killport = ''
                if test -z "$argv[1]"
                  echo "Usage: killport <port>"
                  return 1
                end
                set -l pids (lsof -t -i:"$argv[1]" 2>/dev/null)
                if test -z "$pids"
                  echo "No process found on port $argv[1]"
                  return 1
                end
                echo "Killing process(es) on port $argv[1] → $pids"
                kill -9 $pids
            '';
        };
        plugins = lib.mkIf pkgs.stdenv.isDarwin [
            {
                name = "nvm";
                src = pkgs.fishPlugins.nvm.src;
            }
        ];
    };

    programs.zoxide = {
        enable = true;
        options = [
            "--cmd"
            "cd"
        ];
    };
    programs.keychain = {
        enable = true;
        keys = [ "id_ed25519" ];
        extraFlags = [ "--quiet" ];
    };
    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    systemd.user.services.kanata = lib.mkIf pkgs.stdenv.isLinux {
        Unit.Description = "Kanata keyboard remapper";
        Service = {
            ExecStart = "${pkgs.kanata}/bin/kanata --cfg %h/.config/kanata/kanata.kbd --no-wait";
            Restart = "on-failure";
        };
        Install.WantedBy = [ "default.target" ];
    };

    systemd.user.services.dunst = lib.mkIf pkgs.stdenv.isLinux {
        Unit = {
            Description = "Dunst notification daemon";
            After = [ "graphical-session.target" ];
            PartOf = [ "graphical-session.target" ];
        };
        Service = {
            Type = "dbus";
            BusName = "org.freedesktop.Notifications";
            ExecStart = "${pkgs.dunst}/bin/dunst";
            ExecReload = "${pkgs.dunst}/bin/dunstctl reload";
            Restart = "on-failure";
        };
        Install.WantedBy = [ "graphical-session.target" ];
    };

    systemd.user.services.battery-notify = lib.mkIf pkgs.stdenv.isLinux {
        Unit = {
            Description = "Notify current battery percentage";
            After = [ "graphical-session.target" ];
            PartOf = [ "graphical-session.target" ];
        };
        Service = {
            Type = "oneshot";
            ExecStart = "%h/.config/scripts/battery";
        };
    };

    systemd.user.timers.battery-notify = lib.mkIf pkgs.stdenv.isLinux {
        Unit.Description = "Battery percentage notification every 10 minutes";
        Timer = {
            OnBootSec = "1min";
            OnUnitActiveSec = "10min";
            Persistent = true;
            Unit = "battery-notify.service";
        };
        Install.WantedBy = [ "timers.target" ];
    };

    services.hypridle.enable = lib.mkIf pkgs.stdenv.isLinux true;
    programs.hyprlock.enable = lib.mkIf pkgs.stdenv.isLinux true;

    programs.home-manager.enable = true;
}
