if status is-interactive
    set -gx __fish_git_prompt_char_dirtystate " ◧"
    set -gx __fish_git_prompt_char_untrackedfiles " ◇"
    set -gx __fish_git_prompt_char_stashstate " ⚑"

    kubectl completion fish | source
    set -l code (bass (dircolors "$GRWSL/config/themes/.dircolors"))
    eval "$code"
end