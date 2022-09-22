#! /bin/bash

set -x

ACME_DIR="${HOME}/.acme.sh"
ACME_PATH="${ACME_DIR}/acme.sh"
ACME_EXITS=false

if ! test -f "$ACME_PATH"; then
	echo "acme.sh not found. try to get online."
	curl https://get.acme.sh | sh
else
	ACME_EXISTS=true
fi

if [ "$ACME_EXISTS" = false ] && ! test -f "$ACME_PATH"; then
	echo "failed to get acme.sh. stop."
	exit -1
else
	echo "use acme.sh at ${ACME_PATH}"
fi

	
