# ML Project Template
Provides a directory structure for a single machine learning project.  While the machine learning process is fluid, the idea for this architecture is to provide both a starting point for a project and logical locations to store a majority of the files and data throughout the process.  High level directories such as `lib/` and `data/` are meant to store globally accessible scripts and data.  

## Quicklinks
* [Quickstart](#quickstart)
* [Environment](#environment)
* [Initialization](#initialization)
* [Directory Architecture](#directory-architecture)
* [Automation](#automation)


# Quickstart
1. Download repository
2. Run `bash initialize_new_project.sh`
3. Start machine learning
---
4. (new iteration) Run `bash create_additional_iterations.sh`


# Environment
The directory structure is agnostic to the computer system environment; however, some of the environment setup scripts take advantage of some standard (and some not-so-standard) machine learning packages.  These are list below with an explanation of their use.

* [bash](https://www.gnu.org/software/bash/):  shell language that runs the scripts
* [anaconda](https://www.anaconda.com/distribution/): data science python library
* [nodejs](https://nodejs.org/en/): server-side javascript that can be downloaded with conda or separately
* [npm](https://www.npmjs.com/): standard package manager for nodejs


# Initialization
To provide an easy method of getting an environment setup, a simple initialization script is provided.  However, if the environment being used is in conflict with the above described or the initialization described below is undesirable, feel free to skip this section.

## Conda Environment
One of the processes the initialization script performs is the setup of a [conda environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html).  By doing so, it provides several key benefits.

1. Separate environment for installing packages
2. Tracking of all python project dependencies

## NodeJS Environment
Another process is to set up a separate nodejs environment.  This environment is a more unusual component of this architecture.  However, if nodejs is used in the project, this environment provides many of the same advantages for nodejs that [conda environments](#conda-environment) provide for python.

# Directory Architecture
The architecture in this repository is a template for creating machine learning projects.  Each of the directories are presented below with an explanation for what its primary purpose is and what type of files it should contain.

## Config
Provides a location for storing generic configurations as *data* to be used across (functional components should be stored in [lib/](#lib))
* **Examples**
    * Database connection parameters
    * RESTful API connection parameters
    * Visualization printout parameters

## Data
Stores the data to be used in constructing the machine learning models or the queries to a database for retrieving the data in the exact form used in the model

## Datasets
Stores any scripts that create processed datasets.  The data itself should be stored in [data/](#data) or a database with a query into the database stored in [data/](#data)

## Lib
A location for storing generally useful functions and objects.  Any functions or objects placed here should be globally useful in multiple circumstances (or potentially should be).  The directory contains several subdirectories for organization of this functionality.  Additionally, each one contains an `__init__.py` file for indicating a package folder to python.

* `lib/`
    * `data/`
    * `database/`
    * `features/`
    * `models/`
    * `visualizations/`

<table>
    <tr>
        <th>Directory</th>
        <th>Purpose</th>
    </tr>
    <tr>
        <td><code>data/</code></td>
        <td>General functions for interacting with data</td>
    </tr>
    <tr>
        <td><code>database/</code></td>
        <td>General functions/objects for interacting with databases such as database connection object.  <strong>NOTE</strong>: should NOT contain configurations for connection to a specific database as that is reserved for <a href="#config">config/</a></td>
    </tr>
    <tr>
        <td><code>features/</code></td>
        <td>General functions for processing features or performing any feature engineering</td>
    </tr>
    <tr>
        <td><code>models/</code></td>
        <td>Functions/objects for assisting with the model-building process (e.g. generic pipelines or training regiments)</td>
    </tr>
    <tr>
        <td><code>visualizations/</code></td>
        <td>Functions/objects for assisting with graphical output of the model.  <strong>NOTE</strong>: should NOT contain information for where to store images as that should take place in <code>visualizations/</code> folder under <a href="#train">train/</a>.  Custom locations should be listed in the <a href="#config">config/</a> directory.</td>
    </tr>
</table>


## Log
General log directory for storing information from any process not directly related to model construction (e.g. dataset creation).

## Train
Contains the functional model-building components of system.  Because model-building is an iterative process, each with its own output that needs to be stored, the directory is filled with subdirectories ordering the iterations.  The remaining structure is as follows

* `iteration 1/`
    * `feature_exploration/`
    * `log/`
    * `model/`
    * `results/`
    * `visualizations/`
    * `processed_data/`

<table>
    <tr>
        <th>Directory</th>
        <th>Purpose</th>
    </tr>
    <tr>
        <td><code>feature_exploration/</code></td>
        <td>Scripts for any feature engineering</td>
    </tr>
    <tr>
        <td><code>log/</code></td>
        <td>Logs any output during the model-building process for purposess of monitoring or debugging</td>
    </tr>
    <tr>
        <td><code>model/</code></td>
        <td>Contains the script that trains the model using a dataset from the <a href="#data">data/</a> folder</td>
    </tr>
    <tr>
        <td><code>results/</code></td>
        <td>Stores textual and numerical results for the model including final output and monitoring results.  This directory may contain any output from the <code>model/</code> folder or any scripts that process the results in a more pallitable <strong>text</strong> format. This location might also be appropriate for jupyter notebook files for both text <strong>and</strong> visual results.</td>
    </tr>
    <tr>
        <td><code>visualizations/</code></td>
        <td>Graphical or other visual representations of model output, including results, model-building monitoring, and architecture diagrams.  May contain any visual output from the <code>model/</code> folder or any scripts that process results into a visual format.</td>
    </tr>
    <tr>
        <td><code>processed_data/</code></td>
        <td>Contains either the data files themselves (*.tsv, *.csv, etc.) or the scripts to create the data files/database tables for the final processed data to be run in the model.  This folder might not be necessary (global datasets might be sufficient), but it exists to provide an option.</td>
    </tr>
</table>

# Automation
Setting up NodeJS and python environments as well as creating multiple directories for each iteration involves several cumbersome steps.  Additionally, it is easy to forget something small in the process.  Therefore, a few scripts are provided for automating these processes.  Both of these scripts assume a `bash` environment.

## `initialize_new_project.sh`
This script is extremely simple in that it only sets up a NodeJS project and conda environment based on the project name.  However, these steps are easy to forget and are essential to creating easily replicable machine learning environment.

## `create_additional_iterations.sh`
This script automates setup of additional iterations, which would involve the creation of several directories.  The script pulls all directories in the training directory, finds the last iteration (highest numbered directory), and creates a new one incremented by one.