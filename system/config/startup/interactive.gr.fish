if status is-interactive
    set -l code (bass (dircolors "$GRWSL/config/themes/.dircolors"))
    eval "$code"
end