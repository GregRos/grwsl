

if status is-interactive
    kubectl completion fish | source
    set -l code (bass (dircolors "$GRWSL/config/themes/.dircolors"))
    eval "$code"
end