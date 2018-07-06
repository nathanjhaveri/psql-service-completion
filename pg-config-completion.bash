#/usr/bin/env bash
_psql_completions()
{
    local word=${COMP_WORDS[COMP_CWORD]}
    local line=${COMP_LINE}
    local complete_service=false

    case "${line}" in
    *--service*)
        complete_service=true
        ;;
    esac

    if [ $complete_service = true ] ; then
        COMPREPLY+=($(compgen -W "$(sed -n 's/\[\(.*\)\]/\1/p' .pg_service.conf)" -- "${word}"))
    fi
}

complete -F _psql_completions psql
