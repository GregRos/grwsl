begin
    set -gx XDG_RUNTIME_DIR /tmp/runtime-gr/
    set -gx KDEDIR /usr
    set -gx QT_STYLE_OVERRIDE breeze
    set -gx XCURSOR_SIZE 64
    set -gx QT_SCALE_FACTOR 0.8
    set -gx QT_FONT_DPI 196
    # We need to rexport it here for some reason
    set -gx DISPLAY "$DISPLAY"
    set -gx GDK_SCALE 2
end
