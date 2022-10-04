
begin
    if status is-login
        set -gx XDG_RUNTIME_DIR /tmp/runtime-gr
        # this fixes bad spacing on the char
        fish_add_path -P /usr/local/go/bin \
            "$HOME/.config/yarn/global/node_modules/.bin" \
            "$HOME/.local/bin" \
            "$HOME/.fnm" \
            "$HOME/grwsl/system/tools" \
            "$HOME/grwsl/apps"

        set -gx WINTOOLS /mnt/c/Users/GregRosenbaum/Dropbox/__Wintools        
        set -gx GOPATH $HOME/go
        set -gx NPM_TOKEN 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
        set -gx GCLOUD_ROOT /usr/lib/google-cloud-sdk

        /home/gr/.fnm/fnm env --use-on-cd | source # fnm
        fnm env | source
        # eval (minikube docker-env --shell=fish)
        # set -gx DOCKER_CERT_PATH (wslpath -u (DOCKER_CERT_PATH))
    end
end
