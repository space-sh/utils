#
# Copyright 2016 Blockie AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#================================
# UTILS_DEP_INSTALL
#
# Do nothing, but conform to the
# /_dep_install/ pattern.
#
#================================
UTILS_DEP_INSTALL ()
{
    SPACE_CMDDEP="PRINT"
    PRINT "No particular dependencies." "ok"
}

#================================
# UTILS_WAITFORFILE
#
# Wait for one or more files until return.
# Optionally using timeout.
#
# Parameters:
#   $1: list of file paths
#   $2: timeout in seconds (optional)
#
# Returns:
#   0: success
#   1: time out
#
#================================
UTILS_WAITFORFILE ()
{
    SPACE_SIGNATURE="files [timeout]"
    SPACE_CMDDEP="PRINT"

    local filelist="${1}"
    shift

    local timeout="${1-}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Wait for files: ${filelist}, timeout: ${timeout}." "debug"

    local timeoutc="-1" file=''
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
                continue  # Wait for the same file.
            fi
            break  # Wait for the next file.
        done
        PRINT "Found file: ${file}." "debug"
    done
}

#================================
# UTILS_SLEEP
#
# Sleep for number of seconds or indefinitely.
#
# Parameters:
#   $1: timeout in seconds
#
# Returns:
#   Non-zero on error.
#
#================================
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

