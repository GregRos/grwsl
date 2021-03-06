function getResolution -d "returns 1440 or 1080"
    if xdpyinfo | grep -B 2 resolution | string collect | string match -e "1440 pixels" >/dev/null
        echo 1440
    else
        echo 1080
    end
end

function cdls 
    cd $argv[1]
    ls -la
end

function wrun 
    cmd.exe /c "$argv"
end

function git-prompt-hint
    echo "
● - staged
◧ - modified
◇ - untracked
⚑ - stash
✖ - invalid
✔ - clean
    "

end


# https://github.com/fish-shell/fish-shell/issues/2847
# Provide a menu of the directories recently navigated to and ask the user to
# choose one to make the new current working directory (cwd).

function mcd --description "Menu based cd command"
    set -l letters a b c d e f h i j k l m n o p q r s t u v w x y z
    set -l all_dirs $dirprev $dirnext
    if not set -q all_dirs[1]
        echo 'No previous directories to select. You have to cd at least once.'
        return 0
    end

    # Reverse the directories so the most recently visited is first in the list.
    # Also, eliminate duplicates; i.e., we only want the most recent visit to a
    # given directory in the selection list.
    set -l uniq_dirs
    for dir in $all_dirs[-1..1]
        if not contains $dir $uniq_dirs
            set uniq_dirs $uniq_dirs $dir
        end
    end

    set -l dirc (count $uniq_dirs)
    if test $dirc -gt (count $letters)
        set -l msg 'This should not happen. Have you changed the cd function?'
        printf (_ "$msg\n")
        set -l msg 'There are %s unique dirs in your history' \
            'but I can only handle %s'
        printf (_ "$msg\n") $dirc (count $letters)
        return 1
    end

    for i in (seq $dirc -1 1)
        set -l dir $uniq_dirs[$i]
        set -l label_color normal
        set -q fish_color_cwd; and set label_color $fish_color_cwd
        set -l dir_color
        set -l dir_color_reset (set_color normal)
        if test "$dir" = "$PWD"
            set dir_color (set_color $fish_color_history_current)
        end
        set -l home_dir (string match -r "$HOME(/.*|\$)" "$dir")
        if set -q home_dir[2]
            set dir "~$home_dir[2]"
        end
        printf '%s %s %2d) %s %s%s%s\n' (set_color $label_color) $letters[$i] \
            $i (set_color normal) $dir_color $dir $dir_color_reset
    end

    read -l -p 'echo "Select directory by letter or number: "' choice
    if test "$choice" = ""
        return 0
    else if string match -q -r '^[a-z]$' $choice
        set choice (contains -i $choice $letters)
    end

    if string match -q -r '^\d+$' $choice
        if test $choice -ge 1 -a $choice -le $dirc
            cd $uniq_dirs[$choice]
            return
        else
            echo Error: expected a number between 1 and $dirc, got {$choice}
            return 1
        end
    else
        echo Error: expected a number between 1 and $dirc or letter in that range, got {$choice}
        return 1
    end
end

function jetbrains_setup_fonts
    set -l options $argv[1]
    echo "Setting up fonts for $options"
    set big $BIG_MONITOR
    
    if test "$BIG_MONITOR" = 1
        set editor_font 18
        set font_size 20
    else
        set editor_font 15
        set font_size 16
    end

    edit_xml_file $options/editor-font.xml "//option[@name='FONT_SIZE']/@value" $editor_font
    edit_xml_file $options/other.xml "//option[@name='fontSize']/@value" $font_size
    echo "Done..."
end

function edit_xml_file
    set file $argv[1]
    set xpath $argv[2]
    set value $argv[3]
    set new_xml (cat $file \
        | xmlstarlet fo -D \
        | xmlstarlet ed -u "$xpath" -v $value \
        | string collect)

    if test -n "$new_xml"
        echo "$new_xml" >"$file"
    else
        echo "In edit_xml_file - result is empty"
    end
end


function jetbrains_setup_fonts
    set -l options $argv[1]
    echo "Setting up fonts for $options"
    set big $BIG_MONITOR

    if test "$BIG_MONITOR" = 1
        set editor_font 18
        set font_size 20
    else
        set editor_font 15
        set font_size 16
    end

    edit_xml_file $options/editor-font.xml "//option[@name='FONT_SIZE']/@value" $editor_font
    edit_xml_file $options/other.xml "//option[@name='fontSize']/@value" $font_size
    echo "Done..."
end

function realwhich
    realpath (which $argv)
end