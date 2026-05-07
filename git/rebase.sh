#!/bin/sh

# Get one argument: the branch to rebase on.
# Default to "develop".

if [ -z "$1" ]; then
  echo
  echo "Please specify the target branch as unique argument."
  echo
  exit 1
fi

CURRENT=`git branch --show-current --no-color`
TARGET=$1
BASE=`git merge-base "$TARGET" "$CURRENT"`

header() {
  local padding=$(printf '%*s' $((65 - ${#1})) '' | tr ' ' '-')
  echo "--- $1 $padding"
}

echo
echo Rebasing \"$CURRENT\" onto \"$TARGET\"...
echo
git checkout $TARGET
git pull
git checkout $CURRENT
echo
header "$BASE"
git log --oneline -3 $BASE
header "$TARGET"
git log --oneline -3 $TARGET
header "$CURRENT"
git log --oneline -3 $CURRENT
echo ---------------------------------------------------------------------
echo
echo "    +--- $(git rev-list --count $BASE..$CURRENT) commits --- $CURRENT"
echo "    |"
echo $BASE
echo "    |"
echo "    +--- $(git rev-list --count $BASE..$TARGET) commits --- $TARGET"
echo

bold=$(tput bold)
normal=$(tput sgr0)

COUNT=$(git rev-list --count $BASE..$CURRENT)
if [ "$COUNT" -gt 1 ]; then
  echo "You have several commits after the common base."
    read -p "Do you want to squash them (Y/n)?" choice
    case "$choice" in 
        y|Y ) echo && git reset --soft "$BASE" && git commit -a --no-verify;;
    esac  
fi


read -p "Do you want to rebase \"${bold}$CURRENT${normal}\" onto \"${bold}$TARGET${normal}\" (Y/n)?" choice
case "$choice" in 
  n|N ) echo "Aborted!";;
  * ) git rebase "$TARGET";;
esac

