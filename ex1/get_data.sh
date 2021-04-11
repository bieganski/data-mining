#!/bin/bash

set -e
set -u

function log {
	echo "=== $@"
}

function error {
	echo "=== ERROR: $@"
	exit 0
}

DATA_NAME=clash_royale_games_Jan_2019.7z

URL=https://students.mimuw.edu.pl/~mb385162/$DATA_NAME

function download_data {
	wget $URL -O $DATA_NAME
	log "Data $DATA_NAME downloaded successfully..."
}

function unpack_data {
	sudo apt install p7zip-full
	log "unpacking... $DATA_NAME"
	7z e $DATA_NAME
	DATA_NAME=${DATA_NAME%.*}.csv

	if ! [ -f $DATA_NAME ]; then
		error "unpacking seemed failed, no $DATA_NAME file found."
	else
		log "uncompressed filename: $DATA_NAME"
	fi
}

download_data
unpack_data
