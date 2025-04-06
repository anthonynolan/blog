set -x
git add .
git commit -m "$1"
git push
aws s3 sync ./output/ s3://blog.cathalanddad.com/ 
aws cloudfront create-invalidation --distribution-id E1PGDI3DG3VVR3 --paths "/*"
