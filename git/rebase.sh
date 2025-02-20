#!/usr/bin/bash

# Get one argument: the branch to rebase on.
# Default to "develop".

CURRENT=`git branch --show-current --no-color`
TARGET=${1:-develop}

echo
echo Rebasing \"$CURRENT\" onto \"$TARGET\"...
echo
git checkout $TARGET
git pull
git checkout $CURRENT
echo
echo -------------------------------------------------------------------- Base commit
git log --oneline -3 `git merge-base "$TARGET" "$CURRENT"`
echo -------------------------------------------------------------------- $TARGET
git log --oneline -3 $TARGET
echo -------------------------------------------------------------------- $CURRENT
git log --oneline -3 $CURRENT
echo --------------------------------------------------------------------
echo

bold=$(tput bold)
normal=$(tput sgr0)

read -p "Do you want to rebase \"${bold}$CURRENT${normal}\" onto \"${bold}$TARGET${normal}\" (Y/n)?" choice
case "$choice" in 
  n|N ) echo "Aborted!";;
  * ) git rebase "$TARGET";;
esac
