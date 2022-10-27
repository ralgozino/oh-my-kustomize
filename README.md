# Kustomize Oh My ZSH Plugin

This [Oh My ZSH](https://ohmyz.sh/) plugin adds completion for [Kustomize, the Kubernetes native configuration management tool](https://kustomize.io/), as well as some useful aliases for common commands.

To use this plugin:

1. Install the plugin:

```bash
git clone https://github.com/ralgozino/oh-my-kustomize ~/.oh-my-zsh/plugins/kustomize
```

2. Add `kustomize` to the plugins array in your `.zshrc` file:

```zsh
plugins=(... kustomize)
```

3. Open a new shell or source your `.zshrc` file.

## Aliases

| Alias   | Command                                                      | Description                                                                                   |
| :------ | :----------------------------------------------------------- | :-------------------------------------------------------------------------------------------- |
| `kz`    | `kustomize`                                                  | Runs kustomize, you can pass the subcomands you want, i.e. `kz build`                         |
| `kzb`   | `kustomize build`                                            | Runs kustoimze build, you can pass more flags and argunments to the command, like the folder. |
| `kzby`  | `kustomize build <args> \| yh`                               | Will run kustomize build and pipe the output to `yh` for YAML formatting.                     |
| `kzba`  | `kustomize build <args> \| kubectl apply -f -`               | Will run kustomize build and pipe the output to `kubectl apply`.                              |
| `kzbas` | `kustomize build <args> \| kubectl apply -f - --server-side` | Will run kustomize build and pipe the output to `kubectl apply --server-side`.                |
| `kzc`   | `kustomize create`                                           | Runs `kustomize create`                                                                       |
| `kzca`  | `kustomize create`                                           | Runs `kustomize create --autodetect`                                                          |
| `kzcar` | `kustomize create`                                           | Runs `kustomize create --autodetect --recursive`                                              |
| `keti`  | `kubectl exec -ti`                                           | Drop into an interactive terminal on a container                                              |
| `kze`   | `kustomize edit`                                             | Runs `kustomize edit`                                                                         |

## Honorable mention

This plugin is heavily based on the [official oh-my-zsh `kubectl` plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl).
