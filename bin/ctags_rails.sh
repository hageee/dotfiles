#!/bin/sh

PROJECTS_FILE=$HOME/ctags_rails_projects

if [ -f $PROJECTS_FILE ]; then

    while read project
    do
        if [ -d $project ]; then
            cd $project
            echo "`date +'%Y/%m/%d %H:%M:%S'`: start update ctags for directory $project"
            ctags -e app/**/*.rb lib/**/*.rb
            echo "`date +'%Y/%m/%d %H:%M:%S'`: finished update ctags for directory $project [$?]"
        else
            echo "$project not found"

        fi
    done < $PROJECTS_FILE

fi

exit $?
