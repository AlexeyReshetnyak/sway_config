#!/bin/bash
PROG=$( basename $0 )
case "$1" in     -h|--help)         echo "Usage: $PROG jump to a running program and focus it - else start it"         exit 0         ;;
esac
#target="$1"
target=firefox
class="$2"
runstring="$3"
[[ "$class" ]] || class="$target"
[[ "$runstring" ]] || runstring="$target"

pkill -0 $target || {
  eval $runstring &
  exit 0
}

swaymsg "[app_id=$target] focus" &>/dev/null || {
   swaymsg "[class=$class] focus" &>/dev/null
}

exit 0

