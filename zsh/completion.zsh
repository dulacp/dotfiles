# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Kubernetes
source <(kubectl completion zsh)

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"
