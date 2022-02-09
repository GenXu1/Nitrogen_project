# Welcome to `Genomic response to changed N condition in modern maize production` project

This is a research repo for our project entitled "**A historically balanced locus under recent directional selection in responding to changed nitrogen conditions during modern maize breeding**".

## Introduction
In this study, we investigated how the maize genome response to the changed N condition during maize breeding history. 

## Architecture about this Repo
A `largedata` directory was intentionally ignored by adding to `gitignore` because of the large size of the files within the folder. To guide the visitors having a better idea about the repo, here we briefly introduce the functions or sepecific purposes of the directory system. The layout of directories is based on the idea from [ProjectTemplate](http://projecttemplate.net/architecture.html). 

1. **cache**: Here we store intermediate data sets that are generated during a preprocessing step.
2. **data**: Here we store our raw data of small size. Data of large size, i.e. > 100M, store in a `largedata` folder that has been ignored using `gitignore`.
3. **reports**: Documentation codes for generating the figures.
5. **profilling**: Analysis scripts for the project. It contains some sub-directories.
6. **table**: Table produced during the study.


## License
This repo is free and open source for research usage, licensed under [GPLv2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).

