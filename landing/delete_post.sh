#!/bin/bash
# Script to delete posts generated by new_post.sh
# Posts must be _posts and have the extension ".md"
# Any images for posts must be located in assets/images/[post name]
# The script must be run from the root of the jekyll project

if [ $# -ne 1 ]
then
    echo -e "Illegal number of parameters\n"
    echo -e "Usage:\n$0 [post]"
    exit 1
fi

if [ ! -f $1 ]
then
    echo -e "$1 is not a valid file\n"
    echo -e "Usage:\n$0 [post]"
    exit 2
fi

dir_names=$(dirname $1)
file_name=$(basename $1)

if [ ! $dir_names = *"_posts" ] || [ ! ${file_name: -3} = ".md" ]
then
    echo -e "$1 is not a valid post in the _posts directory"
    echo -e "Usage:\n$0 [post]"
    exit 3
fi

if [ -d ./assets/images/$(basename $1 .md) ]
then
    rm -rf ./assets/images/$(basename $1 .md)
fi

rm $1
