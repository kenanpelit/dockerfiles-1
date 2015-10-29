#!/usr/bin/bash

set -o errexit -o noclobber -o noglob -o nounset -o pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CNAME="${1}"

source "${SCRIPTDIR}/var.sh"

docker create \
    --read-only \
    --volume="${CONFIGPATH}:/etc/nginx:ro" \
    --volume="${LIBPATH}:/var/lib/nginx:rw" \
    --volume="${LOGPATH}:/var/log/nginx:rw" \
    --volume="${RUNPATH}:/run/nginx:rw" \
    --volume="${PKGPATH}:/mnt/mirror/archlinux/nfnty/os/x86_64:ro" \
    --cap-drop 'ALL' \
    --cap-add 'NET_BIND_SERVICE' \
    --net='none' \
    --dns="${DNSSERVER}" \
    --name="${CNAME}" \
    --hostname="${CNAME}" \
    --memory="${MEMORY}" \
    --memory-swap='-1' \
    --cpu-shares="${CPU_SHARES}" \
    nfnty/arch-nginx:latest
