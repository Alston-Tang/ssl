#!/bin/bash
set -x

. ./config.sh

if [[ -z "${DOMAIN}" ]]; then
	echo "set DOMAIN in config.sh"
	exit -1
fi

. ./check_acme.sh

if [[ -z "${OUTPUT}" ]]; then
	OUTPUT="${ACME_DIR}/${DOMAIN}"
fi

echo "save generated certificate to ${OUTPUT}"


if [ "$ACTION" == "ISSUE" ]; then
	echo "issue new certificate for domain ${DOMAIN}"
	${ACME_PATH} --issue --dns dns_cf -d "${DOMAIN}" --server zerossl
elif [ "$ACTION" == "RENEW" ]; then
	echo "renew certificate for domain ${DOMAIN}"
	${ACME_PATH} --renew --force --dns dns_cf -d "${DOMAIN}" --server zerossl
else
	echo "invalid action ${ACTION}"
	exit -1
fi

TMP_OUTPUT="${ACME_DIR}/${DOMAIN}"
if [[ "$TMP_OUTPUT" != "$OUTPUT" ]]; then
	mv -f "${TMP_OUTPUT}" "${OUTPUT}"
fi	


