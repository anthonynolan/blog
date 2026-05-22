#!/bin/bash
set -e

COMMIT_MESSAGE="$*"

if [ -z "$COMMIT_MESSAGE" ]; then
  COMMIT_MESSAGE=$(date '+%Y-%m-%d %H:%M:%S %z')
fi

make publish

git add .
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "$COMMIT_MESSAGE"
fi
git push
aws s3 sync ./output/ s3://blog.cathalanddad.com/ --size-only
aws cloudfront create-invalidation --distribution-id E1PGDI3DG3VVR3 --paths "/*"
