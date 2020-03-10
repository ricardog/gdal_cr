#!/bin/sh -eu

if [ ! -z ${DOCKER_HOST+x} ]; then
    host=$(cut -d ':' -f1 <<<"$DOCKER_HOST")
    here='.'
    there="${host}":$(pwd)/

    while [ ! -z ${1+x} ]; do
	case $1 in
	    -r|--reverse)
		here="${there}"
		there='.'
		;;
	    -h|-\?|--help)
		echo "Usage: $(basename $0) --reverse"
		exit
		;;
	    -?*)
		echo "WARN: Unknown option (ignored): $1"
		;;
	    *)
		# Default case: If no more options then break out of the loop.
		break
	esac
	shift
    done

    rsync -avz --copy-links --exclude '*~' --exclude .git \
	  --exclude .gitignore --exclude .editorconfig --exclude .vagrant \
	  --exclude host "${here}" "${there}"
fi
