# Command Completino
if (( $+commands[kustomize] )); then
  # If the completion file does not exist, generate it and then source it
  # Otherwise, source it and regenerate in the background
  if [[ ! -f "$ZSH_CACHE_DIR/completions/_kustomize" ]]; then
    kustomize completion zsh | tee "$ZSH_CACHE_DIR/completions/_kustomize" >/dev/null
    source "$ZSH_CACHE_DIR/completions/_kustomize"
  else
    source "$ZSH_CACHE_DIR/completions/_kustomize"
    kustomize completion zsh | tee "$ZSH_CACHE_DIR/completions/_kustomize" >/dev/null &|
  fi
fi


# This command is used a LOT both below and in daily life
alias kz=kustomize

# Build
alias kzb='kustomize build'

# Only run if the user actually has kustomize installed
if (( ${+_comps[kustomize]} )); then
  # Build and pipe output to YQ for colors
  function kzby() { kustomize build "$@" | yh; }
  # Kustomize build and pipe to kubectl apply
  function kzba() { kustomize build "$@" | kubectl apply -f -; }
  # Kustomize build and pipe to kubectl apply server side
  function kzbas() { kustomize build "$@" | kubectl apply -f - --server-side; }
fi

# Create a new kustomization
alias kzc='kustomize create'
# Create a new kustomization and autodetect manifests in current folder
alias kzca='kustomize create --autodetect'
# Create a new kustomization and autodetect manifests current and all sub folders
alias kzcar='kustomize create --autodetect --recursive'
# Edit
alias kze='kustomize edit'

