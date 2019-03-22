# ML Project Template
Provides a directory structure for a single machine learning project.  While the machine learning process is fluid, the idea for this architecture is to provide both a starting point for a project and logical locations to store a majority of the files and data throughout the process.  High level directories such as `lib/` and `data/` are meant to store globally accessible scripts and data.  

## Quicklinks
* [Quickstart](#quickstart)
* [Environment](#environment)
* [Initialization](#initialization)


# Quickstart
1. Download repository
2. Run `bash initialize_new_project.sh`
3. Start machine learning


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
Another process is to set up a separate nodejs environment.  This environment is a more unusual component of this architecture.  However, if nodejs is used in the project, this environment provides many of the same advantages for nodejs that [conda environments](#conda_environment) provide for python.

