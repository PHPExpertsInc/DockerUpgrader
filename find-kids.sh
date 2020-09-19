#!/bin/env bash
# From https://stackoverflow.com/a/47557466/430062
# Mostly Copyright (c) 2017 Michael Linhard

get_kids() {
    local parent_id=$1
    docker inspect --format='ID {{.Id}} PAR {{.Parent}}' $(docker images -a -q) | grep "PAR ${parent_id}" | sed -E "s/ID ([^ ]*) PAR ([^ ]*)/\1/g"
}

find_actual_kids() {
    local parent_id=$1
    # sed with brackets: https://serverfault.com/a/828633/56309
    if [ -z "$2" ]; then
        parent_id=$(docker inspect --format '{{.Id}}' $1)
    else
        local tags=$(docker inspect --format='{{.RepoTags}}' ${parent_id}  | sed  's/[][]//g')
        if [ ! -z "$tags" ]; then
            echo " * ${tags}"
        fi
    fi

    local children=`get_kids "${parent_id}"`

    for c in $children;
    do
        find_actual_kids "$c" 1
    done
}

find_actual_kids "$1"
