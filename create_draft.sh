#!/bin/bash

# Usage: ./new_draft.sh "My Blog Post Title"

# Exit if no title is provided
if [ -z "$1" ]; then
  echo "Usage: $0 \"Post Title\""
  exit 1
fi

# Variables
TITLE="$1"
DATE=$(date '+%Y-%m-%d')
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:] ' | tr ' ' '-')
FILENAME="content/${SLUG}.md"

# Write template to file
cat > "$FILENAME" <<EOF
Title: $TITLE
Category: 
Date: $DATE
Author: Anthony
Status: draft

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-FYDC27JYB4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-FYDC27JYB4');
</script>
EOF

echo "Draft created: $FILENAME"
