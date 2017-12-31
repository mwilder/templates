# Set aliases
alias ll 'ls -al'
alias ltr 'ls -ltr'
alias m 'more'
alias h 'history'
alias less 'less -i'
alias cgrep 'grep --color=always'
alias te 'open -a //Applications/TextMate.app \!* '
alias amacs 'open -a /Applications/Aquamacs.app/ \!* &'
alias gvim 'open -a /Applications/MacVim.app/Contents/MacOS/MacVim \!* &'

# Set path
set path = ($path . ~/scripts ~/Applications/local/bin)

# Man path; replace the default (/etc/manpaths or /private/etc/manpaths)
setenv MANPATH "/usr/share/man:/Applications/CMake 2.8-12.app/Contents/man:~/Applications/local/share/man"

# pkg-config path (should I add "/usr/local/lib/pkgconfig/" as well?)
setenv PKG_CONFIG_PATH /usr/local/lib/pkgconfig
 
# Set prompt
if ($?prompt) then
  set promptchars = "%#"
  if ($?tcsh) then
    set prompt = "%n@%m> "
  else
    set prompt = "`id -nu`@%m> "
  endif
endif

# MacPorts Installer addition on 2015-02-03_at_23:03:33: adding an appropriate PATH variable for use with MacPorts.
setenv PATH "/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 3.5
# The orginal version is saved in .cshrc.pysave
set path=(/Library/Frameworks/Python.framework/Versions/3.5/bin $path)
