source ~/.aliases

export EDITOR='vim'

#
# Add bash_autocompletion for brew
#
if type brew &>/dev/null && [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#
# If rbenv is installed, enable shims and autocompletion
#
if type rbenv &>/dev/null; then
  eval "$(rbenv init -)"
fi

# PostgreSQL
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

#
# Load __git_ps1 function to add current branch to the PS1
# This may exist in different places depending on the version
# of Git installed and the method of which it was installed,
# so fallback to each one in turn.
#
if [ -f /usr/share/git-core/git-prompt.sh ]; then
  source /usr/share/git-core/git-prompt.sh
elif [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
elif [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

if type __git_ps1 &>/dev/null; then
  export PS1='\h:\W$(__git_ps1 " (%s)")\$ '
else
  export PS1='\h:\W\$ '
fi
