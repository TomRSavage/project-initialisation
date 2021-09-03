read -p "Enter name of project: " project_folder
mkdir -p $project_folder
cd $project_folder 
git init .
touch .gitignore 
touch README.md 
echo "<a href=\"https://www.imperial.ac.uk/optimisation-and-machine-learning-for-process-engineering/about-us/\">" >> README.md
echo "<img src=\"https://avatars.githubusercontent.com/u/81195336?s=200&v=4\" alt=\"Optimal PSE logo\" title=\"OptimalPSE\" align=\"right\" height=\"150\" />" >> README.md
echo "</a>" >> README.md
echo "
# $project_folder" >> README.md
echo "
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) " >> README.md
git submodule add https://github.com/kourgeorge/arxiv-style.git
mv arxiv-style preprint
cd preprint
rm template.pdf
touch README.md 
echo "# Instructions" >> README.md
echo " Upload the contents of this folder to Overleaf" >> README.md
echo " When preprint is finalised, save the contents to this folder" >> README.md
rm README.md
rm License.txt 
rm .gitignore 
cd - 
rm -R .gitmodules
mkdir literature 
mkdir slides
mkdir paper 
mkdir $project_folder
echo "literature/" >> .gitignore
echo "slides/" >> .gitignore
echo "preprint/" >> .gitignore
echo "paper/" >> .gitignore
env_tag="_env"
yes | conda create -n "$project_folder$env_tag" numpy pandas matplotlib black 
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate "$project_folder$env_tag"
pip install "jax[cpu]"
pip install pre-commit 
pip install pytest
touch .pre-commit-config.yaml
echo "repos:" >> .pre-commit-config.yaml
echo "-   repo: https://github.com/ambv/black" >> .pre-commit-config.yaml
echo "    rev: stable" >> .pre-commit-config.yaml
echo "    hooks:" >> .pre-commit-config.yaml
echo "    -   id: black" >> .pre-commit-config.yaml
echo "        language_version: python3" >> .pre-commit-config.yaml
echo "-   repo: https://gitlab.com/pycqa/flake8" >> .pre-commit-config.yaml
echo "    rev: 3.7.9" >> .pre-commit-config.yaml
echo "    hooks:" >> .pre-commit-config.yaml
echo "    - id: flake8" >> .pre-commit-config.yaml
touch .flake8
echo "[flake8]" >> .flake8
echo "ignore = W503" >> .flake8
echo "max-line-length = 89" >> .flake8
echo "max-complexity = 18" >> .flake8
echo "select = B,C,E,F,W,T4,B9" >> .flake8
echo ".pre-commit-config.yaml" >> .gitignore
conda env export > environment.yml
echo ".flake8" >> .gitignore
mkdir docs
mkdir tests
cd tests
touch __init__.py
cd - 
touch setup.py
current_year=$(date +'%Y')
touch LICENSE
echo "
MIT License

Copyright (c) $current_year OptiMaL-PSE-Lab

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
" >> LICENSE
cd docs 
touch README.md 
cd - 
cd $project_folder 
touch __init__.py
touch main.py 
touch utils.py
pre-commit install
pre-commit autoupdate
git add -A
git commit -m "main: initialised project folder"
git checkout -b develop
