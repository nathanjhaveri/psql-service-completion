#!/usr/bin/env bash
_psql_completions()
{
    local word=${COMP_WORDS[COMP_CWORD]}
    #local line=${COMP_LINE}
    local complete_service=false
    local prev="${COMP_WORDS[COMP_CWORD-1]}"
    local prevprev="${COMP_WORDS[COMP_CWORD-2]}"

    case "${prevprev}${prev}" in
    service=)
        complete_service=true
        ;;
    psqlservice)
        complete_service=true
        word='' # Complete the line "psql service=" with all positibilites
        ;;
    esac

    if [ $complete_service = true ] ; then
        COMPREPLY+=($(compgen -W "$(sed -n 's/\[\(.*\)\]/\1/p' ~/.pg_service.conf)" -- "${word}"))
    fi
}

complete -o default -F _psql_completions psql

