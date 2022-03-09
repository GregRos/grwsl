begin
    fish_add_path -P /usr/local/go/bin \
        "$HOME/.config/yarn/global/node_modules/.bin" \
        "$HOME/.local/bin" \
        "$HOME/.fnm" \
        "$HOME/grwsl/system/tools" \
        "$HOME/grwsl/apps"

    set -gx WINTOOLS (wslpath -u 'C:\Users\GregRosenbaum\Dropbox\__Wintools')
    set -gx GOPATH $HOME/go
    set -gx NPM_TOKEN 64124ae3-05e2-4298-805c-1d8b19a4c2b3
    if status --is-login
        sudo service dbus start
    end
    set -gx GCLOUD_ROOT /usr/lib/google-cloud-sdk
end
