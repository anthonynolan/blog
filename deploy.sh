#!/bin/bash
set -e

COMMIT_MESSAGE="$*"

if [ -z "$COMMIT_MESSAGE" ]; then
  changed_posts=$(git status --porcelain -- content/*.md | awk '{print $2}')
  post_count=$(echo "$changed_posts" | sed '/^$/d' | wc -l)

  if [ "$post_count" -ne 1 ]; then
    echo "Usage: $0 \"Commit message\""
    echo "Or change exactly one content/*.md post so its Title can be used."
    exit 1
  fi

  changed_post=$(echo "$changed_posts" | sed '/^$/d')
  COMMIT_MESSAGE=$(sed -n 's/^Title:[[:space:]]*//p' "$changed_post" | head -n 1)

  if [ -z "$COMMIT_MESSAGE" ]; then
    echo "Could not find a Title field in $changed_post"
    exit 1
  fi
fi

git add .
git commit -m "$COMMIT_MESSAGE"
git push
aws s3 sync ./output/ s3://blog.cathalanddad.com/ --size-only
aws cloudfront create-invalidation --distribution-id E1PGDI3DG3VVR3 --paths "/*"
