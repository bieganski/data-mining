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

DATA_NAME=example.jpg

URL=https://students.mimuw.edu.pl/~mb385162/$DATA_NAME

function get_data {
	wget $URL -O $DATA_NAME
	log "Data $DATA_NAME downloaded successfully..."
}

get_data
