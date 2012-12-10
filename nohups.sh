# source this within .bashrc

a () { nohups "$@" ; }
sudoa () { sudo -i "`which nohups`" "$@" ; }
_complete_a () {
    cur="${COMP_WORDS[$COMP_CWORD]}"
    if [ $COMP_CWORD = 1 ]; then
	#echo "Trying -c"
	TEMPREPLY="$(compgen -c "$cur")"
    else
	#echo "Trying -f"
	TEMPREPLY="$(compgen -f "$cur")"
    fi

    #declare -a COMPREPLY # makes it not work!
    COMPREPLY=()

    # this exploits the fact that the output of compgen is newline-separated
    # if any filenames contain newlines, it will break
    {
	i=0
	while read LINE; do
	    COMPREPLY[$i]="$LINE"
	    #echo "Got $i: ${COMPREPLY[$i]}"
	    i=$((i+1))
	done
	#echo ${#COMPREPLY[@]}
    } < <( echo "$TEMPREPLY" )

    #echo $i
    #echo ${#COMPREPLY[@]}
    #i=0
    #while [ -n "${COMPREPLY[$i]}" ]; do
	#echo "$i: ${COMPREPLY[$i]}"
	#i=$((i+1))
    #done
}
complete -F _complete_a a sudoa
#complete -c -d -f a sudoa
