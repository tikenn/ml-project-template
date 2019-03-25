#!/bin/bash
#
# --------------------------------------------------------------------------------------------
# Machine Learning Project Iteration Creator
# --------------------------------------------------------------------------------------------
# Automatically adds an additional iteration's directory structure to a machine learning
# project for continuing with model-building.  Assumes the existence of a model
# building folder specified in the configurations
# 
# --------------------------------------------------------------------------------------------
# Author Info
# --------------------------------------------------------------------------------------------
# Name :: Tim Kennell Jr. ~ tikenn
#
# --------------------------------------------------------------------------------------------
# Config
# --------------------------------------------------------------------------------------------
# MODEL_DIR :: the directory for containing model-building iterations
#
# ~ tikenn

MODEL_DIR='train'
ITERATION_PREFIX='iteration'

next_iteration_number=''
previous_iteration_dir=''

# Determine next iteration
if [[ $(find "$MODEL_DIR" -type d | wc -l) = 1 ]] ; then
    iteration_number=1
else
    OIFS=$IFS
    IFS=$'\n'

    iteration_array=($(find "$MODEL_DIR" -maxdepth 1 -type d -not -path '\.' | sort -V))
    previous_iteration_dir=${iteration_array[${#iteration_array[@]} - 1]}
    next_iteration_number=$((${previous_iteration_dir#"$MODEL_DIR/$ITERATION_PREFIX" } + 1))
    
    IFS=$OIFS
fi

# New training directories for iterating through machine learning process
[[ -d "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/feature_exploration" ]] || mkdir -p "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/feature_exploration" 
[[ -d "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/log" ]] || mkdir -p "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/log" 
[[ -d "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/results" ]] || mkdir -p "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/results" 
[[ -d "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/visualizations" ]] || mkdir -p "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/visualizations" 

# copy the previous model for iteration purposes
if ! [[ -z "$previous_iteration_dir" ]] ; then
    cp -r "$previous_iteration_dir/model" "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/model"

# first iteration, just create a model directory
else
    [[ -d "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/model" ]] || mkdir -p "$MODEL_DIR/$ITERATION_PREFIX $next_iteration_number/model" 
fi
