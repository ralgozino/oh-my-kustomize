# Kustomize Oh My ZSH Plugin

This [Oh My ZSH](https://ohmyz.sh/) plugin adds completion for [Kustomize, the Kubernetes native configuration management tool](https://kustomize.io/), as well as some useful aliases for common commands.

To use this plugin:

1. Install the plugin:

```bash
git clone https://github.com/ralgozino/oh-my-kustomize ~/.oh-my-zsh/plugins/kustomize
```

or in your custom plugins folder:

```bash
git clone https://github.com/ralgozino/oh-my-kustomize ~/.oh-my-zsh/custom/plugins/kustomize
```

2. Add `kustomize` to the plugins array in your `.zshrc` file:

```zsh
plugins=(... kustomize)
```

3. Open a new shell or source your `.zshrc` file.

## Aliases

| Alias    | Command                                                                        | Description                                                                                      |
| :------- | :----------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------- |
| `kz`     | `kustomize`                                                                    | Runs kustomize, you can pass the subcommands you want, i.e. `kz build`                            |
| `kzb`    | `kustomize build`                                                              | Runs kustomize build, you can pass more flags and arguments to the command, like the folder.    |
| `kzby`   | `kustomize build <args> \| yq -P -C`                                           | Will run kustomize build and pipe the output to [`yq`](https://github.com/mikefarah/yq) for YAML highlighting.                        |
| `kzba`   | `kustomize build <args> \| kubectl apply -f -`                                 | Will run kustomize build and pipe the output to `kubectl apply`.                                 |
| `kzbas`  | `kustomize build <args> \| kubectl apply -f - --server-side`                   | Will run kustomize build and pipe the output to `kubectl apply --server-side`.                   |
| `kzbasf` | `kustomize build <args> \| kubectl apply -f - --server-side --force-conflicts` | Will run kustomize build and pipe the output to `kubectl apply --server-side --force-conflicts`. |
| `kzbdel` | `kustomize build <args> \| kubectl delete -f - `                               | Will run kustomize build and pipe the output to `kubectl delete`.                                |
| `kzc`    | `kustomize create`                                                             | Runs `kustomize create`                                                                          |
| `kzca`   | `kustomize create --autodetect`                                                | Runs `kustomize create --autodetect`                                                             |
| `kzcar`  | `kustomize create --autodetect --recursive`                                    | Runs `kustomize create --autodetect --recursive`                                                 |
| `kze`    | `kustomize edit`                                                               | Runs `kustomize edit`                                                                            |
| `kzv`    | `kustomize version`                                                            | Runs `kustomize version`                                                                         |

## Honorable mention

This plugin is heavily based on the [official oh-my-zsh `kubectl` plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl).
