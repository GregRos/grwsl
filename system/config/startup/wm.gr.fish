begin
    set -gx XDG_RUNTIME_DIR /tmp/runtime-gr/
    set -gx KDEDIR /usr
    set -gx QT_STYLE_OVERRIDE breeze
    set -gx XCURSOR_SIZE 64
    set -gx QT_SCALE_FACTOR 0.9
    set -gx QT_FONT_DPI 196
    # We need to rexport it here for some reason
    set -gx DISPLAY "$DISPLAY"
    if test "$BIG_MONITOR" = 1
        set -gx GDK_DPI_SCALE 1.5
    end
end
