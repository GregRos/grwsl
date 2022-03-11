begin
    set -x DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')":0"
    set -gx XDG_RUNTIME_DIR /tmp/runtime-gr/
    set -gx KDEDIR /usr
    set -gx QT_STYLE_OVERRIDE breeze

    if test "$BIG_MONITOR" = 1
        set -gx GDK_DPI_SCALE 1.3
        set -gx QT_SCALE_FACTOR 0.8
        set -gx QT_FONT_DPI 192
        set -gx XCURSOR_SIZE 64
    else
        set -gx GDK_DPI_SCALE 1.0
        set -gx QT_SCALE_FACTOR 1.3
        set -gx QT_FONT_DPI 92
        set -gx XCURSOR_SIZE 32
    end

end
