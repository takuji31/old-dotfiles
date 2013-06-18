set PATH $HOME/project/bin $HOME/local/bin $HOME/bin /Applications/MacVim.app/Contents/MacOS /usr/local/sbin /opt/local/bin /usr/local/bin $PATH

if set ruby_home (which brew; and brew --prefix ruby)
    set PATH  "$ruby_home/bin" $PATH
end
