if status is-interactive
    # Commands to run in interactive sessions can go here

    export EDITOR="nvim"
    export LANG=en_US.UTF-8

    alias ls='ls --color=auto -F --hyperlink=auto'
    alias ll='ls -lisah'
    alias l='ls -lish'
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

    fish_add_path $HOME/bin
    for path in $HOME/usr/opt/*/bin
        fish_add_path $path
    end
end
