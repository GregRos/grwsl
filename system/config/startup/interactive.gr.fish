function getResolution -d "returns 1440 or 1080"
    if xdpyinfo | grep -B 2 resolution | string collect | string match -e "1440 pixels" >/dev/null
        echo 1440
    else
        echo 1080
    end
end

if status is-interactive
    kubectl completion fish | source
    set -l code (bass (dircolors "$GRWSL/config/themes/.dircolors"))
    eval "$code"
end