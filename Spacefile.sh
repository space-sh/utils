#================================
# UTILS_DEP_INSTALL
#
# Do nothing, but conform to /_install/ pattern.
#
#================================
UTILS_DEP_INSTALL ()
{
    SPACE_CMDDEP="PRINT"
    PRINT "No particular dependencies." "success"
}

UTILS_WAITFORFILE ()
{
    SPACE_SIGNATURE="files [timeout]"
    SPACE_CMDDEP="PRINT"

    local filelist='' file=''
    filelist="${1}"
    shift

    local timeout="${1-}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Wait for files: ${filelist}, timeout: ${timeout}." "debug"

    local timeoutc="-1"
    for file in ${filelist}; do
        PRINT "Waiting for file: ${file}." "debug"
        while :; do
            if [ ! -f "${file}" ]; then
                if [ -n "${timeout}" ]; then
                    timeoutc=$((timeoutc+1))
                    if [ "${timeoutc}" -ge "${timeout}" ]; then
                        PRINT "Wait for files timeouted after ${timeoutc} seconds." "info"
                        return 1
                    fi
                fi
                sleep 1
                continue
            fi
            break
        done
        PRINT "Found file: ${file}." "debug"
    done
}

UTILS_SLEEP ()
{
    # shellcheck disable=2034
    SPACE_SIGNATURE="[seconds]"
    # shellcheck disable=2034
    SPACE_CMDDEP="PRINT"

    local duration="${1:-0}"
    shift $(( $# > 0 ? 1 : 0 ))

    if [ "${duration}" -eq 0 ]; then
        # Sleep forever
        PRINT "Sleep forever ..." "debug"
        tail -f /dev/null
    else
        PRINT "Sleep for ${duration} seconds ..." "debug"
        sleep "${duration}"
    fi
}
