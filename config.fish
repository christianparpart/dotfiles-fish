if status is-interactive
    # Commands to run in interactive sessions can go here

    export EDITOR="nvim"
    export LANG=en_US.UTF-8
    export GNUTERM="sixel"

    #alias ls='ls --color=auto -F --hyperlink=auto'
    alias ls='exa -F'
    alias l='exa -lh'
    alias ll='exa -lah'
    alias po='ps -o pid,tty,comm,wchan:21,cmd'
    alias ccat='pygmentize -g'
    alias bat='bat --italic-text=always'

    alias isvg='rsvg-convert | img2sixel'

    # TODO WTF
    # set os (uname)
    # if "$os" == "Linux"
    #     alias pbcopy='xsel --clipboard --input'
    #     alias pbpaste='xsel --clipboard --output'
    # end

    # {{{ C++ development
    alias pt='valgrind --tool=callgrind --dump-instr=yes --collect-jumps=yes --branch-sim=yes --cache-sim=yes'
    alias vg='valgrind --num-callers=32 --vgdb=full'
    if test -d "$HOME/usr/lib/pkgconfig"
        export PKG_CONFIG_PATH="$HOME/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
    end
    alias n='ninja'
    alias nn='nice ninja -j20'
    alias j='make -j25'
    alias jj='nice make -j25'
    # }}}

    fish_add_path --prepend --move $HOME/go/bin
    fish_add_path --prepend --move $HOME/.cargo/bin
    fish_add_path --prepend --move $HOME/.fzf/bin
    fish_add_path --prepend --move $HOME/.local/bin
    for path in $HOME/usr/opt/*/bin
        fish_add_path --prepend --move $path
    end
    fish_add_path --prepend --move $HOME/bin

    gpgconf --launch gpg-agent

    set fish_greeting $(echo "$(hostname) says, have fun!$(echo)$(uptime)" | lolcat -b -f)
    set fish_greeting ""
    printf "$(uptime)\n ~> $(hostname) says, have fun!\n" | lolcat -b -f

    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source

    direnv hook fish | source
end
