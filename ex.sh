#!/bin/sh

echo "Copying file to current directory"
cp ~/Desktop/My\ Ever\ Note.txt ~/Desktop/haha/ 

DIRECTORY="/home/${USER}/Desktop/haha/.git"
COMMIT_MESSAGE="Committing changes: $(date)"

[ -d "$DIRECTORY" ] && echo "Directory: ${DIRECTORY} exists."
[ ! -d "$DIRECTORY" ] && echo "Directory: ${DIRECTORY} does not exist."

echo "Are you okay to go ahead with the following commit message (Y/N)?"
echo "${COMMIT_MESSAGE}"
read RESPONSE

if [ $RESPONSE == "Y" ]; then
	if [ ! -d "$DIRECTORY" ]; then
		echo "Error: The current folder is not a valid git repository"
		git init
		echo "Initialized a git repository"
		git remote add origin https://github.com/aditya2272sharma/CharlesAugustusMagnussen.git
	else
		echo "The current folder is a valid git repository"
		git pull --rebase		
		git add .
		git commit -m "$COMMIT_MESSAGE"
		git push origin master
	fi
fi


