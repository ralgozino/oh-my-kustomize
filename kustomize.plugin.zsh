if (( ! $+commands[kustomize] )); then
  return
fi

# Command Completion
# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `kustomize`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_kustomize" ]]; then
  typeset -g -A _comps
  autoload -Uz _kustomize
  _comps[kustomize]=_kustomize
fi

# Regenerate the completion in the background only when the binary is newer
# than the cached file (e.g. after an upgrade).
if [[ ! -f "$ZSH_CACHE_DIR/completions/_kustomize" || $commands[kustomize] -nt "$ZSH_CACHE_DIR/completions/_kustomize" ]]; then
  kustomize completion zsh 2>/dev/null >| "$ZSH_CACHE_DIR/completions/_kustomize" &|
fi


# This command is used a LOT both below and in daily life
alias kz=kustomize

# Build
alias kzb='kustomize build'

# Create a new kustomization
alias kzc='kustomize create'

# Create a new kustomization and autodetect manifests in current folder
alias kzca='kustomize create --autodetect'

# Create a new kustomization and autodetect manifests current and all sub folders
alias kzcar='kustomize create --autodetect --recursive'

# Edit
alias kze='kustomize edit'

# Print version
alias kzv='kustomize version'

# Build and pipe output to yq for colors
function kzby() { kustomize build "$@" | yq -P -C; }
# Kustomize build and pipe to kubectl apply
function kzba() { kustomize build "$@" | kubectl apply -f -; }
# Kustomize build and pipe to kubectl apply server side
function kzbas() { kustomize build "$@" | kubectl apply -f - --server-side; }
# Kustomize build and pipe to kubectl apply server side with force-conflicts
function kzbasf() { kustomize build "$@" | kubectl apply -f - --server-side --force-conflicts; }
# Kustomize build and pipe to kubectl delete
function kzbdel() { kustomize build "$@" | kubectl delete -f -; }
