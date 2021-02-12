#!/bin/sh

#   Copyright 2021 InfAI (CC SES)
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


# Environment variables:
#
# $DEP_INSTANCE
# $JOB_CALLBACK_URL
# $source_file


output_file="$(cat /proc/sys/kernel/random/uuid | echo $(read s; echo ${s//-}))"
data_cache="/data_cache"


echo "removing duplicates ..."
if uniq "$data_cache/${source_file}" > "$data_cache/$output_file"; then
    head -5 "$data_cache/$output_file"
    echo "total number of lines written:" $(wc -l < "$data_cache/$output_file")
    if ! curl -s -S --header 'Content-Type: application/json' --data "{\""$DEP_INSTANCE"\": {\"output_csv\": \""$output_file"\"}}" -X POST "$JOB_CALLBACK_URL"; then
        echo "callback failed"
        rm "$data_cache/$output_file"
    fi
else
    echo "removing duplicates failed"
fi
