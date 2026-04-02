#!/bin/bash

# Directory to clean
DIR="/app/Data"

# Find and delete files and directories older than 24 hours
find "$DIR" -mindepth 1 -mmin +1440 -delete

