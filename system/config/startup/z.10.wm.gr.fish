
begin
    if status is-login
        set -gx DISPLAY (gr-display)
        if test (getResolution) = 1440
            set -Ux BIG_MONITOR 1
        else
            set -Ux BIG_MONITOR 0
        end
        set -gx QT_STYLE_OVERRIDE breeze
        if test "$BIG_MONITOR" = 1
            set -gx GDK_DPI_SCALE 1.3
            set -gx QT_SCALE_FACTOR 0.8
            set -gx QT_FONT_DPI 192
            set -gx XCURSOR_SIZE 64
        else
            set -gx GDK_DPI_SCALE 1.3
            set -gx QT_SCALE_FACTOR 1.3
            set -gx QT_FONT_DPI 92
            set -gx XCURSOR_SIZE 32
        end

    end
end
