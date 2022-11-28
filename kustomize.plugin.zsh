# Command Completino
if (( $+commands[kustomize] )); then
  # If the completion file does not exist, generate it and then source it
  if is-at-least 3.8.6 $(kustomize version | awk 'match($0, /v([0-9.]+)\s/, m) { print m[1]; }'); then
  # Otherwise, source it and regenerate in the background
  if [[ ! -f "$ZSH_CACHE_DIR/completions/_kustomize" ]]; then
    kustomize completion zsh | tee "$ZSH_CACHE_DIR/completions/_kustomize" >/dev/null
    source "$ZSH_CACHE_DIR/completions/_kustomize"
  else
    source "$ZSH_CACHE_DIR/completions/_kustomize"
    kustomize completion zsh | tee "$ZSH_CACHE_DIR/completions/_kustomize" >/dev/null &|
  fi
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
  # Kustomize build and pipe to kubectl apply server side with force-conflicts
  function kzbasf() { kustomize build "$@" | kubectl apply -f - --server-side --force-conflicts; }
fi

# Create a new kustomization
alias kzc='kustomize create'
# Create a new kustomization and autodetect manifests in current folder
alias kzca='kustomize create --autodetect'
# Create a new kustomization and autodetect manifests current and all sub folders
alias kzcar='kustomize create --autodetect --recursive'
# Edit
alias kze='kustomize edit'

