#!/bin/bash
array=(${GIT_BASE_PATH}/.niogit/*)
for repo_path in "${array[@]}";
do cd ${repo_path};
repo_name=$(basename $repo_path)
echo "push to $repo_name"
git push --mirror ssh://git@${GIT_HOST}:722/drools/$repo_name
done
