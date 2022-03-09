begin
    fish_add_path -P /usr/local/go/bin \
        "/home/gr/.config/yarn/global/node_modules/.bin" \
        "/home/gr/.local/bin" \
        "/home/gr/.fnm" \
        /home/gr/scripts

    set -gx WINTOOLS (wslpath -u 'C:\Users\GregRosenbaum\Dropbox\__Wintools')
    set -gx GOPATH /home/gr/go
    set -gx NPM_TOKEN 64124ae3-05e2-4298-805c-1d8b19a4c2b3
    if status --is-login
        sudo service dbus start
    end
    set -gx GCLOUD_ROOT /usr/lib/google-cloud-sdk
end
