<a href="https://www.imperial.ac.uk/optimisation-and-machine-learning-for-process-engineering/about-us/">
<img src="https://avatars.githubusercontent.com/u/81195336?s=200&v=4" alt="Optimal PSE logo" title="OptimalPSE" align="right" height="150" />
</a>

# project initialisation
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 

This bash script will instantiate a folder for an academic python project. It will: 

1. Initialise a new git repository for the project;
2. Construct a basic ```README.md``` for the project and documentation;
3. Create a [reccomended python project file structure](https://docs.python-guide.org/writing/structure/);
4. Create additional folders for literature, preprints, slides and papers (these are ignored by git);
5. Clone the ArXiv preprint template into the preprint folder (as a git submodule);
6. Create a Conda environment for the project, and a respective ```environment.yml``` file containing basic packages;
7. Include [black](https://github.com/psf/black) and [flake8](https://github.com/PyCQA/flake8) python formatter and style guide within git hooks, ensuring that these are included within pre-commit checks; 
8. Associate the MIT License to the project;
9. Push changes to the ```main``` branch, and create and switch to a ```develop``` branch following the [gitflow branching model](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

## usage 

```$ bash project_init.sh``` 

## requirements
- Unix based



