#!/bin/sh

PROJECTS_FILE=$HOME/gtags_projects

if [ -f $PROJECTS_FILE ]; then

    OPTS="--gtagsconf ${HOME}/gtags.conf"

    while read project
    do
        if [ -d $project ]; then
            cd $project
            echo "`date +'%Y/%m/%d %H:%M:%S'`: start update gtags for directory $project"
            /usr/local/bin/gtags ${OPTS}
            echo "`date +'%Y/%m/%d %H:%M:%S'`: finished update gtags for directory $project [$?]"
        else
            echo "$project not found"

        fi
    done < $PROJECTS_FILE

fi

exit $?
