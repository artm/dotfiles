if [[ -z $PROMPT_COMMAND ]] ; then
  PROMPT_COMMAND="history -a"
elif [[ ! $PROMPT_COMMAND =~ "history -a" ]] ; then
  export PROMPT_COMMAND="history -a ; $PROMPT_COMMAND"
fi
export HISTCONTROL=ignoreboth
