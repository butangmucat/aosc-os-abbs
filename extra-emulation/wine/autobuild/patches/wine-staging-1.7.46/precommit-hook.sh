#!/bin/bash
# Installation: ln -s ../../precommit-hook.sh .git/hooks/pre-commit

git diff --cached --name-status | while read status file; do
	if [[ "$file" =~ ^patches/ ]] || [[ "$file" =~ ^debian/tools/ ]] || [[ "$file" =~ ^debian/changelog ]]; then
		echo ""
		echo "*** UPDATING AUTOGENERATED FILES ***"
		echo ""
		debian/tools/patchupdate.py || exit 1
		break;
	fi
done