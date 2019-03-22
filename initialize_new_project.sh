#!/bin/bash
#
# --------------------------------------------------------------------------------------------
# Machine Learning Project Directory and Environment Setup
# --------------------------------------------------------------------------------------------
# Automatically generates a basic scaffold for machine learning projects.  Sets up 
# the directory structure along with both a nodejs and python environment as well.
# Environment can be modified as needed with additional packages installed for both
# python and nodejs as well as additional directories being created.
# 
# --------------------------------------------------------------------------------------------
# Author Info
# --------------------------------------------------------------------------------------------
# Name :: Tim Kennell Jr. ~ tikenn
#
# --------------------------------------------------------------------------------------------
# Config
# --------------------------------------------------------------------------------------------
# LICENSE_FILE :: the location of the license file to attach to the project
#
# --------------------------------------------------------------------------------------------
# Setting up crontab
# --------------------------------------------------------------------------------------------
# - Create a file in /etc/cron.d/
# - Suggested to run the file once a week
# - Example line (runs at midnight): "0 0 * * 1 /path/to/le-renew-haproxy"
#
# ~ tikenn


# --------------------------------
# Get Project Name
# --------------------------------
PROJECT_NAME=''
while [[ -z ${PROJECT_NAME} ]] ; do
	read -p "Project name: " PROJECT_NAME
	[[ -z "${PROJECT_NAME}" ]] && echo "A project name must be supplied"
done

echo "Initializing project environmen for $PROJECT_NAME . . ."

# --------------------------------
# Setup NodeJS environment
# --------------------------------
npm init
npm install mysql

# --------------------------------
# Setup Python environment
# --------------------------------
conda_environment_name=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | sed -re 's/ /_/g')
conda create -n "$conda_environment_name"